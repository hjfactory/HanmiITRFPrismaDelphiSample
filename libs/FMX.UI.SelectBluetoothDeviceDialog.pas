unit FMX.UI.SelectBluetoothDeviceDialog;

interface

uses
  System.Bluetooth,
  FMX.HardwareBackButtonController,
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects, FMX.ListBox;

type
  TSelectedDeviceProc = reference to procedure(ADeviceName, AAddress: string);
  TSelectBluetoothDeviceDialog = class(TFrame, IHwBackButtonListener)
    rctBackground: TRectangle;
    lytMessage: TLayout;
    lstBluetoothDevice: TListBox;
    btnScan: TButton;
    AniIndicator1: TAniIndicator;
    Rectangle1: TRectangle;
    procedure btnScanClick(Sender: TObject);
    procedure rctBackgroundClick(Sender: TObject);
  private
    class var
      FInstance: TSelectBluetoothDeviceDialog;
  private
    FBluetoothManager: TBluetoothManager;
    FAdapter: TBluetoothAdapter;

    FHeaderPaired,
    FHeaderAvailable: TListBoxGroupHeader;
    FIsScanning: Boolean;

    FSelectDeviceProc: TSelectedDeviceProc;

    FContainWord: string;
    procedure InitDefaultListHeader;

    procedure SearchPairedDevices;
    procedure SearchDiscoverDevices;
    procedure CancelDiscoverDevices;
    procedure DevicesDiscoveryEnd(const Sender: TObject; const ADevices: TBluetoothDeviceList);

    procedure DeviceItemClick(Sender: TObject);
    procedure SetIsScanning(const Value: Boolean);

    property IsScanning: Boolean read FIsScanning write SetIsScanning;
    procedure KeyUpHardwareBackButton(var KeyStop: Boolean);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class procedure OpenBluetoothDeviceList(ASelectDeviceProc: TSelectedDeviceProc);
    class procedure OpenBluetoothDeviceListFilter(AContainWord: string; ASelectDeviceProc: TSelectedDeviceProc);
    class procedure Cancel;
  end;

implementation

{$R *.fmx}

{ TSelectBluetoothDeviceDialog }

class procedure TSelectBluetoothDeviceDialog.OpenBluetoothDeviceList(ASelectDeviceProc: TSelectedDeviceProc);
begin
  if not Assigned(FInstance) then
    FInstance := Create(nil);
  FInstance.Parent := Application.MainForm;
  FInstance.Align := TAlignLayout.Contents;
  FInstance.BringToFront;
  FInstance.Visible := True;

  FInstance.FSelectDeviceProc := ASelectDeviceProc;
end;

class procedure TSelectBluetoothDeviceDialog.OpenBluetoothDeviceListFilter(
  AContainWord: string; ASelectDeviceProc: TSelectedDeviceProc);
begin
  OpenBluetoothDeviceList(ASelectDeviceProc);
  FInstance.FContainWord := AContainWord;
end;

procedure TSelectBluetoothDeviceDialog.rctBackgroundClick(Sender: TObject);
begin
  Cancel;
end;

constructor TSelectBluetoothDeviceDialog.Create(AOwner: TComponent);
begin
  inherited;

  THwBackButtonController.Instance.RegistListener(Self);

  FBluetoothManager := TBluetoothManager.Current;
  FAdapter := FBluetoothManager.CurrentAdapter;

  InitDefaultListHeader;
  SearchPairedDevices;
end;

destructor TSelectBluetoothDeviceDialog.Destroy;
begin
  THwBackButtonController.Instance.UnregistListener(Self);
  FInstance := nil;

  inherited;
end;

procedure TSelectBluetoothDeviceDialog.DeviceItemClick(Sender: TObject);
var
  Item: TListBoxItem absolute Sender;
begin
  if Assigned(FSelectDeviceProc) then
    FSelectDeviceProc(Item.Text, Item.ItemData.Detail);
  Cancel;
end;

procedure TSelectBluetoothDeviceDialog.InitDefaultListHeader;
begin
  lstBluetoothDevice.Clear;
  FHeaderPaired := TListBoxGroupHeader.Create(lstBluetoothDevice);
  FHeaderPaired.Text := 'Paired Devices';
  FHeaderPaired.Parent := lstBluetoothDevice;

  FHeaderAvailable := TListBoxGroupHeader.Create(lstBluetoothDevice);
  FHeaderAvailable.Text := 'Other Available Devices';
  FHeaderAvailable.Parent := lstBluetoothDevice;
end;

procedure TSelectBluetoothDeviceDialog.KeyUpHardwareBackButton(
  var KeyStop: Boolean);
begin
  Cancel;
  KeyStop := True;
end;

procedure TSelectBluetoothDeviceDialog.SearchPairedDevices;
var
  I: Integer;
  Device: TBluetoothDevice;
  Item: TListBoxItem;
  PairedDevices: TBluetoothDeviceList;
begin
  PairedDevices := FBluetoothManager.GetPairedDevices;

  lstBluetoothDevice.BeginUpdate;
  for I := FHeaderPaired.Index + 1 to FHeaderAvailable.Index - 1 do
    lstBluetoothDevice.Items.Delete(I);
  FHeaderAvailable.Index := 1;

  if PairedDevices.Count = 0 then
  begin
    Item := TListBoxItem.Create(lstBluetoothDevice);
    Item.StyleLookup := 'listboxitemstyle';
    Item.Text := 'No devices have been paired';
    Item.Parent := lstBluetoothDevice;
    Item.Index := FHeaderAvailable.Index;
  end
  else
  begin
    for Device in PairedDevices do
    begin
      Item := TListBoxItem.Create(lstBluetoothDevice);
      Item.Text := Device.DeviceName;
      Item.ItemData.Detail := Device.Address;
      Item.Parent := lstBluetoothDevice;
      Item.StyleLookup := 'listboxitembottomdetail';
      Item.Index := FHeaderAvailable.Index;
      Item.OnClick := DeviceItemClick;
    end;
  end;
  lstBluetoothDevice.EndUpdate;
end;

procedure TSelectBluetoothDeviceDialog.SetIsScanning(const Value: Boolean);
begin
  FIsScanning := Value;

  if Value then
    btnScan.Text := 'Stop'
  else
    btnScan.Text := 'Scan';
end;

procedure TSelectBluetoothDeviceDialog.SearchDiscoverDevices;
var
  I: Integer;
begin
  IsScanning := True;
  for I := FHeaderAvailable.Index + 1 to lstBluetoothDevice.Count - 1 do
    lstBluetoothDevice.Items.Delete(I);

  FBluetoothManager.StartDiscovery(10000);
  FBluetoothManager.OnDiscoveryEnd := DevicesDiscoveryEnd;
end;

procedure TSelectBluetoothDeviceDialog.DevicesDiscoveryEnd(
  const Sender: TObject; const ADevices: TBluetoothDeviceList);
begin
  TThread.Synchronize(nil,
    procedure
    var
      Contain: Boolean;
      Device: TBluetoothDevice;
      Item: TListBoxItem;
    begin
      IsScanning := False;
      Contain := False;
      for Device in ADevices do
      begin
        if (FContainWord <> '') and (not Device.DeviceName.Contains(FContainWord)) then
          Continue;

        Item := TListBoxItem.Create(lstBluetoothDevice);
        Item.Text := Device.DeviceName;
        Item.ItemData.Detail := Device.Address;
        Item.StyleLookup := 'listboxitembottomdetail';
        Item.Parent := lstBluetoothDevice;
        Item.OnClick := DeviceItemClick;

        Contain := True;
      end;

      if not Contain then
      begin
        Item := TListBoxItem.Create(lstBluetoothDevice);
        Item.StyleLookup := 'listboxitemstyle';
        Item.Text := 'No devices found';
        Item.Parent := lstBluetoothDevice;
      end;
    end);
end;

procedure TSelectBluetoothDeviceDialog.btnScanClick(Sender: TObject);
begin
  if TButton(Sender).Text = 'Scan' then
    SearchDiscoverDevices
  else
    CancelDiscoverDevices;
end;

class procedure TSelectBluetoothDeviceDialog.Cancel;
begin
  if not Assigned(FInstance) then
    Exit;

  FInstance.CancelDiscoverDevices;
  FInstance.Visible := False;
  FInstance.DisposeOf;
  FInstance := nil;
end;

procedure TSelectBluetoothDeviceDialog.CancelDiscoverDevices;
begin
  IsScanning := False;
  FBluetoothManager.CancelDiscovery;
end;

initialization
finalization
  TSelectBluetoothDeviceDialog.Cancel;

end.

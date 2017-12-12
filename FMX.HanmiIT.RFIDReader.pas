unit FMX.HanmiIT.RFIDReader;

interface

uses
  Androidapi.JNI.rfidreaderapi,
  Androidapi.JNI.JavaTypes,
  Androidapi.JNIBridge,
  Androidapi.Helpers,
  Androidapi.JNI.GraphicsContentViewText,

  System.Classes,
  System.Messaging;

type
  TConnectionState = (Disconnected, Connecting, Listen, Connected);
  TActionState = (BlockErase, BlockWrite, Inventory, Kill, Lock, PermaLock, ReadMemory, StartDecode, Stop, Unlock, WriteMemory);
  TBarcodeState = (ScanStart, ScanEnd);
  TRFIDTagEvent = procedure(ATag: string) of object;
  TBarcodeEvent = procedure(ABarcodeType, ACodeId, ABarcode: string) of object;
  TBarcodeStateEvent = procedure(AState: TBarcodeState) of object;

  IRfidEventHandler = interface
  ['{FFEB910C-3BB8-48CA-BE11-B09CC07E53AC}']
    // Rfid Reader
    procedure ReadedTag(AReader: JATRfidReader; ATag: string);
    procedure StateChagned(AReader: JATRfidReader; AState: TConnectionState);

    // Barcode
    procedure ActionChagned(AReader: JATRfidReader; AState: TActionState);
    procedure DetactBarcode(AReader: JATRfidReader; ABarcodeType, ACodeId, ABarcode: string);
  end;

  TRFIDReader = class(TInterfacedObject, IRfidEventHandler)
  private
    FReader: JATRfidReader;
    FEventListener: JATRfidEventListener;

    FFiltered: Boolean;

    FOnConnected: TNotifyEvent;
    FOnDisconnected: TNotifyEvent;
    FOnReadedTag: TRFIDTagEvent;
    FOnReadedBarcode: TBarcodeEvent;
    FOnBarcodeState: TBarcodeStateEvent; // 바코드 스캐닝 중인가?

    procedure InitReader;

    { IRfidEventHandler }
    procedure ReadedTag(AReader: JATRfidReader; ATag: string);
    procedure StateChagned(AReader: JATRfidReader; AState: TConnectionState);

    procedure ActionChagned(AReader: JATRfidReader; AState: TActionState);
    procedure DetactBarcode(AReader: JATRfidReader; ABarcodeType, ACodeId, ABarcode: string);

    function GetPowerGain: Integer;
    procedure SetPowerGain(const Value: Integer);
    function GetDeviceAddress: string;
    function GetConnected: Boolean;
    procedure SetFiltered(const Value: Boolean);
  public
    constructor Create;
    destructor Destroy; override;

    procedure ConnectDevice(AAddress: string);
    procedure DisconnectDevice;

    procedure StartInventory;
    procedure StopInventory;

    procedure StartBarcode;
    procedure StopBarcode;

    // 장비에 저장된 태그 지우기(필터 모드에 적용할 것)
    procedure ClearStoredTag;

    property DeivceAddress: string read GetDeviceAddress;
    property Connected: Boolean read GetConnected;
    // 나누기 10해서 사용할 것(100 = 10.0)
    property PowerGain: Integer read GetPowerGain write SetPowerGain;
    property Filtered: Boolean read FFiltered write SetFiltered;

    property OnConnected: TNotifyEvent read FOnConnected write FOnConnected;
    property OnDisconnected: TNotifyEvent read FOnDisconnected write FOnDisconnected;

    property OnReadedTag: TRFIDTagEvent read FOnReadedTag write FOnReadedTag;
    property OnReadedBarcode: TBarcodeEvent read FOnReadedBarcode write FOnReadedBarcode;

    property OnBarcodeState: TBarcodeStateEvent read FOnBarcodeState write FOnBarcodeState;
  end;

implementation

type
  TRfidEventListner = class(TJavaLocal, JATRfidEventListener)
  private
    FHandler: IRfidEventHandler;
  public
    constructor Create(AHandler: IRfidEventHandler);

    { JATRfidEventListenerClass }
    procedure onAccessResult(P1: JATRfidReader; P2: Jtype_ResultCode; P3: JActionState; P4: JString; P5: JString; P6: Single; P7: Single); cdecl;
    procedure onActionChanged(P1: JATRfidReader; P2: JActionState); cdecl;
    procedure onCommandComplete(P1: JATRfidReader; P2: JCommandType); cdecl;
    procedure onDebugMessage(P1: JATRfidReader; P2: JString); cdecl;
    procedure onDetactBarcode(P1: JATRfidReader; P2: JBarcodeType; P3: JString; P4: JString); cdecl;
    procedure onLoadTag(P1: JATRfidReader; P2: JString); cdecl;
    procedure onReadedTag(P1: JATRfidReader; P2: JActionState; P3: JString; P4: Single; P5: Single); cdecl;
    procedure onRemoteKeyStateChanged(P1: JATRfidReader; P2: JRemoteKeyState); cdecl;
    procedure onStateChanged(P1: JATRfidReader; P2: JConnectionState); cdecl;
  end;

{ TRfidEventListner }

{$REGION 'TRfidEventListner'}

constructor TRfidEventListner.Create(AHandler: IRfidEventHandler);
begin
  inherited Create;

  FHandler := AHandler;
end;

procedure TRfidEventListner.onAccessResult(P1: JATRfidReader;
  P2: Jtype_ResultCode; P3: JActionState; P4, P5: JString; P6, P7: Single);
begin
end;

procedure TRfidEventListner.onActionChanged(P1: JATRfidReader;
  P2: JActionState);
var
  State: TActionState;
begin
  if Assigned(FHandler) then
  begin
    State := TActionState.Stop;
    if P2.getCode = TJActionState.JavaClass.StartDecode.getCode then
      State := TActionState.StartDecode;

    FHandler.ActionChagned(P1, State);
  end;
end;

procedure TRfidEventListner.onCommandComplete(P1: JATRfidReader;
  P2: JCommandType);
begin
end;

procedure TRfidEventListner.onDebugMessage(P1: JATRfidReader; P2: JString);
begin
end;

procedure TRfidEventListner.onDetactBarcode(P1: JATRfidReader; P2: JBarcodeType;
  P3, P4: JString);
begin
  if Assigned(FHandler) then
    FHandler.DetactBarcode(P1, JStringToString(P2.toString), JStringToString(P3), JStringToString(P4));
end;

procedure TRfidEventListner.onLoadTag(P1: JATRfidReader; P2: JString);
begin
end;

procedure TRfidEventListner.onReadedTag(P1: JATRfidReader; P2: JActionState;
  P3: JString; P4, P5: Single);
begin
  if Assigned(FHandler) then
    FHandler.ReadedTag(P1, JStringToString(P3));
end;

procedure TRfidEventListner.onRemoteKeyStateChanged(P1: JATRfidReader;
  P2: JRemoteKeyState);
begin
end;

procedure TRfidEventListner.onStateChanged(P1: JATRfidReader;
  P2: JConnectionState);
var
  State: TConnectionState;
begin
  if Assigned(FHandler) then
  begin
    State := TConnectionState.Disconnected;
    if P2.getState = TJConnectionState.JavaClass.Connected.getState then
      State := TConnectionState.Connected
    else if P2.getState = TJConnectionState.JavaClass.Connecting.getState then
      State := TConnectionState.Connecting
    else if P2.getState = TJConnectionState.JavaClass.Listen.getState then
      State := TConnectionState.Listen
    ;

    FHandler.StateChagned(P1, State);
  end;
end;
{$ENDREGION}

{ TRFIDReader }

procedure TRFIDReader.ClearStoredTag;
begin
  FReader.removeAllStoredTags;
end;

procedure TRFIDReader.ConnectDevice(AAddress: string);
begin
  FReader.connectDevice(StringToJString(AAddress));
end;

constructor TRFIDReader.Create;
begin
  FFiltered := False;

  InitReader;
end;

destructor TRFIDReader.Destroy;
begin

  inherited;
end;

procedure TRFIDReader.SetFiltered(const Value: Boolean);
begin
  FFiltered := Value;

  FReader.setStoredMode(Value);
  FReader.setReportMode(Value);
end;

procedure TRFIDReader.SetPowerGain(const Value: Integer);
begin
  FReader.setPowerGain(Value);
end;

procedure TRFIDReader.StartInventory;
begin
  FReader.inventory();
end;

procedure TRFIDReader.StopInventory;
begin
  FReader.stop;
end;

procedure TRFIDReader.StartBarcode;
begin
  FReader.startDecode;
end;

procedure TRFIDReader.StopBarcode;
begin
  FReader.stopDecode;
end;

procedure TRFIDReader.ReadedTag(AReader: JATRfidReader; ATag: string);
begin
  if Assigned(FOnReadedTag) then
    FOnReadedTag(ATag);
end;

procedure TRFIDReader.StateChagned(AReader: JATRfidReader;
  AState: TConnectionState);
begin
  if AState = TConnectionState.Connected then
  begin
    if Assigned(FOnConnected) then
      FOnConnected(Self);
    FReader.setBarcodeMode(True, 1);
    FReader.setUseKeyAction(True);
  end
  else if AState = TConnectionState.Disconnected then
  begin
    if Assigned(FOnDisconnected) then
      FOnDisconnected(Self);
  end;
end;

procedure TRFIDReader.ActionChagned(AReader: JATRfidReader;
  AState: TActionState);
begin
  if AState = TActionState.StartDecode  then
    if Assigned(FOnBarcodeState) then
      FOnBarcodeState(TBarcodeState.ScanStart)
  else if AState = TActionState.Stop then
    if Assigned(FOnBarcodeState) then
      FOnBarcodeState(TBarcodeState.ScanEnd);
end;

procedure TRFIDReader.DetactBarcode(AReader: JATRfidReader; ABarcodeType,
  ACodeId, ABarcode: string);
begin
  if Assigned(FOnReadedBarcode) then
    FOnReadedBarcode(ABarcodeType, ACodeId, ABarcode);
end;

procedure TRFIDReader.DisconnectDevice;
begin
  FReader.disconnectDevice;
end;

function TRFIDReader.GetConnected: Boolean;
begin

  Result := (FReader.getState.getState = TJConnectionState.JavaClass.Connected.getState);
end;

function TRFIDReader.GetDeviceAddress: string;
begin
  Result := JStringToString(FReader.getAddress);
end;

function TRFIDReader.GetPowerGain: Integer;
begin
  Result := FReader.getPowerGain;
end;

procedure TRFIDReader.InitReader;
var
  LContext: JContext;
begin
  LContext := TAndroidHelper.Context;
  TJATRfidManager.JavaClass.setContext(LContext);

  // 불루투스가 꺼진경우 켜도록 유도(UI에서 별도로 진행 함)
//  TJATRfidManager.JavaClass.checkEnableBluetooth(LContext);

  FEventListener := TRfidEventListner.Create(Self);

  FReader := TJATRfidManager.JavaClass.getInstance;
  FReader.setEventListener(FEventListener);
end;

end.

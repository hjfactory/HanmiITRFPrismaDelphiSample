unit FMX.HardwareBackButtonController;

interface

uses
  FMX.Types, System.Classes, FMX.Forms, FMX.Dialogs, System.UITypes,
  System.Generics.Collections, System.SysUtils;

type
  IHwBackButtonListener = interface
    ['{D15685F2-EDCA-429D-A0A4-79ED43FF2AC7}']
    procedure KeyUpHardwareBackButton(var KeyStop: Boolean);
  end;

  THwBackButtonController = class
  private class var
    FInstance: THwBackButtonController;
  private
    FOldKeyUpEvent: TKeyEvent;
    FListeners: TList<IHwBackButtonListener>;

    procedure KeyUp(Sender: TObject; var Key: Word; var KeyChar: WideChar; Shift: TShiftState);
  public
    constructor Create;
    destructor Destroy; override;

    procedure RegistListener(AListener: IHwBackButtonListener);
    procedure UnregistListener(AListener: IHwBackButtonListener);

    class function Instance: THwBackButtonController;
    class procedure ReleaseInstance;
  end;

implementation

{ THwBackButtonController }

constructor THwBackButtonController.Create;
begin
  FListeners := TList<IHwBackButtonListener>.Create;

  // Store MainForm KeyUp Event Handler
  FOldKeyUpEvent := Application.MainForm.OnKeyUp;
  Application.MainForm.OnKeyUp := KeyUp;
end;

destructor THwBackButtonController.Destroy;
begin
  // Restore MainForm KeyUp Event Handler
  Application.MainForm.OnKeyUp := FOldKeyUpEvent;

  FListeners.Free;

  inherited;
end;

class function THwBackButtonController.Instance: THwBackButtonController;
begin
  if not Assigned(FInstance) then
    FInstance := Create;
  Result := FInstance;
end;

class procedure THwBackButtonController.ReleaseInstance;
begin
  if Assigned(FInstance) then
  begin
    FInstance.DisposeOf;
    FInstance := nil;
  end;
end;

procedure THwBackButtonController.RegistListener(
  AListener: IHwBackButtonListener);
begin
  if FListeners.Contains(AListener) then
    FListeners.Remove(AListener);
  FListeners.Add(AListener);
end;

procedure THwBackButtonController.UnregistListener(
  AListener: IHwBackButtonListener);
begin
  FListeners.Remove(AListener);
end;

procedure THwBackButtonController.KeyUp(Sender: TObject; var Key: Word;
  var KeyChar: WideChar; Shift: TShiftState);
var
  Listener: IHwBackButtonListener;
  KeyStop: Boolean;
begin
  if Key = vkHardwareBack then
  begin
    if FListeners.Count > 0 then
      Listener := FListeners.Last;

    // Sub Frame/Form Event
    if Assigned(Listener) then
    begin
      KeyStop := False;
      Listener.KeyUpHardwareBackButton(KeyStop);
      if KeyStop then
        Key := 0;
      Exit;
    end
    // Main Form Event
    else
    begin
    end;
  end;

  if Assigned(FOldKeyUpEvent) then
    FOldKeyUpEvent(Sender, Key, KeyChar, Shift);
end;

initialization
finalization
  THwBackButtonController.ReleaseInstance;

end.

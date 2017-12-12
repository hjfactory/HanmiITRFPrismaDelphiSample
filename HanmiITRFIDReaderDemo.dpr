program HanmiITRFIDReaderDemo;

uses
  System.StartUpCopy,
  FMX.Forms,
  MainForm in 'MainForm.pas' {Form2},
  Androidapi.JNI.rfidreaderapi in 'Androidapi.JNI.rfidreaderapi.pas',
  FMX.HanmiIT.RFIDReader in 'FMX.HanmiIT.RFIDReader.pas',
  FMX.HardwareBackButtonController in 'libs\FMX.HardwareBackButtonController.pas',
  FMX.UI.OverflowMenu in 'libs\FMX.UI.OverflowMenu.pas' {OverflowMenu: TFrame},
  FMX.UI.SelectBluetoothDeviceDialog in 'libs\FMX.UI.SelectBluetoothDeviceDialog.pas' {SelectBluetoothDeviceDialog: TFrame},
  FMX.UI.WaitDialog in 'libs\FMX.UI.WaitDialog.pas' {WaitDialog: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.

unit FMX.UI.WaitDialog;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Layouts, FMX.Objects;

type
  TWaitDialog = class(TFrame)
    rctBackground: TRectangle;
    lytMessage: TLayout;
    rctMessageBG: TRectangle;
    lblMessage: TLabel;
    AniIndicator1: TAniIndicator;
    Timer: TTimer;
    procedure TimerTimer(Sender: TObject);
  private
    class var FInstance: TWaitDialog;
  private
    { Private declarations }
  public
    { Public declarations }
    destructor Destroy; override;

    class procedure Show(ATitle: string = ''; ATimeout: Integer = -1);
    class procedure Hide;
  end;

implementation

{$R *.fmx}

{ TFrame1 }

class procedure TWaitDialog.Show(ATitle: string; ATimeout: Integer);
begin
  if not Assigned(FInstance) then
    FInstance := Create(nil);

  FInstance.Parent := Application.MainForm;
  FInstance.Align := TAlignLayout.Contents;
  FInstance.BringToFront;
  FInstance.Visible := True;

  if ATitle <> '' then
  begin
    FInstance.lblMessage.Text := ATitle;
  end;

  if ATimeout > 0 then
  begin
    if ATimeout < 1000 then
      ATimeout := 1000;
    FInstance.Timer.Interval := ATimeout;
    FInstance.Timer.Enabled := True;
  end;
end;

class procedure TWaitDialog.Hide;
begin
  if not Assigned(FInstance) then
    Exit;
  FInstance.Visible := False;
  FInstance.DisposeOf;
end;

procedure TWaitDialog.TimerTimer(Sender: TObject);
begin
  Timer.Enabled := False;
  Hide;
end;

destructor TWaitDialog.Destroy;
begin
  FInstance := nil;

  inherited;
end;

initialization
finalization
  TWaitDialog.Hide;

end.

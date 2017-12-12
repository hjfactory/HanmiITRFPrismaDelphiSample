unit FMX.UI.OverflowMenu;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.ListBox, FMX.Objects, FMX.Controls.Presentation, FMX.Effects;

type
  TSelectedItemProc = reference to procedure(AIndex: Integer; AText: string);

  TSettings = record
    Top, Width, Height, RightPadding: Single;
  end;

  TOverflowMenu = class(TFrame)
    lbxMenu: TListBox;
    ShadowEffect1: TShadowEffect;
    procedure BackgroudClick(Sender: TObject);
    procedure lbxMenuItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
  private
    class var FInstance: TOverflowMenu;

    FSelectedItemProc: TSelectedItemProc;

    procedure SetSettings;
    procedure SetMenuItems(AItems: array of string);
  public
    class var Settings: TSettings;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    class procedure ShowMenu(AItems: array of string; ASelectedItemProc: TSelectedItemProc);
    class procedure HideMenu;
  end;

implementation

{$R *.fmx}

{ TOverflowMenu }

constructor TOverflowMenu.Create(AOwner: TComponent);
begin
  inherited;

  lbxMenu.ItemHeight := 44;
  lbxMenu.ShowScrollBars := False;
end;

destructor TOverflowMenu.Destroy;
begin
  FInstance := nil; // MainForm 해제 시 차일드 컴포넌트 제거

  inherited;
end;

procedure TOverflowMenu.BackgroudClick(Sender: TObject);
begin
  HideMenu;
end;

class procedure TOverflowMenu.ShowMenu(AItems: array of string; ASelectedItemProc: TSelectedItemProc);
begin
  if not Assigned(FInstance) then
    FInstance := Create(nil);
  FInstance.Parent := Application.MainForm;
  FInstance.Align := TAlignLayout.Contents;
  FInstance.BringToFront;
  FInstance.Visible := True;

  FInstance.SetSettings;
  FInstance.SetMenuItems(AItems);

  FSelectedItemProc := ASelectedItemProc;
end;

class procedure TOverflowMenu.HideMenu;
begin
  if not Assigned(FInstance) then
    Exit;

  FINstance.Parent := nil;
  FInstance.Visible := False;
  // UI 컨트롤에서 호출이 가능하므로, 해제(DisposeOf) 호출은 별도 처리
  TThread.CreateAnonymousThread(
    procedure
    begin
      FInstance.DisposeOf;
      FInstance := nil;
    end).Start;
end;

procedure TOverflowMenu.lbxMenuItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  if Assigned(FSelectedItemProc) then
    FSelectedItemProc(Item.Index, Item.Text);
  HideMenu;
end;

procedure TOverflowMenu.SetMenuItems(AItems: array of string);
var
  I: Integer;
  Menu: string;
  Item: TListBoxItem;
  Line: TLine;
begin
  lbxMenu.Items.Clear;
  for Menu in AItems do
    lbxMenu.Items.Add(Menu);

  for I := 0 to lbxMenu.Items.Count - 2 do
  begin
    Item := lbxMenu.ListItems[I];
    Line := TLine.Create(Item);
    Line.Fill.Color := TAlphaColorRec.Gray;
    Line.Height := 1;
    Line.Parent := Item;
    Line.Align := TAlignLayout.Bottom;
    Line.Opacity := 0.6;
  end;

  // FContentLayout이 없으면 lbxMenu.ContentBounds.Height 값을 계산못함
    // ApplyStyleLookup > ApplyStyle 메소드에서 FContentLayout을 스타일에서 가져옴
  lbxMenu.ApplyStyleLookup;

  if Settings.Height = 0 then
    lbxMenu.Height := lbxMenu.ContentBounds.Height;
end;

procedure TOverflowMenu.SetSettings;
begin
  if Settings.Top > -1 then
    lbxMenu.Position.Y := Settings.Top;
  if Settings.Width > 0 then
    lbxMenu.Width := Settings.Width;
  if Settings.RightPadding > 0 then
    lbxMenu.Position.X := (Width - lbxMenu.Width - Settings.RightPadding);
  if Settings.Height > 0 then
    lbxMenu.Height := Settings.Height;
end;

initialization
finalization
  TOverflowMenu.HideMenu;

end.

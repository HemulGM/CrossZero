unit CrossZero.Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  Radiant.Shapes, FMX.Objects, FMX.Effects, FMX.ExtCtrls,
  System.Generics.Collections, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Filter.Effects;

type
  TFormMain = class(TForm)
    StyleBook: TStyleBook;
    GridPanelLayout1: TGridPanelLayout;
    LayoutC1: TLayout;
    RadiantXC1: TRadiantX;
    Layout10: TLayout;
    Line1: TLine;
    Layout11: TLayout;
    Layout12: TLayout;
    Line2: TLine;
    LayoutC2: TLayout;
    Layout3: TLayout;
    Line4: TLine;
    Line5: TLine;
    Layout4: TLayout;
    LayoutC3: TLayout;
    Layout6: TLayout;
    Line8: TLine;
    Layout7: TLayout;
    RadiantRingC3: TRadiantRing;
    GlowEffect5: TGlowEffect;
    LayoutC4: TLayout;
    Layout9: TLayout;
    Line10: TLine;
    Line11: TLine;
    Layout13: TLayout;
    LayoutC5: TLayout;
    Layout15: TLayout;
    Line14: TLine;
    Layout16: TLayout;
    LayoutC6: TLayout;
    Layout18: TLayout;
    Line17: TLine;
    Line18: TLine;
    Layout19: TLayout;
    LayoutC7: TLayout;
    Layout21: TLayout;
    Line19: TLine;
    Layout22: TLayout;
    LayoutC8: TLayout;
    Layout24: TLayout;
    Line22: TLine;
    Layout25: TLayout;
    LayoutC9: TLayout;
    Layout27: TLayout;
    Layout28: TLayout;
    ButtonNewGame: TButton;
    GlowEffect1: TGlowEffect;
    RadiantRingC6: TRadiantRing;
    GlowEffect11: TGlowEffect;
    RadiantRingC5: TRadiantRing;
    GlowEffect9: TGlowEffect;
    RadiantRingC4: TRadiantRing;
    GlowEffect7: TGlowEffect;
    RadiantRingC7: TRadiantRing;
    GlowEffect13: TGlowEffect;
    RadiantRingC8: TRadiantRing;
    GlowEffect15: TGlowEffect;
    RadiantRingC9: TRadiantRing;
    GlowEffect17: TGlowEffect;
    RadiantRingC1: TRadiantRing;
    GlowEffect2: TGlowEffect;
    RadiantRingC2: TRadiantRing;
    GlowEffect3: TGlowEffect;
    RadiantXC2: TRadiantX;
    GlowEffect4: TGlowEffect;
    RadiantXC3: TRadiantX;
    GlowEffect6: TGlowEffect;
    RadiantXC4: TRadiantX;
    GlowEffect8: TGlowEffect;
    RadiantXC5: TRadiantX;
    GlowEffect10: TGlowEffect;
    RadiantXC6: TRadiantX;
    GlowEffect12: TGlowEffect;
    RadiantXC7: TRadiantX;
    GlowEffect14: TGlowEffect;
    RadiantXC8: TRadiantX;
    GlowEffect16: TGlowEffect;
    RadiantXC9: TRadiantX;
    GlowEffect18: TGlowEffect;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ButtonNewGameClick(Sender: TObject);
    procedure LayoutC1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
  private
    FListX: TDictionary<Integer, TRadiantShape>;
    FListO: TDictionary<Integer, TRadiantShape>;
    FStep: Boolean;
  public
    procedure NewGame;
  end;

var
  FormMain: TFormMain;

implementation

{$R *.fmx}

procedure TFormMain.NewGame;
var
  Pair: TPair<Integer, TRadiantShape>;
begin
  FStep := True;
  for Pair in FListX do
    Pair.Value.Visible := False;
  for Pair in FListO do
    Pair.Value.Visible := False;
end;

procedure TFormMain.ButtonNewGameClick(Sender: TObject);
begin
  NewGame;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  FListX := TDictionary<Integer, TRadiantShape>.Create;
  FListX.Add(1, RadiantXC1);
  FListX.Add(2, RadiantXC2);
  FListX.Add(3, RadiantXC3);
  FListX.Add(4, RadiantXC4);
  FListX.Add(5, RadiantXC5);
  FListX.Add(6, RadiantXC6);
  FListX.Add(7, RadiantXC7);
  FListX.Add(8, RadiantXC8);
  FListX.Add(9, RadiantXC9);

  FListO := TDictionary<Integer, TRadiantShape>.Create;
  FListO.Add(1, RadiantRingC1);
  FListO.Add(2, RadiantRingC2);
  FListO.Add(3, RadiantRingC3);
  FListO.Add(4, RadiantRingC4);
  FListO.Add(5, RadiantRingC5);
  FListO.Add(6, RadiantRingC6);
  FListO.Add(7, RadiantRingC7);
  FListO.Add(8, RadiantRingC8);
  FListO.Add(9, RadiantRingC9);

  NewGame;
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  FListX.Free;
  FListO.Free;
end;

procedure TFormMain.LayoutC1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
  if Button = TMouseButton.mbLeft then
  begin
    if FStep then
    begin
      FListX.Items[TFmxObject(Sender).Tag].Visible := True;
      FListO.Items[TFmxObject(Sender).Tag].Visible := False;
    end
    else
    begin
      FListX.Items[TFmxObject(Sender).Tag].Visible := False;
      FListO.Items[TFmxObject(Sender).Tag].Visible := True;
    end;
    FStep := not FStep;
  end;
  if Button = TMouseButton.mbRight then
  begin
    FListX.Items[TFmxObject(Sender).Tag].Visible := False;
    FListO.Items[TFmxObject(Sender).Tag].Visible := False;
  end;
end;

end.


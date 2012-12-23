unit uNpcPosMaker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, math,
  Dialogs, StdCtrls, ExtCtrls, Buttons, IniFiles, ClipBrd, pngimage, pngextra, pnglang,
  RotImg, jpeg, ComCtrls, VBScript_RegExp_55_TLB, Encoding, StringListUnicodeSupport;

type
  TMForm = class(TForm)
    edTerrName: TEdit;
    lblTerrName: TLabel;
    edTerrCounter: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    lblTerrRadius: TLabel;
    edTerrRadius: TEdit;
    lblHeight: TLabel;
    edTerrHeight: TEdit;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    rbtnNpcMaker: TRadioButton;
    rbtnNpcMakerEx: TRadioButton;
    Label4: TLabel;
    edNpcMakerPrefix: TEdit;
    Label5: TLabel;
    edNpcMakerMaxNpc: TEdit;
    Label6: TLabel;
    edNpcMakerAddParams: TEdit;
    GroupBox6: TGroupBox;
    memResult: TMemo;
    chkAutoClear: TCheckBox;
    tmrSearcher: TTimer;
    btnClear: TButton;
    edNpcMakerPostfix: TEdit;
    Label12: TLabel;
    tmrReadMem: TTimer;
    btnCopy: TButton;
    cbAddParamsList: TComboBox;
    GroupBox4: TGroupBox;
    X: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    lblRadar: TLabel;
    Label11: TLabel;
    RotateImage1: TRotateImage;
    Image1: TImage;
    Image2: TImage;
    lblAngle: TLabel;
    Bevel1: TBevel;
    edNpcX: TEdit;
    edNpcY: TEdit;
    edNpcZ: TEdit;
    edNpcName: TEdit;
    edNpcRespawn: TEdit;
    cbNpcTimeType: TComboBox;
    edNpcAddParams: TEdit;
    GroupBox5: TGroupBox;
    Label10: TLabel;
    edMemOffset: TEdit;
    btnRead: TButton;
    btnN: TButton;
    btnNE: TButton;
    btnE: TButton;
    btnSE: TButton;
    btnS: TButton;
    btnSW: TButton;
    btnW: TButton;
    btnNW: TButton;
    btnGenerate: TButton;
    chkAutoCounter: TCheckBox;
    edNpcCount: TEdit;
    rbFullInfo: TRadioButton;
    rbOnlyNpc: TRadioButton;
    rbOnlyPoint: TRadioButton;
    TrackBar1: TTrackBar;
    cbNpcAddParamsList: TComboBox;
    chkAnywhere: TCheckBox;
    GroupBox7: TGroupBox;
    SaveDialog1: TSaveDialog;
    btnSave: TButton;
    chkScroll: TCheckBox;
    edNpcMakerAI: TEdit;
    Label13: TLabel;
    btnSearchOffset: TSpeedButton;
    lblMapNum: TLabel;
    edNPCXYZ: TEdit;
    Label15: TLabel;
    rbX: TRadioButton;
    rbXYZ: TRadioButton;
    chkAngle: TCheckBox;
    rbTerrByRadius: TRadioButton;
    Label16: TLabel;
    edTerrZ: TEdit;
    rbTerrByVertices: TRadioButton;
    rbTerrByAnyData: TRadioButton;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    Label17: TLabel;
    Label18: TLabel;
    edTerrVertex1: TEdit;
    edTerrVertex2: TEdit;
    Label19: TLabel;
    memTerrCoords: TMemo;
    chkMemShowAngle: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure btnNClick(Sender: TObject);
    procedure btnNEClick(Sender: TObject);
    procedure btnEClick(Sender: TObject);
    procedure btnSEClick(Sender: TObject);
    procedure btnSClick(Sender: TObject);
    procedure btnSWClick(Sender: TObject);
    procedure btnWClick(Sender: TObject);
    procedure btnNWClick(Sender: TObject);
    procedure edMemOffsetChange(Sender: TObject);
    procedure tmrSearcherTimer(Sender: TObject);
    procedure cbNpcTimeTypeChange(Sender: TObject);
    procedure btnGenerateClick(Sender: TObject);
    procedure edNpcXKeyPress(Sender: TObject; var Key: Char);
    procedure edNpcYKeyPress(Sender: TObject; var Key: Char);
    procedure edNpcZKeyPress(Sender: TObject; var Key: Char);
    procedure edTerrRadiusKeyPress(Sender: TObject; var Key: Char);
    procedure edTerrCounterKeyPress(Sender: TObject; var Key: Char);
    procedure edTerrHeightKeyPress(Sender: TObject; var Key: Char);
    procedure btnClearClick(Sender: TObject);
    procedure edNpcCountKeyPress(Sender: TObject; var Key: Char);
    procedure btnReadClick(Sender: TObject);
    procedure tmrReadMemTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCopyClick(Sender: TObject);
    procedure RotateImage1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RotateImage1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure RotateImage1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure TrackBar1Change(Sender: TObject);
    procedure Image2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Image2MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure rbtnNpcMakerClick(Sender: TObject);
    procedure rbtnNpcMakerExClick(Sender: TObject);
    procedure cbAddParamsListSelect(Sender: TObject);
    procedure cbNpcAddParamsListSelect(Sender: TObject);
    procedure memResultChange(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnSearchOffsetClick(Sender: TObject);
    procedure rbXClick(Sender: TObject);
    procedure rbXYZClick(Sender: TObject);
    procedure rbOnlyPointClick(Sender: TObject);
    procedure rbOnlyNpcClick(Sender: TObject);
    procedure rbFullInfoClick(Sender: TObject);
    procedure edTerrVertex1Enter(Sender: TObject);
    procedure edTerrRadiusEnter(Sender: TObject);
    procedure edTerrZEnter(Sender: TObject);
    procedure edTerrVertex2Enter(Sender: TObject);
    procedure memTerrCoordsEnter(Sender: TObject);
    procedure edNPCXYZChange(Sender: TObject);

  private
    { Private declarations }
    Dragging: Boolean;
    StartTheta: Extended;
    StartAngle: Extended;
  public
    { Public declarations }
  end;

var
  MForm: TMForm;
  Offset : integer;

implementation

uses uSearchOffset;

{$R *.dfm}


procedure TMForm.FormShow(Sender: TObject);
var
  Settings : TIniFile;
  Param : String;
  Cnt, i: integer;
begin
  btnN.Perform( BM_SETSTATE, 1, 0 );
  btnN.Tag := 1;
  btnRead.Tag := 0;
  Settings := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\settings.ini');
  MForm.Left := Settings.ReadInteger('window','PosLeft',100);
  MForm.Top := Settings.ReadInteger('window','PosTop',100);
  Offset := Settings.ReadInteger('main','Offset',44);
  Param := Settings.ReadString('main','Radius','200');
  edTerrRadius.Text := Param;
  Param := Settings.ReadString('main','Height','200');
  edTerrHeight.Text := Param;
  Param := Settings.ReadString('main','MakerType','1');
  if (Param = '1') then
  begin
    rbtnNpcMaker.Checked := true;
    edNpcMakerPrefix.Enabled := false;
    edNpcMakerPostfix.Enabled := false;
    edNpcMakerAI.Enabled := false;
    Cnt := Settings.ReadInteger('NpcMakerParams','ParamsCount',0);
    for i := 1 to Cnt+1 do
    begin
     Param := Settings.ReadString('NpcMakerParams','Param'+IntToStr(i),'');
     if (Param <> '') then
     begin
        cbAddParamsList.Items.Add(Param);
     end;
    end
  end
  else
  begin
    rbtnNpcMakerEx.Checked := true;
    edNpcMakerPrefix.Enabled := true;
    edNpcMakerPostfix.Enabled := true;
    edNpcMakerAI.Enabled := true;
    Cnt := Settings.ReadInteger('NpcMakerExParams','ParamsCount',0);
    cbAddParamsList.Clear;
    for i := 1 to Cnt+1 do
    begin
     Param := Settings.ReadString('NpcMakerExParams','Param'+IntToStr(i),'');
     if (Param <> '') then
     begin
        cbAddParamsList.Items.Add(Param);
     end;
    end;
  end;

  Cnt := Settings.ReadInteger('NpcParams','ParamsCount',0);
  for i := 1 to Cnt+1 do
  begin
     Param := Settings.ReadString('NpcParams','Param'+IntToStr(i),'');
     if (Param <> '') then
     begin
        cbNpcAddParamsList.Items.Add(Param);
     end;
  end;

  Param := Settings.ReadString('main','Address','');
  edMemOffset.Text := Param;
  Param := Settings.ReadString('main','AutoCounter','0');
  if (Param = '1') then
    chkAutoCounter.Checked := true
  else
    chkAutoCounter.Checked := false;
  Param := Settings.ReadString('main','Anywhere','0');
  if (Param = '1') then
    chkAnywhere.Checked := true
  else
    chkAnywhere.Checked := false;
  Param := Settings.ReadString('main','AutoClear','0');
  if (Param = '1') then
    chkAutoClear.Checked := true
  else
    chkAutoClear.Checked := false;
  Param := Settings.ReadString('main','AutoScroll','0');
  if (Param = '1') then
    chkScroll.Checked := true
  else
    chkScroll.Checked := false;

  Param := Settings.ReadString('main','WithAngle','1');
  if (Param = '1') then
    chkAngle.Checked := true
  else
    chkAngle.Checked := false;

  Param := Settings.ReadString('main','MemAngle','1');
  if (Param = '1') then
    chkMemShowAngle.Checked := true
  else
    chkAngle.Checked := false;

  Param := Settings.ReadString('main','ResultType','1');
  if (Param = '1') then
    rbFullInfo.Checked := true
  else if (Param = '2') then
    rbOnlyNpc.Checked := true
  else
    rbOnlyPoint.Checked := true;

  Param := Settings.ReadString('main','TerrByType','1');
  if (Param = '1') then
    rbTerrByRadius.Checked := true
  else if (Param = '2') then
    rbTerrByVertices.Checked := true
  else
    rbTerrByAnyData.Checked := true;

  Param := Settings.ReadString('main','CoordType','1');
  if (Param = '1') then
    rbX.Checked := true
  else
    rbXYZ.Checked := true;

  Settings.Free;
  //TrackBar1Change(Self);
end;

procedure TMForm.btnNClick(Sender: TObject);
begin
  TrackBar1.Position := Trunc(0 * 10) mod 3600;
  TrackBar1Change(Self);
  if (btnN.Tag = 0) then
  begin
    lblRadar.Caption := '49152';
    btnNE.Perform( BM_SETSTATE, 0, 0 );
    btnNE.Tag := 0;
    btnE.Perform( BM_SETSTATE, 0, 0 );
    btnE.Tag := 0;
    btnSE.Perform( BM_SETSTATE, 0, 0 );
    btnSE.Tag := 0;
    btnS.Perform( BM_SETSTATE, 0, 0 );
    btnS.Tag := 0;
    btnSW.Perform( BM_SETSTATE, 0, 0 );
    btnSW.Tag := 0;
    btnW.Perform( BM_SETSTATE, 0, 0 );
    btnW.Tag := 0;
    btnNW.Perform( BM_SETSTATE, 0, 0 );
    btnNW.Tag := 0;
    btnN.Perform( BM_SETSTATE, 1, 0 );
    btnN.Tag := 1;
  end
  else
  begin
    btnN.Perform( BM_SETSTATE, 1, 0 );
    btnN.Tag := 1;
  end;
end;

procedure TMForm.btnNEClick(Sender: TObject);
begin
  TrackBar1.Position := Trunc(45 * 10) mod 3600;
  TrackBar1Change(Self);
  if (btnNE.Tag = 0) then
  begin
    lblRadar.Caption := '57344';
    btnN.Perform( BM_SETSTATE, 0, 0 );
    btnN.Tag := 0;
    btnE.Perform( BM_SETSTATE, 0, 0 );
    btnE.Tag := 0;
    btnSE.Perform( BM_SETSTATE, 0, 0 );
    btnSE.Tag := 0;
    btnS.Perform( BM_SETSTATE, 0, 0 );
    btnS.Tag := 0;
    btnSW.Perform( BM_SETSTATE, 0, 0 );
    btnSW.Tag := 0;
    btnW.Perform( BM_SETSTATE, 0, 0 );
    btnW.Tag := 0;
    btnNW.Perform( BM_SETSTATE, 0, 0 );
    btnNW.Tag := 0;
    btnNE.Perform( BM_SETSTATE, 1, 0 );
    btnNE.Tag := 1;
  end
  else
  begin
    btnNE.Perform( BM_SETSTATE, 1, 0 );
    btnNE.Tag := 1;
  end;
end;

procedure TMForm.btnEClick(Sender: TObject);
begin
  TrackBar1.Position := Trunc(90 * 10) mod 3600;
  TrackBar1Change(Self);
  if (btnE.Tag = 0) then
  begin
    lblRadar.Caption := '0';
    btnNE.Perform( BM_SETSTATE, 0, 0 );
    btnNE.Tag := 0;
    btnN.Perform( BM_SETSTATE, 0, 0 );
    btnN.Tag := 0;
    btnSE.Perform( BM_SETSTATE, 0, 0 );
    btnSE.Tag := 0;
    btnS.Perform( BM_SETSTATE, 0, 0 );
    btnS.Tag := 0;
    btnSW.Perform( BM_SETSTATE, 0, 0 );
    btnS.Tag := 0;
    btnW.Perform( BM_SETSTATE, 0, 0 );
    btnW.Tag := 0;
    btnNW.Perform( BM_SETSTATE, 0, 0 );
    btnNW.Tag := 0;
    btnE.Perform( BM_SETSTATE, 1, 0 );
    btnE.Tag := 1;
  end
  else
  begin
    btnE.Perform( BM_SETSTATE, 1, 0 );
    btnE.Tag := 1;
  end;
end;

procedure TMForm.btnSEClick(Sender: TObject);
begin
  TrackBar1.Position := Trunc(135 * 10) mod 3600;
  TrackBar1Change(Self);
  if (btnSE.Tag = 0) then
  begin
    lblRadar.Caption := '8192';
    btnNE.Perform( BM_SETSTATE, 0, 0 );
    btnNE.Tag := 0;
    btnE.Perform( BM_SETSTATE, 0, 0 );
    btnE.Tag := 0;
    btnN.Perform( BM_SETSTATE, 0, 0 );
    btnN.Tag := 0;
    btnS.Perform( BM_SETSTATE, 0, 0 );
    btnS.Tag := 0;
    btnSW.Perform( BM_SETSTATE, 0, 0 );
    btnSW.Tag := 0;
    btnW.Perform( BM_SETSTATE, 0, 0 );
    btnW.Tag := 0;
    btnNW.Perform( BM_SETSTATE, 0, 0 );
    btnNW.Tag := 0;
    btnSE.Perform( BM_SETSTATE, 1, 0 );
    btnSE.Tag := 1;
  end
  else
  begin
    btnSE.Perform( BM_SETSTATE, 1, 0 );
    btnSE.Tag := 1;
  end;
end;

procedure TMForm.btnSClick(Sender: TObject);
begin
  TrackBar1.Position := Trunc(180 * 10) mod 3600;
  TrackBar1Change(Self);
  if (btnS.Tag = 0) then
  begin
    lblRadar.Caption := '16384';
    btnNE.Perform( BM_SETSTATE, 0, 0 );
    btnNE.Tag := 0;
    btnE.Perform( BM_SETSTATE, 0, 0 );
    btnE.Tag := 0;
    btnSE.Perform( BM_SETSTATE, 0, 0 );
    btnSE.Tag := 0;
    btnN.Perform( BM_SETSTATE, 0, 0 );
    btnN.Tag := 0;
    btnSW.Perform( BM_SETSTATE, 0, 0 );
    btnSW.Tag := 0;
    btnW.Perform( BM_SETSTATE, 0, 0 );
    btnW.Tag := 0;
    btnNW.Perform( BM_SETSTATE, 0, 0 );
    btnNW.Tag := 0;
    btnS.Perform( BM_SETSTATE, 1, 0 );
    btnS.Tag := 1;
  end
  else
  begin
    btnS.Perform( BM_SETSTATE, 1, 0 );
    btnS.Tag := 1;
  end;
end;

procedure TMForm.btnSWClick(Sender: TObject);
begin
  TrackBar1.Position := Trunc(225 * 10) mod 3600;
  TrackBar1Change(Self);
  if (btnSW.Tag = 0) then
  begin
    lblRadar.Caption := '24576';
    btnNE.Perform( BM_SETSTATE, 0, 0 );
    btnNE.Tag := 0;
    btnE.Perform( BM_SETSTATE, 0, 0 );
    btnE.Tag := 0;
    btnSE.Perform( BM_SETSTATE, 0, 0 );
    btnSE.Tag := 0;
    btnS.Perform( BM_SETSTATE, 0, 0 );
    btnS.Tag := 0;
    btnN.Perform( BM_SETSTATE, 0, 0 );
    btnN.Tag := 0;
    btnW.Perform( BM_SETSTATE, 0, 0 );
    btnW.Tag := 0;
    btnNW.Perform( BM_SETSTATE, 0, 0 );
    btnNW.Tag := 0;
    btnSW.Perform( BM_SETSTATE, 1, 0 );
    btnSW.Tag := 1;
  end
  else
  begin
    btnSW.Perform( BM_SETSTATE, 1, 0 );
    btnSW.Tag := 1;
  end;
end;

procedure TMForm.btnWClick(Sender: TObject);
begin
  TrackBar1.Position := Trunc(270 * 10) mod 3600;
  TrackBar1Change(Self);
  if (btnW.Tag = 0) then
  begin
    lblRadar.Caption := '32768';
    btnNE.Perform( BM_SETSTATE, 0, 0 );
    btnNE.Tag := 0;
    btnE.Perform( BM_SETSTATE, 0, 0 );
    btnE.Tag := 0;
    btnSE.Perform( BM_SETSTATE, 0, 0 );
    btnSE.Tag := 0;
    btnS.Perform( BM_SETSTATE, 0, 0 );
    btnS.Tag := 0;
    btnSW.Perform( BM_SETSTATE, 0, 0 );
    btnSW.Tag := 0;
    btnN.Perform( BM_SETSTATE, 0, 0 );
    btnN.Tag := 0;
    btnNW.Perform( BM_SETSTATE, 0, 0 );
    btnNW.Tag := 0;
    btnW.Perform( BM_SETSTATE, 1, 0 );
    btnW.Tag := 1;
  end
  else
  begin
    btnW.Perform( BM_SETSTATE, 1, 0 );
    btnW.Tag := 1;
  end;
end;

procedure TMForm.btnNWClick(Sender: TObject);
begin
  TrackBar1.Position := Trunc(315 * 10) mod 3600;
  TrackBar1Change(Self);
  if (btnNW.Tag = 0) then
  begin
    lblRadar.Caption := '40960';
    btnNE.Perform( BM_SETSTATE, 0, 0 );
    btnNE.Tag := 0;
    btnE.Perform( BM_SETSTATE, 0, 0 );
    btnE.Tag := 0;
    btnSE.Perform( BM_SETSTATE, 0, 0 );
    btnSE.Tag := 0;
    btnS.Perform( BM_SETSTATE, 0, 0 );
    btnS.Tag := 0;
    btnSW.Perform( BM_SETSTATE, 0, 0 );
    btnSW.Tag := 0;
    btnW.Perform( BM_SETSTATE, 0, 0 );
    btnW.Tag := 0;
    btnN.Perform( BM_SETSTATE, 0, 0 );
    btnN.Tag := 0;
    btnNW.Perform( BM_SETSTATE, 1, 0 );
    btnNW.Tag := 1;
  end
  else
  begin
    btnNW.Perform( BM_SETSTATE, 1, 0 );
    btnNW.Tag := 1;
  end;
end;

procedure TMForm.edMemOffsetChange(Sender: TObject);
begin
  if ((edMemOffset.Text <> '') AND (tmrSearcher.Tag = 1)) then
    btnRead.Enabled := true
  else
    btnRead.Enabled := false;
end;

procedure TMForm.tmrSearcherTimer(Sender: TObject);
var
  Wnd: hWnd;
  buff: array [0..127] of Char;
  finded: boolean;

begin
  finded := false;
  Wnd := GetWindow(Handle, gw_HWndFirst);
  while Wnd <> 0 do begin {Не показываем:}
    if (Wnd <> Application.Handle) and {Собственное окно}
      IsWindowVisible(Wnd) and  {Невидимые окна}
      (GetWindow(Wnd, gw_Owner) = 0) and  {Дочерние окна}
      (GetWindowText(Wnd, buff, sizeof(buff)) <> 0) {Окна без заголовков}
      then
      begin
        GetWindowText(Wnd, buff, sizeof(buff));
        if ('Lineage II' = buff) then
          finded := true;
      end;
    Wnd := GetWindow(Wnd, gw_hWndNext);
 end;
 if (finded) then
 begin
  btnRead.Enabled := true;
  tmrSearcher.Tag := 1;
 end
 else
 begin
  btnRead.Caption := 'Read';
  edMemOffset.Enabled := true;
  tmrSearcher.Tag := 1;
  btnRead.Enabled := false;
  tmrReadMem.Enabled := false;
 end;
end;

procedure TMForm.cbNpcTimeTypeChange(Sender: TObject);
begin
  if (cbNpcTimeType.ItemIndex = 0) then
    edNpcRespawn.Enabled := false
  else
    edNpcRespawn.Enabled := true;

end;

procedure ExplodeCoord(text: string; var x, y, z: integer);
var
  i, j, k  : integer;
  R: TRegExp;
  mc: MatchCollection;
  m: Match;
  sm: SubMatches;
begin
    R := TRegExp.Create(MForm);
    try
      R.Pattern := '([\-]*[\d]*)';
      R.IgnoreCase := false;
      R.Global := True;
      mc := R.Execute(text) AS MatchCollection;
      x := 0;
      y := 0;
      z := 0;
      k := 0;
      if mc.Count > 0 then begin
        for i := 0 to mc.Count - 1 do begin
          m := mc[i] as Match;
          // разбираем субсоответствия (сгруппированные в скобках)
          sm := m.SubMatches as SubMatches;
          for j := 0 to sm.Count - 1 do
          begin
            if (VarToStr(sm.Item[j]) <> '') AND (k < 3) then
            begin
              k := k + 1;
              case k of
                1: x := StrToInt(VarToStr(sm.Item[j]));
                2: y := StrToInt(VarToStr(sm.Item[j]));
                3: z := StrToInt(VarToStr(sm.Item[j]));
              end;
            end;
          end;
        end;
      end;
      for i := k + 1 to 3 do
        case i of
          1: x := 0;
          2: y := 0;
          3: z := 0;
        end;
    finally
      m := nil;
      sm := nil;
      mc := nil;
      R.Free;
    end;
end;

procedure TMForm.btnGenerateClick(Sender: TObject);
var
  MakerType   : string;
  OutText     : string;
  Cntr        : string;
  MakerParams : string;
  NPCParams   : string;
  Respawn     : string;
  X, Y, Z     : integer;
  X2, Y2, Z2  : integer;
  i, j, k  : integer;
  R: TRegExp;
  mc: MatchCollection;
  m: Match;
  sm: SubMatches;

begin
  if (edNpcX.Text = '') then
    edNpcX.Text := '0';
  if (edNpcY.Text = '') then
    edNpcX.Text := '0';
  if (edNpcZ.Text = '') then
    edNpcX.Text := '0';
  if (edNpcCount.Text = '') then
    edNpcCount.Text := '0';
  if (edTerrRadius.Text = '') then
    edTerrRadius.Text := '0';
  if (edTerrHeight.Text = '') then
    edTerrHeight.Text := '0';
  edTerrName.Text := Trim(edTerrName.Text);

  if (Copy(edTerrName.Text, 1, 1) = '[') then
    edTerrName.Text := Copy(edTerrName.Text, 2, Length(edTerrName.Text));
  if (Copy(edTerrName.Text, Length(edTerrName.Text), 1) = ']') then
    edTerrName.Text := Copy(edTerrName.Text, 0, Length(edTerrName.Text) - 1);
    
  if (Copy(edNpcName.Text, 1, 1) = '[') then
    edNpcName.Text := Copy(edNpcName.Text, 2, Length(edNpcName.Text));
  if (Copy(edNpcName.Text, Length(edNpcName.Text), 1) = ']') then
    edNpcName.Text := Copy(edNpcName.Text, 0, Length(edNpcName.Text) - 1);

  if (Copy(edNpcMakerAI.Text, 1, 1) = '[') then
    edNpcMakerAI.Text := Copy(edNpcMakerAI.Text, 2, Length(edNpcMakerAI.Text));
  if (Copy(edNpcMakerAI.Text, Length(edNpcMakerAI.Text), 1) = ']') then
    edNpcMakerAI.Text := Copy(edNpcMakerAI.Text, 0, Length(edNpcMakerAI.Text) - 1);

  edNpcMakerAddParams.Text := StringReplace(StringReplace(trim(edNpcMakerAddParams.Text), ' =', '=', [rfReplaceAll]), '= ', '=', [rfReplaceAll]);
  edNpcAddParams.Text := StringReplace(StringReplace(trim(edNpcAddParams.Text), ' =', '=', [rfReplaceAll]), '= ', '=', [rfReplaceAll]);
  if (trim(edNpcMakerAddParams.Text) <> '') then
    MakerParams := ^I + StringReplace(trim(edNpcMakerAddParams.Text), ' ', ^I, [rfReplaceAll]);
  if (trim(edNpcAddParams.Text) <> '') then
    NPCParams := ^I + StringReplace(trim(edNpcAddParams.Text), ' ', ^I, [rfReplaceAll]);

  if (cbNpcTimeType.ItemIndex = 0) then
    Respawn := 'no'
  else
    Respawn := edNpcRespawn.Text + cbNpcTimeType.Text;
  Cntr := '';

  OutText := '';

  if (rbX.Checked) then
  begin
    X := StrToInt(edNpcX.Text);
    Y := StrToInt(edNpcY.Text);
    Z := StrToInt(edNpcZ.Text);
  end
  else
  begin
    R := TRegExp.Create(Self);
    try
      R.Pattern := '([\-]*[\d]*)';
      R.IgnoreCase := false;
      R.Global := True;
      mc := R.Execute(edNPCXYZ.Text) AS MatchCollection;
      X := 0;
      Y := 0;
      Z := 0;
      k := 0;
      if mc.Count > 0 then begin
        for i := 0 to mc.Count - 1 do begin
          m := mc[i] as Match;
          // разбираем субсоответствия (сгруппированные в скобках)
          sm := m.SubMatches as SubMatches;
          for j := 0 to sm.Count - 1 do
          begin
            if (VarToStr(sm.Item[j]) <> '') AND (k < 3) then
            begin
              k := k + 1;
              case k of
                1: X := StrToInt(VarToStr(sm.Item[j]));
                2: Y := StrToInt(VarToStr(sm.Item[j]));
                3: Z := StrToInt(VarToStr(sm.Item[j]));
              end;
            end;
          end;
        end;
      end;
      for i := k + 1 to 3 do
        case i of
          1: X := 0;
          2: Y := 0;
          3: Z := 0;
        end;
    finally
      m := nil;
      sm := nil;
      mc := nil;
      R.Free;
    end;
  end;

  if (edTerrCounter.Text <> '') then
    Cntr := '_' + edTerrCounter.Text;
  if (rbOnlyPoint.Checked) then
  begin
    if (chkAngle.Checked) then
      OutText := '{' + IntToStr(X) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + ';' + lblRadar.Caption + '}'
    else
      OutText := '{' + IntToStr(X) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + '}'
  end
  else
  begin
    if (rbTerrByAnyData.Checked) AND (memTerrCoords.Lines.Count < 4) then
    begin
      case MessageDlg('Vertices count less then 4. Continue?', mtWarning, [mbYes, mbNo], 0) of
        mrNo :
        begin
          exit;
        end;
      end;
    end;

    case rbtnNpcMaker.Checked of
      true :
        begin
          MakerType := 'NpcMaker';
          if (fileExists(ExtractFilePath(Application.ExeName) + '\' + MakerType + '.txt')) then
          begin
          end
          else
          begin
            if (rbFullInfo.Checked) then
            begin
              OutText := 'territory_begin' + ^I + '[' + edTerrName.Text + Cntr + ']' + ^I + '{';
              if (rbTerrByRadius.Checked) then
              begin
                OutText := OutText +
                  '{' + IntToStr(X - StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Y - StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Z - StrToInt(edTerrZ.Text)) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text) - StrToInt(edTerrZ.Text)) + '};' +
                  '{' + IntToStr(X + StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Y - StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Z - StrToInt(edTerrZ.Text)) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text) - StrToInt(edTerrZ.Text)) + '};' +
                  '{' + IntToStr(X + StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Y + StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Z - StrToInt(edTerrZ.Text)) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text) - StrToInt(edTerrZ.Text)) + '};' +
                  '{' + IntToStr(X - StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Y + StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Z - StrToInt(edTerrZ.Text)) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text) - StrToInt(edTerrZ.Text)) + '}'
              end
              else if (rbTerrByVertices.Checked) then
                begin
                  ExplodeCoord(edTerrVertex1.Text, X, Y, Z);
                  ExplodeCoord(edTerrVertex2.Text, X2, Y2, Z2);
                  OutText := OutText +
                  '{' + IntToStr(X) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '};' +
                  '{' + IntToStr(X2) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '};' +
                  '{' + IntToStr(X2) + ';' + IntToStr(Y2) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '};' +
                  '{' + IntToStr(X) + ';' + IntToStr(Y2) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '}'
                end
              else
              begin
                for i:=0 to memTerrCoords.Lines.Count-1 do
                begin
                  ExplodeCoord(memTerrCoords.Lines.Strings[i], X, Y, Z);
                  OutText := OutText +
                  '{' + IntToStr(X) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '};';
                end;
                OutText := Copy(OutText, 0, Length(OutText)-1); //del last ';'
              end;
              OutText := OutText + '}' + ^I + 'territory_end' + CHAR(13)+CHAR(10) +
              'npcmaker_begin' + ^I + '[' + edTerrName.Text + Cntr + ']' + ^I + 'initial_spawn=all' + ^I + 'maximum_npc=' + edNpcMakerMaxNpc.Text + MakerParams + CHAR(13)+CHAR(10);
            end;
            OutText := OutText + 'npc_begin' + ^I + '[' + edNpcName.Text + ']' + ^I;
            if (chkAnywhere.Checked) then
              OutText := OutText + 'pos=Anywhere'
            else
              OutText := OutText + 'pos={' + IntToStr(X) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + ';' + lblRadar.Caption + '}';
            OutText := OutText + ^I + 'total=' + edNpcCount.Text + ^I + 'respawn=' + Respawn + NpcParams + ^I + 'npc_end';
            if (rbFullInfo.Checked) then
            begin
              OutText :=  OutText + CHAR(13)+CHAR(10) + 'npcmaker_end' + CHAR(13)+CHAR(10) ;
            end;
          end;
        end;
      false :
        begin
          MakerType := 'NpcMakerEx';
          if (fileExists(ExtractFilePath(Application.ExeName) + '\' + MakerType + '.txt')) then
          begin
          end
          else
          begin
            if (rbFullInfo.Checked) then
            begin
              OutText := 'territory_begin' + ^I + '[' + edTerrName.Text + Cntr + ']' + ^I + '{';
              if (rbTerrByRadius.Checked) then
              begin
                OutText := OutText +
                  '{' + IntToStr(X - StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Y - StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Z - StrToInt(edTerrZ.Text)) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text) - StrToInt(edTerrZ.Text)) + '};' +
                  '{' + IntToStr(X + StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Y - StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Z - StrToInt(edTerrZ.Text)) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text) - StrToInt(edTerrZ.Text)) + '};' +
                  '{' + IntToStr(X + StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Y + StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Z - StrToInt(edTerrZ.Text)) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text) - StrToInt(edTerrZ.Text)) + '};' +
                  '{' + IntToStr(X - StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Y + StrToInt(edTerrRadius.Text)) + ';' + IntToStr(Z - StrToInt(edTerrZ.Text)) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text) - StrToInt(edTerrZ.Text)) + '}'
              end
              else if (rbTerrByVertices.Checked) then
                begin
                  ExplodeCoord(edTerrVertex1.Text, X, Y, Z);
                  ExplodeCoord(edTerrVertex2.Text, X2, Y2, Z2);
                  OutText := OutText +
                  '{' + IntToStr(X) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '};' +
                  '{' + IntToStr(X2) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '};' +
                  '{' + IntToStr(X2) + ';' + IntToStr(Y2) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '};' +
                  '{' + IntToStr(X) + ';' + IntToStr(Y2) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '}'
                end
              else
              begin
                for i:=0 to memTerrCoords.Lines.Count-1 do
                begin
                  if (trim(memTerrCoords.Lines.Strings[i]) <> '') then
                  begin
                    ExplodeCoord(memTerrCoords.Lines.Strings[i], X, Y, Z);
                    OutText := OutText +
                    '{' + IntToStr(X) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + ';' + IntToStr(Z + StrToInt(edTerrHeight.Text)) + '};';
                  end;
                end;
                OutText := Copy(OutText, 0, Length(OutText)-1); //del last ';'
              end;
              OutText := OutText + '}' + ^I + 'territory_end' + CHAR(13)+CHAR(10) +
              'npcmaker_ex_begin' + ^I + '[' + edTerrName.Text + Cntr + ']' + ^I + 'name=[' + edNpcMakerPrefix.Text + edTerrName.Text + Cntr + edNpcMakerPostfix.Text + ']' + ^I + 'ai=[' + edNpcMakerAI.Text + ']' + ^I + 'maximum_npc=' + edNpcMakerMaxNpc.Text + MakerParams + CHAR(13) + CHAR(10);
            end;
            OutText := OutText + 'npc_ex_begin' + ^I + '[' + edNpcName.Text + ']' + ^I;
            if (chkAnywhere.Checked) then
              OutText := OutText + 'pos=Anywhere'
            else
              OutText := OutText + 'pos={' + IntToStr(X) + ';' + IntToStr(Y) + ';' + IntToStr(Z) + ';' + lblRadar.Caption + '}';
            OutText := OutText + ^I + 'total=' + edNpcCount.Text + ^I + 'respawn=' + Respawn + NpcParams + ^I + 'npc_ex_end';
            if (rbFullInfo.Checked) then
            begin
              OutText :=  OutText + CHAR(13)+CHAR(10) + 'npcmaker_ex_end' + CHAR(13)+CHAR(10) ;
            end;
          end;
        end;
    end;
  end;
  if (chkAutoCounter.Checked) then
  begin
    if (edTerrCounter.Text = '') then
      edTerrCounter.Text := '0';
    if (StrToInt(edTerrCounter.Text) < 9) then
      edTerrCounter.Text := '0' + IntToStr(StrToInt(edTerrCounter.Text) + 1)
    else
      edTerrCounter.Text := IntToStr(StrToInt(edTerrCounter.Text) + 1);
  end;
  if ((chkAutoClear.Checked) OR (memResult.Text = '')) then
    memResult.Text := OutText
  else
    memResult.Text := memResult.Text + CHAR(13)+CHAR(10) + OutText;
  if (chkScroll.Checked) then
  for i := 0 to memResult.Lines.Count do
    SendMessage(memResult.Handle, WM_VSCROLL, SB_LINEDOWN, 0);
end;


procedure TMForm.edNpcXKeyPress(Sender: TObject; var Key: Char);
begin
  //ShowMessage(IntToStr(Ord(Key)));
  if (((Ord(Key) > 57) OR (Ord(Key) < 48)) AND (Ord(Key) <> 8) AND (Ord(Key) <> 22) AND (Ord(Key) <> 3) AND (Ord(Key) <> 45)) then
    Key := Chr(0);
end;

procedure TMForm.edNpcYKeyPress(Sender: TObject; var Key: Char);
begin
  if (((Ord(Key) > 57) OR (Ord(Key) < 48)) AND (Ord(Key) <> 8) AND (Ord(Key) <> 22) AND (Ord(Key) <> 3) AND (Ord(Key) <> 45)) then
    Key := Chr(0);
end;

procedure TMForm.edNpcZKeyPress(Sender: TObject; var Key: Char);
begin
  if (((Ord(Key) > 57) OR (Ord(Key) < 48)) AND (Ord(Key) <> 8) AND (Ord(Key) <> 22) AND (Ord(Key) <> 3) AND (Ord(Key) <> 45)) then
    Key := Chr(0);
end;

procedure TMForm.edTerrRadiusKeyPress(Sender: TObject; var Key: Char);
begin
  if (((Ord(Key) > 57) OR (Ord(Key) < 48)) AND (Ord(Key) <> 8) AND (Ord(Key) <> 22) AND (Ord(Key) <> 3) AND (Ord(Key) <> 45)) then
    Key := Chr(0);
end;

procedure TMForm.edTerrCounterKeyPress(Sender: TObject; var Key: Char);
begin
  if (((Ord(Key) > 57) OR (Ord(Key) < 48)) AND (Ord(Key) <> 8) AND (Ord(Key) <> 22) AND (Ord(Key) <> 3) AND (Ord(Key) <> 45)) then
    Key := Chr(0);
end;

procedure TMForm.edTerrHeightKeyPress(Sender: TObject; var Key: Char);
begin
  if (((Ord(Key) > 57) OR (Ord(Key) < 48)) AND (Ord(Key) <> 8) AND (Ord(Key) <> 22) AND (Ord(Key) <> 3) AND (Ord(Key) <> 45)) then
    Key := Chr(0);
end;

procedure TMForm.btnClearClick(Sender: TObject);
begin
  memResult.Clear;
  btnCopy.Enabled := false;
  btnSave.Enabled := false;
  btnClear.Enabled := false;
end;

procedure TMForm.edNpcCountKeyPress(Sender: TObject; var Key: Char);
begin
  if (((Ord(Key) > 57) OR (Ord(Key) < 48)) AND (Ord(Key) <> 8) AND (Ord(Key) <> 22)) then
    Key := Chr(0);
end;

Function HexToInt(HexValue:String):Integer;
const
  HEX:ARRAY['A'..'F'] OF INTEGER=(10,11,12,13,14,15);

var
  Int,i:integer;

begin
  Result:=-1;
  Int:=0;
  FOR i:=1 TO Length(HexValue) DO
    IF HexValue[i] < 'A' THEN
    begin
      Int:=Int * 16 + ORD(HexValue[i]) - 48;
      Result:=int;
    end
    ELSE
    begin
      Int:=Int * 16 + HEX[HexValue[i]];
      Result:=int;
    end;
end;

//read memory
Function MainReadByteIZFile(MainAddress:integer):String;
var HandleWindow : cardinal;
    ipBase: Pointer;
    IpBuf : single;
    numberRead: DWORD;
    hWn: HWND;
    PID: DWord;
begin
  hWn := HWND(FindWindow(nil, PChar('Lineage II')));
  if not IsWindow(hWn) then
  begin
    MessageDlg('Program not running.', mtWarning, [mbOK], 0);
    exit;
  end;
  GetWindowThreadProcessId(hWn, @PID);
 HandleWindow:=OpenProcess(PROCESS_VM_READ,False,PID);
 ipBase:=ptr(MainAddress);
 ReadProcessMemory(HandleWindow, ipBase, @ipbuf, 4, numberRead);
 result := FloatToStr(ipbuf);
 CloseHandle(HandleWindow);
end;

//read memory
Function MainReadByteIZFile2(MainAddress:integer):String;
var HandleWindow : cardinal;
    ipBase: Pointer;
    IpBuf : integer;
    numberRead: DWORD;
    hWn: HWND;
    PID: DWord;
begin
  hWn := HWND(FindWindow(nil, PChar('Lineage II')));
  if not IsWindow(hWn) then
  begin
    MessageDlg('Program not running.', mtWarning, [mbOK], 0);
    exit;
  end;
  GetWindowThreadProcessId(hWn, @PID);
 HandleWindow:=OpenProcess(PROCESS_VM_READ,False,PID);
 ipBase:=ptr(MainAddress);
 ReadProcessMemory(HandleWindow, ipBase, @ipbuf, 4, numberRead);
 result := FloatToStr(ipbuf);
 CloseHandle(HandleWindow);
end;

procedure TMForm.btnReadClick(Sender: TObject);
begin
  if (btnRead.Caption = 'Read') then
  begin
    tmrReadMem.Enabled := true;
    edMemOffset.Enabled := false;
    
    btnRead.Caption := 'Stop';
  end
  else
  begin
    tmrReadMem.Enabled := false;
    btnRead.Caption := 'Read';
    edMemOffset.Enabled := true;
  end
end;

function BinToInt(Value: string): Integer;
 var
   i, iValueSize: Integer;
 begin
   Result := 0;
   iValueSize := Length(Value);
   for i := iValueSize downto 1 do
     if Value[i] = '1' then Result := Result + (1 shl (iValueSize - i));
 end;


 // Integer to Binary 

function IntToBin1(Value: Longint; Digits: Integer): string;
 var
   i: Integer;
 begin
   Result := '';
   for i := Digits downto 0 do
     if Value and (1 shl i) <> 0 then
       Result := Result + '1'
   else
     Result := Result + '0';
 end;

procedure TMForm.tmrReadMemTimer(Sender: TObject);
var
  value: string;
  deg: integer;
  x, y: integer;
begin
  if (rbX.Checked) then
  begin
    value := MainReadByteIZFile(HexToInt(edMemOffset.Text));
    if (Pos(',', value) > 0) then
    begin
      edNpcX.Text := Copy(value, 0, Pos(',', value)-1);
      x := StrToInt(Copy(value, 0, Pos(',', value)-1));
    end
    else
    begin
      edNpcX.Text := value;
      x := StrToInt(value);
    end;
    value := MainReadByteIZFile(HexToInt(edMemOffset.Text)+4);
    if (Pos(',', value) > 0) then
    begin
      edNpcY.Text := Copy(value, 0, Pos(',', value)-1);
      y := StrToInt(Copy(value, 0, Pos(',', value)-1));
    end
    else
    begin
      edNpcY.Text := value;
      y := StrToInt(value);
    end;
    value := MainReadByteIZFile(HexToInt(edMemOffset.Text)+8);
    if (Pos(',', value) > 0) then
      edNpcZ.Text := IntToStr(StrToInt(Copy(value, 0, Pos(',', value)-1)))
    else
      edNpcZ.Text := IntToStr(StrToInt(value));
  end
  else
  begin
    value := MainReadByteIZFile(HexToInt(edMemOffset.Text));
    if (Pos(',', value) > 0) then
    begin
      edNPCXYZ.Text := Copy(value, 0, Pos(',', value)-1) + ';';
      x := StrToInt(Copy(value, 0, Pos(',', value)-1));
    end
    else
    begin
      edNPCXYZ.Text := value + ';';
      x := StrToInt(value);
    end;
    value := MainReadByteIZFile(HexToInt(edMemOffset.Text)+4);
    if (Pos(',', value) > 0) then
    begin
      edNPCXYZ.Text := edNPCXYZ.Text + Copy(value, 0, Pos(',', value)-1) + ';';
      y := StrToInt(Copy(value, 0, Pos(',', value)-1));
    end
    else
    begin
      edNPCXYZ.Text := edNPCXYZ.Text + value + ';';
      y := StrToInt(value);
    end;
    value := MainReadByteIZFile(HexToInt(edMemOffset.Text)+8);
    if (Pos(',', value) > 0) then
      edNPCXYZ.Text := edNPCXYZ.Text + Copy(value, 0, Pos(',', value)-1)
    else
      edNPCXYZ.Text := edNPCXYZ.Text + value;
  end;
  //lblMapNum.Caption := 'Map #: {' + IntToStr((x div 32768) + 20) + ';' + IntToStr((y div 32768) + 18) + '}';
  value := MainReadByteIZFile2(HexToInt(edMemOffset.Text)+Offset);
  if (chkMemShowAngle.Checked) then
  begin
    if (StrToInt(value) < 0) then
      value := IntToStr(32768 + 32768 + StrToInt(value));
    deg := Round(360 * StrToInt(value) / 65535);
    TrackBar1.Position := Trunc((deg + 90) * 10) mod 3600;
    TrackBar1Change(Self);
  end;
end;

procedure TMForm.FormClose(Sender: TObject; var Action: TCloseAction);
var
  Settings : TIniFile;

begin
  Settings := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\settings.ini');
  Settings.WriteString('main','Radius',edTerrRadius.Text);
  Settings.WriteString('main','Height',edTerrHeight.Text);

  if (rbtnNpcMaker.Checked) then
    Settings.WriteString('main','MakerType','1')
  else
    Settings.WriteString('main','MakerType','2');

  if (trim(edMemOffset.Text) <> '') then
    Settings.WriteString('main','Address',edMemOffset.Text);

  if (chkAutoCounter.Checked) then
    Settings.WriteString('main','AutoCounter','1')
  else
    Settings.WriteString('main','AutoCounter','0');

  if (chkAutoClear.Checked) then
    Settings.WriteString('main','AutoClear','1')
  else
    Settings.WriteString('main','AutoClear','0');

  if (chkAnywhere.Checked) then
    Settings.WriteString('main','Anywhere','1')
  else
    Settings.WriteString('main','Anywhere','0');

  if (chkScroll.Checked) then
    Settings.WriteString('main','AutoScroll','1')
  else
    Settings.WriteString('main','AutoScroll','0');

  if (rbFullInfo.Checked) then
    Settings.WriteString('main','ResultType','1')
  else if (rbOnlyNpc.Checked) then
    Settings.WriteString('main','ResultType','2')
  else
    Settings.WriteString('main','ResultType','3');

  if (rbTerrByRadius.Checked) then
    Settings.WriteString('main','TerrByType','1')
  else if (rbTerrByVertices.Checked) then
    Settings.WriteString('main','TerrByType','2')
  else
    Settings.WriteString('main','TerrByType','3');

  if (rbX.Checked) then
    Settings.WriteString('main','CoordType','1')
  else
    Settings.WriteString('main','CoordType','2');

  if (chkAngle.Checked) then
    Settings.WriteString('main','WithAngle','1')
  else
    Settings.WriteString('main','WithAngle','0');

  if (chkMemShowAngle.Checked) then
    Settings.WriteString('main','MemAngle','1')
  else
    Settings.WriteString('main','MemAngle','0');

  Settings.WriteInteger('window','PosLeft',MForm.Left);
  Settings.WriteInteger('window','PosTop',MForm.Top);
  Settings.Free;
end;

procedure TMForm.btnCopyClick(Sender: TObject);
begin
  if (memResult.SelText <> '') then
    Clipboard.AsText := memResult.SelText
  else
    Clipboard.AsText := memResult.Text;
end;

procedure TMForm.RotateImage1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
var
  Theta, Angle: Extended;
begin
  if Dragging then
  begin
    if X = RotateImage1.Width / 2 then
      if Y < RotateImage1.Height / 2 then
        Theta := Pi / 2
      else
        Theta := -Pi / 2
    else
      Theta := ArcTan2(Y - RotateImage1.Height / 2, X - RotateImage1.Width / 2);
    Angle := StartAngle + 180 * (StartTheta - Theta) / Pi;
    TrackBar1.Position := Trunc(Angle * 10) mod 3600;
    TrackBar1Change(Self);
  end;
end;

procedure TMForm.RotateImage1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Dragging := False;
end;

procedure TMForm.RotateImage1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Dragging := (Button = mbLeft) and not (ssDouble in Shift);
  if Dragging then
  begin
    StartAngle := RotateImage1.Angle;
    if X = RotateImage1.Width / 2 then
      if Y < RotateImage1.Height / 2 then
        StartTheta := Pi / 2
      else
        StartTheta := -Pi / 2
    else
      StartTheta := ArcTan2(Y - RotateImage1.Height / 2, X - RotateImage1.Width / 2);
  end;
end;

procedure TMForm.TrackBar1Change(Sender: TObject);
begin
  RotateImage1.Angle := TrackBar1.Position / 10;
  lblAngle.Caption := Format('Angle = %f°', [RotateImage1.Angle]);
  Update;

  if ((RotateImage1.Angle >= 0) AND (abs(RotateImage1.Angle) - 90 < 0)) then
    lblRadar.Caption := IntToStr(Round((270 + abs(RotateImage1.Angle)) * 182.0444))
  else if ((RotateImage1.Angle < 0) AND (abs(RotateImage1.Angle) <= 270)) then
    lblRadar.Caption := IntToStr(Round((270 - abs(RotateImage1.Angle)) * 182.0444))
  else if ((RotateImage1.Angle < 0) AND (abs(RotateImage1.Angle) > 270)) then
    lblRadar.Caption := IntToStr(Round((360 - abs(RotateImage1.Angle) + 270) * 182.0444))
  else
    lblRadar.Caption := IntToStr(Round((abs(RotateImage1.Angle) - 90) * 182.0444));

  //lblRadar.Caption := FloatToStr(abs(RotateImage1.Angle));
  btnNE.Perform( BM_SETSTATE, 0, 0 );
  btnNE.Tag := 0;
  btnE.Perform( BM_SETSTATE, 0, 0 );
  btnE.Tag := 0;
  btnSE.Perform( BM_SETSTATE, 0, 0 );
  btnSE.Tag := 0;
  btnS.Perform( BM_SETSTATE, 0, 0 );
  btnS.Tag := 0;
  btnSW.Perform( BM_SETSTATE, 0, 0 );
  btnSW.Tag := 0;
  btnN.Perform( BM_SETSTATE, 0, 0 );
  btnN.Tag := 0;
  btnNW.Perform( BM_SETSTATE, 0, 0 );
  btnNW.Tag := 0;
  btnW.Perform( BM_SETSTATE, 0, 0 );
  btnW.Tag := 0;
end;

procedure TMForm.Image2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Dragging := (Button = mbLeft) and not (ssDouble in Shift);
  if Dragging then
  begin
    StartAngle := RotateImage1.Angle;
    if X = RotateImage1.Width / 2 then
      if Y < RotateImage1.Height / 2 then
        StartTheta := Pi / 2
      else
        StartTheta := -Pi / 2
    else
      StartTheta := ArcTan2(Y - RotateImage1.Height / 2, X - RotateImage1.Width / 2);
  end;
end;

procedure TMForm.Image2MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Theta, Angle: Extended;
begin
  if Dragging then
  begin
    if X = RotateImage1.Width / 2 then
      if Y < RotateImage1.Height / 2 then
        Theta := Pi / 2
      else
        Theta := -Pi / 2
    else
      Theta := ArcTan2(Y - RotateImage1.Height / 2, X - RotateImage1.Width / 2);
    Angle := StartAngle + 180 * (StartTheta - Theta) / Pi;
    TrackBar1.Position := Trunc(Angle * 10) mod 3600;
    TrackBar1Change(Self);
  end;
end;

procedure TMForm.Image2MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Dragging := False;
end;

procedure TMForm.rbtnNpcMakerClick(Sender: TObject);
var
  List : TIniFile;
  Param : string;
  Cnt, i : integer;
begin
  edNpcMakerPrefix.Enabled := false;
  edNpcMakerPostfix.Enabled := false;
  edNpcMakerAI.Enabled := false;
  List := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\settings.ini');
  Cnt := List.ReadInteger('NpcMakerParams','ParamsCount',0);
  cbAddParamsList.Clear;
  for i := 1 to Cnt+1 do
  begin
     Param := List.ReadString('NpcMakerParams','Param'+IntToStr(i),'');
     if (Param <> '') then
        cbAddParamsList.Items.Add(Param);
  end;
end;

procedure TMForm.rbtnNpcMakerExClick(Sender: TObject);
var
  List : TIniFile;
  Param : string;
  Cnt, i : integer;
begin
  edNpcMakerPrefix.Enabled := true;
  edNpcMakerPostfix.Enabled := true;
  edNpcMakerAI.Enabled := true;
  List := TIniFile.Create(ExtractFilePath(Application.ExeName) + '\settings.ini');
  Cnt := List.ReadInteger('NpcMakerExParams','ParamsCount',0);
  cbAddParamsList.Clear;
  for i := 1 to Cnt+1 do
  begin
     Param := List.ReadString('NpcMakerExParams','Param'+IntToStr(i),'');
     if (Param <> '') then
        cbAddParamsList.Items.Add(Param);
  end;
end;

procedure TMForm.cbAddParamsListSelect(Sender: TObject);
begin
  if ((((Copy(trim(edNpcMakerAddParams.Text), 0, Length(cbAddParamsList.Text) - 1 ) + '=') <> (cbAddParamsList.Text) + '=')) AND
  (Pos(cbAddParamsList.Text + '=', edNpcMakerAddParams.Text) = 0)) then
  begin
    edNpcMakerAddParams.Text := trim(edNpcMakerAddParams.Text + ' ' + cbAddParamsList.Text + '=');
    edNpcMakerAddParams.SetFocus;
    edNpcMakerAddParams.SelStart:=Length(edNpcMakerAddParams.Text);
  end
  else
  begin
    edNpcMakerAddParams.SetFocus;
    edNpcMakerAddParams.SelStart:=Length(edNpcMakerAddParams.Text);
  end
end;


procedure TMForm.cbNpcAddParamsListSelect(Sender: TObject);
begin
  if ((((Copy(trim(edNpcAddParams.Text), 0, Length(cbNpcAddParamsList.Text) - 1 ) + '=') <> (cbNpcAddParamsList.Text) + '=')) AND
  (Pos(cbNpcAddParamsList.Text + '=', edNpcAddParams.Text) = 0)) then
  begin
    edNpcAddParams.Text := trim(edNpcAddParams.Text + ' ' + cbNpcAddParamsList.Text + '=');
    edNpcAddParams.SetFocus;
    edNpcAddParams.SelStart:=Length(edNpcAddParams.Text);
  end
  else
  begin
    edNpcAddParams.SetFocus;
    edNpcAddParams.SelStart:=Length(edNpcAddParams.Text);
  end

end;

procedure TMForm.memResultChange(Sender: TObject);
begin
  if (memResult.Text <> '') then
  begin
    btnCopy.Enabled := true;
    btnSave.Enabled := true;
    btnClear.Enabled := true;
  end
  else
  begin
    btnCopy.Enabled := false;
    btnSave.Enabled := false;
    btnClear.Enabled := false;
  end
end;

procedure TMForm.btnSaveClick(Sender: TObject);
var
  S: TStringList;
  E: TEncoding;
begin
  E := TEncoding.Create();
  if (SaveDialog1.Execute) then
  begin
    if (FileExists(SaveDialog1.FileName) = false) then
      memResult.Lines.SaveToFile(SaveDialog1.FileName)
    else
    begin
      case MessageDlg('File ' + ExtractFileName(SaveDialog1.FileName) + ' already exists. Do you really want to rewrite it?', mtWarning, [mbYes, mbNo], 0) of
        mrYes :
        begin
          S := TStringList.Create();
          S.AddStrings(memResult.Lines);
          S.SaveToFile(SaveDialog1.FileName, E.Unicode);
          //memResult.Lines.SaveToFile(SaveDialog1.FileName);
        end;
      end;
    end;
  end;
end;

procedure TMForm.btnSearchOffsetClick(Sender: TObject);
begin
  frmSearchOffset.ShowModal();
end;

procedure TMForm.rbXClick(Sender: TObject);
begin
  edNpcX.Enabled := true;
  edNpcY.Enabled := true;
  edNpcZ.Enabled := true;
  edNPCXYZ.Enabled := false;
end;

procedure TMForm.rbXYZClick(Sender: TObject);
begin
  edNpcX.Enabled := false;
  edNpcY.Enabled := false;
  edNpcZ.Enabled := false;
  edNPCXYZ.Enabled := true;
end;

procedure TMForm.rbOnlyPointClick(Sender: TObject);
begin
  chkAngle.Enabled := true;
end;

procedure TMForm.rbOnlyNpcClick(Sender: TObject);
begin
  chkAngle.Enabled := false;
end;

procedure TMForm.rbFullInfoClick(Sender: TObject);
begin
  chkAngle.Enabled := false;
end;

procedure TMForm.edTerrZEnter(Sender: TObject);
begin
  rbTerrByRadius.Checked := true;
end;

procedure TMForm.edTerrRadiusEnter(Sender: TObject);
begin
  rbTerrByRadius.Checked := true;
end;

procedure TMForm.edTerrVertex1Enter(Sender: TObject);
begin
  rbTerrByVertices.Checked := true;
end;

procedure TMForm.edTerrVertex2Enter(Sender: TObject);
begin
  rbTerrByVertices.Checked := true;
end;

procedure TMForm.memTerrCoordsEnter(Sender: TObject);
begin
  rbTerrByAnyData.Checked := true;
end;

procedure TMForm.edNPCXYZChange(Sender: TObject);
var
  X, Y, Z, k, i, j: integer;
  R: TRegExp;
  mc: MatchCollection;
  m: Match;
  sm: SubMatches;
begin
if (rbX.Checked) then
  begin
    X := StrToInt(edNpcX.Text);
    Y := StrToInt(edNpcY.Text);
    Z := StrToInt(edNpcZ.Text);
  end
  else
  begin
    R := TRegExp.Create(Self);
    try
      R.Pattern := '([-]*[\d]+)';
      R.IgnoreCase := false;
      R.Global := True;
      mc := R.Execute(edNPCXYZ.Text) AS MatchCollection;
      X := 0;
      Y := 0;
      Z := 0;
      k := 0;
      if mc.Count > 0 then begin
        for i := 0 to mc.Count - 1 do begin
          m := mc[i] as Match;
          // разбираем субсоответствия (сгруппированные в скобках)
          sm := m.SubMatches as SubMatches;
          for j := 0 to sm.Count - 1 do
          begin
            if (VarToStr(sm.Item[j]) <> '') AND (k < 3) then
            begin
              k := k + 1;
              case k of
                1: X := StrToInt(VarToStr(sm.Item[j]));
                2: Y := StrToInt(VarToStr(sm.Item[j]));
                3: Z := StrToInt(VarToStr(sm.Item[j]));
              end;
            end;
          end;
        end;
      end;
      for i := k + 1 to 3 do
        case i of
          1: X := 0;
          2: Y := 0;
          3: Z := 0;
        end;
    finally
      m := nil;
      sm := nil;
      mc := nil;
      R.Free;
    end;
  end;
  //ShowMessage(IntToStr(X));
  lblMapNum.Caption := 'Map #: {' + IntToStr((X div 32768) + 20) + ';' + IntToStr((Y div 32768) + 18) + '}';
end;

end.

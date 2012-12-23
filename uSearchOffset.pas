unit uSearchOffset;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, ValEdit, StdCtrls;

type
  TfrmSearchOffset = class(TForm)
    Label1: TLabel;
    StaticText1: TStaticText;
    StaticText2: TStaticText;
    StaticText3: TStaticText;
    edNpcX: TEdit;
    X: TLabel;
    Label2: TLabel;
    edNpcY: TEdit;
    edNpcZ: TEdit;
    Label3: TLabel;
    btnSearch: TButton;
    ValueListEditor1: TValueListEditor;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSearchOffset: TfrmSearchOffset;

implementation

{$R *.dfm}

end.

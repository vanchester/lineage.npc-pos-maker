program NpcPosMaker;

uses
  Forms,
  pngimage,
  uNpcPosMaker in 'uNpcPosMaker.pas' {MForm},
  uSearchOffset in 'uSearchOffset.pas' {frmSearchOffset},
  VBScript_RegExp_55_TLB in '..\..\Imports\VBScript_RegExp_55_TLB.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'NpcPosMaker';
  Application.CreateForm(TMForm, MForm);
  Application.CreateForm(TfrmSearchOffset, frmSearchOffset);
  Application.Run;
end.

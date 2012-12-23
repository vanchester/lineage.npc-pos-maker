object frmSearchOffset: TfrmSearchOffset
  Left = 324
  Top = 339
  Width = 415
  Height = 317
  Caption = 'Search Offset'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 6
    Top = 6
    Width = 52
    Height = 13
    Caption = 'Instruction:'
  end
  object X: TLabel
    Left = 6
    Top = 78
    Width = 7
    Height = 13
    Caption = 'X'
  end
  object Label2: TLabel
    Left = 142
    Top = 78
    Width = 7
    Height = 13
    Caption = 'Y'
  end
  object Label3: TLabel
    Left = 274
    Top = 78
    Width = 7
    Height = 13
    Caption = 'Z'
  end
  object StaticText1: TStaticText
    Left = 6
    Top = 22
    Width = 190
    Height = 17
    Caption = '1. Run l2.exe and enter the game world'
    TabOrder = 0
  end
  object StaticText2: TStaticText
    Left = 6
    Top = 38
    Width = 142
    Height = 17
    Caption = '2. Run command /loc in chat'
    TabOrder = 1
  end
  object StaticText3: TStaticText
    Left = 6
    Top = 54
    Width = 220
    Height = 17
    Caption = '3. Enter the result of command in fields below:'
    TabOrder = 2
  end
  object edNpcX: TEdit
    Left = 18
    Top = 74
    Width = 109
    Height = 21
    TabOrder = 3
    Text = '0'
  end
  object edNpcY: TEdit
    Left = 154
    Top = 74
    Width = 109
    Height = 21
    TabOrder = 4
    Text = '0'
  end
  object edNpcZ: TEdit
    Left = 286
    Top = 74
    Width = 109
    Height = 21
    BevelEdges = []
    TabOrder = 5
    Text = '0'
  end
  object btnSearch: TButton
    Left = 162
    Top = 106
    Width = 75
    Height = 25
    Caption = 'Search'
    TabOrder = 6
  end
  object ValueListEditor1: TValueListEditor
    Left = 4
    Top = 132
    Width = 399
    Height = 151
    TabOrder = 7
    TitleCaptions.Strings = (
      'Offset'
      'Value')
    ColWidths = (
      131
      262)
  end
end

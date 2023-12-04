object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'RbnFilter'
  ClientHeight = 299
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Label1: TLabel
    Left = 288
    Top = 8
    Width = 291
    Height = 19
    Caption = 'RBN RAW'#12487#12540#12479#12398#37325#35079#12434#21066#38500#12375#12414#12377
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentFont = False
  end
  object buttonStart: TButton
    Left = 488
    Top = 120
    Width = 113
    Height = 33
    Caption = #38283#22987
    TabOrder = 0
    OnClick = buttonStartClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 257
    Height = 281
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #65325#65331' '#12468#12471#12483#12463
    Font.Style = []
    Lines.Strings = (
      'Memo1')
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object editFileName: TEdit
    Left = 271
    Top = 72
    Width = 338
    Height = 20
    TabOrder = 2
  end
  object buttonFileRef: TButton
    Left = 520
    Top = 40
    Width = 81
    Height = 26
    Caption = #21442#29031
    TabOrder = 3
    OnClick = buttonFileRefClick
  end
  object GroupBox1: TGroupBox
    Left = 271
    Top = 192
    Width = 146
    Height = 81
    Caption = 'date'#12398#27604#36611#25991#23383#25968
    TabOrder = 4
    object checkDateCompare13: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = '13'#25991#23383'('#26178#12414#12391')'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object checkDateCompare16: TRadioButton
      Left = 16
      Top = 47
      Width = 113
      Height = 17
      Caption = '16'#25991#23383'('#20998#12414#12391')'
      TabOrder = 1
    end
  end
  object GroupBox2: TGroupBox
    Left = 271
    Top = 98
    Width = 146
    Height = 81
    Caption = 'dx'#12398#27604#36611#26041#27861
    TabOrder = 5
    object radioDxPfx: TRadioButton
      Left = 16
      Top = 24
      Width = 113
      Height = 17
      Caption = #12459#12531#12488#12522#12540'(dx_pfx)'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object radioDxCont: TRadioButton
      Left = 16
      Top = 47
      Width = 113
      Height = 17
      Caption = #22823#38520'(dx_cont)'
      TabOrder = 1
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 456
    Top = 232
  end
end

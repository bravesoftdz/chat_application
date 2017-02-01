object Form1: TForm1
  Left = 336
  Top = 294
  Width = 316
  Height = 322
  Caption = 'Chat'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblNE: TLabel
    Left = 40
    Top = 120
    Width = 218
    Height = 13
    Caption = 'Create a new chat or connect to existing one?'
    Visible = False
  end
  object lblEnterName: TLabel
    Left = 96
    Top = 96
    Width = 114
    Height = 13
    Caption = 'Please enter your name:'
  end
  object edtMessage: TEdit
    Left = 8
    Top = 8
    Width = 201
    Height = 21
    TabOrder = 0
    Visible = False
  end
  object btnSend: TButton
    Left = 214
    Top = 8
    Width = 76
    Height = 21
    Caption = 'Send!'
    Default = True
    TabOrder = 1
    Visible = False
    OnClick = btnSendClick
  end
  object redChatBox: TRichEdit
    Left = 8
    Top = 34
    Width = 281
    Height = 185
    DragMode = dmAutomatic
    HideSelection = False
    HideScrollBars = False
    Lines.Strings = (
      'redChatBox')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 2
    Visible = False
  end
  object btnClear: TButton
    Left = 8
    Top = 224
    Width = 281
    Height = 25
    Caption = 'Clear Chat'
    TabOrder = 3
    Visible = False
    OnClick = btnClearClick
  end
  object btnName: TButton
    Left = 136
    Top = 128
    Width = 153
    Height = 21
    Caption = 'Enter Name'
    TabOrder = 4
    OnClick = btnNameClick
  end
  object edtName: TEdit
    Left = 8
    Top = 128
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object btnNewChat: TButton
    Left = 72
    Top = 136
    Width = 75
    Height = 25
    Caption = 'New'
    TabOrder = 6
    Visible = False
    OnClick = btnNewChatClick
  end
  object btnExistingChat: TButton
    Left = 152
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Existing'
    TabOrder = 7
    Visible = False
    OnClick = btnExistingChatClick
  end
  object edtChatID: TEdit
    Left = 40
    Top = 136
    Width = 121
    Height = 21
    TabOrder = 8
    Visible = False
  end
  object btnChatID: TButton
    Left = 176
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Connect'
    TabOrder = 9
    Visible = False
    OnClick = btnChatIDClick
  end
  object edtChatIDDisplay: TEdit
    Left = 8
    Top = 256
    Width = 281
    Height = 21
    ReadOnly = True
    TabOrder = 10
    Visible = False
  end
end

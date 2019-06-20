object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'ViaCEP - Delphi'
  ClientHeight = 302
  ClientWidth = 569
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Memo1: TMemo
    Left = 0
    Top = 39
    Width = 569
    Height = 263
    Align = alBottom
    Lines.Strings = (
      'Memo1')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 135
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 10
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
  end
end

object Form7: TForm7
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1080#1077' '#1072#1075#1077#1085#1090#1072
  ClientHeight = 269
  ClientWidth = 495
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 158
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1060#1048#1054' '#1072#1075#1077#1085#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 60
    Width = 125
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1086#1090#1076#1077#1083':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 120
    Width = 166
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1086#1082#1083#1072#1076' '#1072#1075#1077#1085#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 172
    Width = 189
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1079#1072#1088#1087#1083#1072#1090#1091' '#1072#1075#1077#1085#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 8
    Top = 33
    Width = 478
    Height = 21
    TabOrder = 0
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 85
    Width = 479
    Height = 21
    KeyField = 'ID'
    ListField = 'NameDepartment'
    ListSource = DataSource1
    TabOrder = 1
  end
  object Edit2: TEdit
    Left = 8
    Top = 145
    Width = 478
    Height = 21
    TabOrder = 2
  end
  object Edit3: TEdit
    Left = 8
    Top = 197
    Width = 478
    Height = 21
    TabOrder = 3
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 232
    Width = 233
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1072#1075#1077#1085#1090#1072
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 4
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 254
    Top = 232
    Width = 233
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 5
    OnClick = BitBtn2Click
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM DEPARTMENTTABLE;')
    Left = 320
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 368
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 408
    Top = 168
  end
  object ADOQuery3: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 264
    Top = 104
  end
end

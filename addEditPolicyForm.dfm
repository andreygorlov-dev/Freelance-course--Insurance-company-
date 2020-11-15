object Form11: TForm11
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #1044#1080#1072#1083#1086#1075' '#1076#1086#1073#1072#1074#1083#1077#1085#1080#1103'/'#1080#1079#1084#1077#1085#1077#1085#1080#1103' '#1087#1086#1083#1080#1089#1072
  ClientHeight = 429
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
  object Label2: TLabel
    Left = 8
    Top = 8
    Width = 130
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1072#1075#1077#1085#1090#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 8
    Top = 64
    Width = 141
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1082#1083#1080#1077#1085#1090#1072':'
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
    Width = 143
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1089#1086#1073#1099#1090#1080#1077':'
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
    Width = 341
    Height = 19
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1076#1086' '#1082#1072#1082#1086#1081' '#1076#1072#1090#1099' '#1076#1077#1081#1089#1090#1074#1080#1090#1077#1083#1077#1085' '#1087#1086#1083#1080#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 232
    Width = 166
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1091#1084#1084#1091' '#1074#1079#1085#1086#1089#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 8
    Top = 288
    Width = 171
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1091#1084#1084#1091' '#1074#1099#1087#1083#1072#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 8
    Top = 344
    Width = 240
    Height = 19
    Caption = #1042#1074#1077#1076#1080#1090#1077' '#1089#1091#1084#1084#1091' '#1086#1087#1083#1072#1090#1099' '#1079#1072' '#1087#1086#1083#1080#1089':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 8
    Top = 33
    Width = 479
    Height = 21
    KeyField = 'ID'
    ListField = 'FIO'
    ListSource = DataSource1
    TabOrder = 0
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 8
    Top = 89
    Width = 479
    Height = 21
    KeyField = 'ID'
    ListField = 'FIO'
    ListSource = DataSource2
    TabOrder = 1
  end
  object DBLookupComboBox3: TDBLookupComboBox
    Left = 8
    Top = 145
    Width = 479
    Height = 21
    KeyField = 'ID'
    ListField = 'NameEvent'
    ListSource = DataSource3
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 8
    Top = 197
    Width = 479
    Height = 21
    Date = 44150.000000000000000000
    Time = 0.558815324075112600
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 8
    Top = 257
    Width = 479
    Height = 21
    TabOrder = 4
  end
  object Edit2: TEdit
    Left = 8
    Top = 313
    Width = 479
    Height = 21
    TabOrder = 5
  end
  object Edit3: TEdit
    Left = 8
    Top = 369
    Width = 479
    Height = 21
    TabOrder = 6
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 396
    Width = 233
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1087#1086#1083#1080#1089
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 7
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 247
    Top = 396
    Width = 240
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 8
    OnClick = BitBtn2Click
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM AgentTABLE;')
    Left = 320
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 368
    Top = 8
  end
  object ADOQuery2: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM CLIENTTABLE;')
    Left = 328
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery2
    Left = 376
    Top = 80
  end
  object ADOQuery3: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM EVENTTABLE;')
    Left = 344
    Top = 136
  end
  object DataSource3: TDataSource
    DataSet = ADOQuery3
    Left = 392
    Top = 144
  end
  object ADOQuery4: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM EVENTTABLE;')
    Left = 320
    Top = 280
  end
end

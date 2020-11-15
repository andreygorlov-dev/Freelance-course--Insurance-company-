object Form6: TForm6
  Left = 0
  Top = 0
  Caption = #1055#1086#1083#1080#1089#1099
  ClientHeight = 470
  ClientWidth = 772
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 756
    Height = 423
    DataSource = DataSource2
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIO'
        Title.Caption = #1060#1048#1054' '#1072#1075#1077#1085#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FIO_1'
        Title.Caption = #1060#1048#1054' '#1082#1083#1080#1077#1085#1090#1072
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NameEvent'
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1089#1086#1073#1099#1090#1080#1103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valid_Until'
        Title.Caption = #1057#1088#1086#1082' '#1076#1077#1081#1089#1090#1074#1080#1103' '#1076#1086
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Contribution_Amount'
        Title.Caption = #1057#1091#1084#1084#1072' '#1074#1079#1085#1086#1089#1086#1074
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Payout_Amount'
        Title.Caption = #1057#1091#1084#1084#1072' '#1074#1099#1087#1083#1072#1090
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Gonorar'
        Title.Caption = #1054#1087#1083#1072#1090#1072' '#1079#1072' '#1087#1086#1083#1080#1089
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 772
    Height = 33
    Caption = 'ToolBar1'
    Images = Form1.ImageList1
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    ExplicitWidth = 788
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 3
      OnClick = ToolButton3Click
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 46
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
      OnClick = ToolButton2Click
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 0
      Width = 44
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
      Visible = False
    end
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT PolicyTable.ID, AgentTable.FIO, ClientTable.FIO, EventTab' +
        'le.NameEvent, PolicyTable.Valid_Until, PolicyTable.Contribution_' +
        'Amount, PolicyTable.Payout_Amount, PolicyTable.Gonorar'
      
        'FROM AgentTable INNER JOIN (ClientTable INNER JOIN (EventTable I' +
        'NNER JOIN PolicyTable ON EventTable.ID = PolicyTable.Event_ID) O' +
        'N ClientTable.ID = PolicyTable.Client_ID) ON AgentTable.ID = Pol' +
        'icyTable.Agent_ID;')
    Left = 200
    Top = 192
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 328
    Top = 224
  end
  object ADOQuery2: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT AgentTable.FIO, DepartmentTable.NameDepartment, AgentTabl' +
        'e.Salary, AgentTable.Pay'
      
        'FROM DepartmentTable INNER JOIN AgentTable ON DepartmentTable.ID' +
        ' = AgentTable.Department_ID;')
    Left = 184
    Top = 304
  end
end

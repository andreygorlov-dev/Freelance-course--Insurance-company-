object Form2: TForm2
  Left = 0
  Top = 0
  Caption = #1040#1075#1077#1085#1090#1099
  ClientHeight = 470
  ClientWidth = 772
  Color = clBtnFace
  DefaultMonitor = dmPrimary
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
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Caption = 'Id'
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
        FieldName = 'NameDepartment'
        Title.Caption = #1054#1090#1076#1077#1083
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Salary'
        Title.Caption = #1054#1082#1083#1072#1076
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Pay'
        Title.Caption = #1047#1072#1088#1087#1083#1072#1090#1072
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
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 3
      OnClick = ToolButton1Click
    end
    object ToolButton2: TToolButton
      Left = 23
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 0
      OnClick = ToolButton2Click
    end
    object ToolButton3: TToolButton
      Left = 46
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 1
      OnClick = ToolButton3Click
    end
    object ToolButton4: TToolButton
      Left = 69
      Top = 0
      Width = 44
      Caption = 'ToolButton4'
      ImageIndex = 3
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
      
        'SELECT AgentTable.ID,AgentTable.FIO, DepartmentTable.NameDepartm' +
        'ent, AgentTable.Salary, AgentTable.Pay'
      
        'FROM DepartmentTable INNER JOIN AgentTable ON DepartmentTable.ID' +
        ' = AgentTable.Department_ID;')
    Left = 200
    Top = 192
  end
  object DataSource1: TDataSource
    DataSet = ADOQuery1
    Left = 328
    Top = 224
  end
  object ADOQuery2: TADOQuery
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    Left = 184
    Top = 328
  end
end

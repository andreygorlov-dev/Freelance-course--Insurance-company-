object Form6: TForm6
  Left = 0
  Top = 0
  Caption = #1055#1086#1083#1080#1089#1099
  ClientHeight = 469
  ClientWidth = 766
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
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 39
    Width = 750
    Height = 422
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 766
    Height = 33
    ButtonHeight = 33
    Caption = 'ToolBar1'
    Images = Form1.ImageList1
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    object ToolButton3: TToolButton
      Left = 0
      Top = 0
      Caption = 'ToolButton3'
      ImageIndex = 3
    end
    object ToolButton1: TToolButton
      Left = 23
      Top = 0
      Caption = 'ToolButton1'
      ImageIndex = 0
    end
    object ToolButton2: TToolButton
      Left = 46
      Top = 0
      Caption = 'ToolButton2'
      ImageIndex = 1
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
    object Edit1: TEdit
      Left = 113
      Top = 0
      Width = 121
      Height = 33
      TabOrder = 0
    end
    object ToolButton5: TToolButton
      Left = 234
      Top = 0
      Caption = 'ToolButton5'
      ImageIndex = 2
    end
  end
  object ADOQuery1: TADOQuery
    Active = True
    Connection = Form1.ADOConnection1
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT AgentTable.FIO, DepartmentTable.NameDepartment, AgentTabl' +
        'e.Salary, AgentTable.Pay'
      
        'FROM DepartmentTable INNER JOIN AgentTable ON DepartmentTable.ID' +
        ' = AgentTable.Department_ID;')
    Left = 200
    Top = 192
  end
  object DataSource2: TDataSource
    DataSet = ADOQuery1
    Left = 328
    Top = 224
  end
end

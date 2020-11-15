unit agentForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,addEditAgentForm;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ADOQuery1: TADOQuery;
    ADOQuery2: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  editFormOpen:boolean;
  selectRowId:integer=-1;

procedure RefreshData();

implementation

uses mainForm;

{$R *.dfm}

procedure RefreshData();
Begin
     Form2.ADOQuery1.Close;
     Form2.ADOQuery1.Open;
End;

procedure TForm2.DBGrid1CellClick(Column: TColumn);
begin
     selectRowId:=DBGrid1.DataSource.DataSet.FieldByName('Id').value;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     mainForm.agentFormOpen:=false;
     Form2.Free;
     Form2:=nil;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
    editFormOpen:=false;
    DBGrid1.Columns[0].Width:=Round(DBGrid1.Width/3/3)-20;
    DBGrid1.Columns[1].Width:=Round(DBGrid1.Width/3);
    DBGrid1.Columns[2].Width:=Round(DBGrid1.Width/3);
    DBGrid1.Columns[3].Width:=Round(DBGrid1.Width/3/3)-20;
    DBGrid1.Columns[4].Width:=Round(DBGrid1.Width/3/3)-20;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
     DBGrid1.Width:=Form2.Width-32;
     DBGrid1.Height:=Form2.Height-87;
     DBGrid1.Columns[0].Width:=Round(DBGrid1.Width/3/3)-20;
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width/3);
     DBGrid1.Columns[2].Width:=Round(DBGrid1.Width/3);
     DBGrid1.Columns[3].Width:=Round(DBGrid1.Width/3/3)-20;
     DBGrid1.Columns[4].Width:=Round(DBGrid1.Width/3/3)-20;
end;

procedure TForm2.ToolButton1Click(Sender: TObject);
var formEdit:tForm;
begin
     if(not(editFormOpen))then
     Begin
          Application.CreateForm(TForm7, Form7);
          formEdit:=addEditAgentForm.Form7;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;

end;

procedure TForm2.ToolButton2Click(Sender: TObject);
begin
     ADOQuery2.Close;
     ADOQuery2.SQL.Clear;
     if(selectRowId=-1)then
     Begin
          While(not(ADOQuery1.Eof))do
          Begin
               selectRowId:=ADOQuery1.FieldByName('ID').AsInteger;
               break;
          End;
     End;
     if(selectRowId=-1)then exit;
     ADOQuery2.SQL.Add('DELETE FROM AGENTTABLE WHERE(ID='+IntToStr(selectRowId)+')');
     AdoQuery2.ExecSQL;
     RefreshData;
end;

procedure TForm2.ToolButton3Click(Sender: TObject);
var formEdit:tForm;
begin
     if(selectRowId=-1)then
     Begin
          While(not(ADOQuery1.Eof))do
          Begin
               selectRowId:=ADOQuery1.FieldByName('ID').AsInteger;
               break;
          End;
     End;
     if(selectRowId=-1)then exit;
     if(not(editFormOpen))then
     Begin
          addEditAgentForm.idAgent:=selectRowId;
          Application.CreateForm(TForm7, Form7);
          formEdit:=addEditAgentForm.Form7;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;
end;

end.

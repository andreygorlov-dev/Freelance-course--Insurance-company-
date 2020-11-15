unit departmentForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,addEditDepartmentForm;

type
  TForm3 = class(TForm)
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ADOQuery2: TADOQuery;
    ADOQuery1: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ToolButton3Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  editFormOpen:boolean;
  selectRowId:integer=-1;

procedure RefreshData;

implementation

uses mainForm,agentForm;

{$R *.dfm}

procedure RefreshData();
Begin
     Form3.ADOQuery1.Close;
     Form3.ADOQuery1.Open;
End;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
     selectRowId:=DBGrid1.DataSource.DataSet.FieldByName('Id').value;
end;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     mainForm.departmentFormOpen:=false;
     Form3.Free;
     Form3:=nil;
end;

procedure TForm3.FormCreate(Sender: TObject);
begin
     editFormOpen:=false;
     DBGrid1.Columns[0].Width:=60;
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width/2)-60;
     DBGrid1.Columns[2].Width:=Round(DBGrid1.Width/2)-60;
end;

procedure TForm3.FormResize(Sender: TObject);
begin
     DBGrid1.Width:=Form3.Width-32;
     DBGrid1.Height:=Form3.Height-87;
     DBGrid1.Columns[0].Width:=60;
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width/2)-60;
     DBGrid1.Columns[2].Width:=Round(DBGrid1.Width/2)-60;
end;

procedure TForm3.ToolButton1Click(Sender: TObject);
var formEdit:tForm;
begin
     if(not(editFormOpen))then
     Begin
          Application.CreateForm(TForm8, Form8);
          formEdit:=addEditDepartmentForm.Form8;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;
end;

procedure TForm3.ToolButton2Click(Sender: TObject);
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
     ADOQuery2.SQL.Add('DELETE FROM DEPARTMENTTABLE WHERE(ID='+IntToStr(selectRowId)+')');
     AdoQuery2.ExecSQL;
     RefreshData;
     if (Assigned(agentForm.Form2))then agentForm.RefreshData;
end;

procedure TForm3.ToolButton3Click(Sender: TObject);
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
          addEditDepartmentForm.idDepartment:=selectRowId;
          Application.CreateForm(TForm8, Form8);
          formEdit:=addEditDepartmentForm.Form8;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;

end;

end.

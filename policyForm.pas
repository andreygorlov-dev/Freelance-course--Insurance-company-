unit policyForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls,addEditPolicyForm;

type
  TForm6 = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery2: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  selectRowId:integer=-1;
  editFormOpen:boolean;

procedure RefreshData;

implementation

uses mainForm;

{$R *.dfm}

procedure RefreshData();
Begin
     Form6.ADOQuery1.Close;
     Form6.ADOQuery1.Open;
End;

procedure TForm6.DBGrid1CellClick(Column: TColumn);
begin
     if(ADOQuery1.RecordCount=0)then exit;
     selectRowId:=DBGrid1.DataSource.DataSet.FieldByName('Id').value;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     mainForm.polycyFormOpen:=false;
     Form6.Free;
     Form6:=nil;
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
     editFormOpen:=false;
     DBGrid1.Width:=Form6.Width-32;
     DBGrid1.Height:=Form6.Height-87;
     DBGrid1.Columns[0].Width:=40;
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width/7)-5;
     DBGrid1.Columns[2].Width:=Round(DBGrid1.Width/7)-5;
     DBGrid1.Columns[3].Width:=Round(DBGrid1.Width/7)-5;
     DBGrid1.Columns[4].Width:=Round((DBGrid1.Width-(Round(DBGrid1.Width/7)*4+40))/4)+30;
     DBGrid1.Columns[5].Width:=Round((DBGrid1.Width-(Round(DBGrid1.Width/7)*4+40))/4)+20;
     DBGrid1.Columns[6].Width:=Round((DBGrid1.Width-(Round(DBGrid1.Width/7)*4+40))/4)+20;
     DBGrid1.Columns[7].Width:=Round((DBGrid1.Width-(Round(DBGrid1.Width/7)*4+40))/4)+30;
end;

procedure TForm6.FormResize(Sender: TObject);
begin
     DBGrid1.Width:=Form6.Width-32;
     DBGrid1.Height:=Form6.Height-87;
     DBGrid1.Columns[0].Width:=40;
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width/7)-5;
     DBGrid1.Columns[2].Width:=Round(DBGrid1.Width/7)-5;
     DBGrid1.Columns[3].Width:=Round(DBGrid1.Width/7)-5;
     DBGrid1.Columns[4].Width:=Round((DBGrid1.Width-(Round(DBGrid1.Width/7)*4+40))/4)+30;
     DBGrid1.Columns[5].Width:=Round((DBGrid1.Width-(Round(DBGrid1.Width/7)*4+40))/4)+20;
     DBGrid1.Columns[6].Width:=Round((DBGrid1.Width-(Round(DBGrid1.Width/7)*4+40))/4)+20;
     DBGrid1.Columns[7].Width:=Round((DBGrid1.Width-(Round(DBGrid1.Width/7)*4+40))/4)+30;
end;

procedure TForm6.ToolButton1Click(Sender: TObject);
begin
     if(ADOQuery1.RecordCount=0)then exit;
     if(selectRowId=-1)then
     Begin
          While(not(ADOQuery1.Eof))do
          Begin
               selectRowId:=ADOQuery1.FieldByName('ID').AsInteger;
               break;
          End;
     End;
     if(selectRowId=-1)then exit;
     ADOQuery2.Close;
     ADOQuery2.Sql.Clear;
     ADOQuery2.SQL.Add('DELETE FROM PolicyTable WHERE(ID='+IntToStr(selectRowId)+')');
     AdoQuery2.ExecSQL;
     RefreshData;
end;

procedure TForm6.ToolButton2Click(Sender: TObject);
var formEdit:tForm;
begin
     if(ADOQuery1.RecordCount=0)then exit;
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
          addEditPolicyForm.idPolicy:=selectRowId;
          Application.CreateForm(TForm11, Form11);
          formEdit:=addEditPolicyForm.Form11;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;
end;

procedure TForm6.ToolButton3Click(Sender: TObject);
var formEdit:tForm;
begin
     if(not(editFormOpen))then
     Begin
          Application.CreateForm(TForm11, Form11);
          formEdit:=addEditPolicyForm.Form11;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;
end;

end.

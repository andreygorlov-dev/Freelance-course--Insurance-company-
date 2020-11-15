unit clientForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin,addEditClientForm;

type
  TForm4 = class(TForm)
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
    procedure DBGrid1CellClick(Column: TColumn);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  editFormOpen:boolean;
  selectRowId:integer=-1;

procedure RefreshData();

implementation

uses mainForm,policyForm;

{$R *.dfm}

procedure RefreshData();
Begin
     Form4.ADOQuery1.Close;
     Form4.ADOQuery1.Open;
End;

procedure TForm4.DBGrid1CellClick(Column: TColumn);
begin
     if(ADOQuery1.RecordCount=0)then exit;
     selectRowId:=DBGrid1.DataSource.DataSet.FieldByName('Id').value;
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     mainForm.clientFormOpen:=false;
     Form4.Free;
     Form4:=nil;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
     editFormOpen:=false;
     DBGrid1.Columns[0].Width:=60;
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width)-120;
end;

procedure TForm4.FormResize(Sender: TObject);
begin
     DBGrid1.Width:=Form4.Width-32;
     DBGrid1.Height:=Form4.Height-87;
     DBGrid1.Columns[0].Width:=60;
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width)-120;
end;

procedure TForm4.ToolButton1Click(Sender: TObject);
var formEdit:tForm;
begin
     if(not(editFormOpen))then
     Begin
          Application.CreateForm(TForm9, Form9);
          formEdit:=addEditClientForm.Form9;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;
end;

procedure TForm4.ToolButton2Click(Sender: TObject);
begin
     if(ADOQuery1.RecordCount=0)then exit;
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
     ADOQuery2.SQL.Add('DELETE FROM CLIENTTABLE WHERE(ID='+IntToStr(selectRowId)+')');
     AdoQuery2.ExecSQL;
     RefreshData;
     selectRowId:=-1;
     if (Assigned(policyForm.Form6))then policyForm.RefreshData;
end;

procedure TForm4.ToolButton3Click(Sender: TObject);
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
          addEditClientForm.idClient:=selectRowId;
          Application.CreateForm(TForm9, Form9);
          formEdit:=addEditClientForm.Form9;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;
end;

end.

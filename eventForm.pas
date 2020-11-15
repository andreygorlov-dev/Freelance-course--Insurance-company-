unit eventForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.ComCtrls, Vcl.ToolWin,addEditEventForm;

type
  TForm5 = class(TForm)
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
    procedure DBGrid1CellClick(Column: TColumn);
    procedure FormResize(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
    procedure ToolButton2Click(Sender: TObject);
    procedure ToolButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  editFormOpen:boolean;
  selectRowId:integer=-1;

procedure RefreshData;

implementation

uses mainForm;

{$R *.dfm}

procedure RefreshData();
Begin
     Form5.ADOQuery1.Close;
     Form5.ADOQuery1.Open;
End;

procedure TForm5.DBGrid1CellClick(Column: TColumn);
begin
     selectRowId:=DBGrid1.DataSource.DataSet.FieldByName('Id').value;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     mainForm.eventFormOpen:=false;
     Form5.Free;
     Form5:=nil;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
     editFormOpen:=false;
     DBGrid1.Columns[0].Width:=60;
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width)-120;
end;

procedure TForm5.FormResize(Sender: TObject);
begin
     DBGrid1.Width:=Form5.Width-32;
     DBGrid1.Height:=Form5.Height-87;
     DBGrid1.Columns[0].Width:=60;
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width)-120;
end;

procedure TForm5.ToolButton1Click(Sender: TObject);
var formEdit:tForm;
begin
     if(not(editFormOpen))then
     Begin
          Application.CreateForm(TForm10, Form10);
          formEdit:=addEditEventForm.Form10;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;
end;

procedure TForm5.ToolButton2Click(Sender: TObject);
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
     ADOQuery2.SQL.Add('DELETE FROM EVENTTABLE WHERE(ID='+IntToStr(selectRowId)+')');
     AdoQuery2.ExecSQL;
     RefreshData;
end;

procedure TForm5.ToolButton3Click(Sender: TObject);
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
          addEditEventForm.idEvent:=selectRowId;
          Application.CreateForm(TForm10, Form10);
          formEdit:=addEditEventForm.Form10;
          formEdit.Visible:=true;
          editFormOpen:=true;
     End;
end;

end.

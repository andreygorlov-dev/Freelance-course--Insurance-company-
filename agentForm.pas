unit agentForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ToolWin,addEditAgentForm;

type
  TForm2 = class(TForm)
    DBGrid1: TDBGrid;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    Edit1: TEdit;
    ToolButton5: TToolButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure ToolButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  editFormOpen:boolean;

implementation

uses mainForm;

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     mainForm.agentFormOpen:=false;
     Form2.Free;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
    editFormOpen:=false;
    DBGrid1.Columns[0].Width:=Round(DBGrid1.Width/3);
    DBGrid1.Columns[1].Width:=Round(DBGrid1.Width/3);
    DBGrid1.Columns[2].Width:=Round(DBGrid1.Width/3/2)-15;
    DBGrid1.Columns[3].Width:=Round(DBGrid1.Width/3/2)-15;
end;

procedure TForm2.FormResize(Sender: TObject);
begin
     DBGrid1.Width:=Form2.Width-32;
     DBGrid1.Height:=Form2.Height-87;
     DBGrid1.Columns[0].Width:=Round(DBGrid1.Width/3);
     DBGrid1.Columns[1].Width:=Round(DBGrid1.Width/3);
     DBGrid1.Columns[2].Width:=Round(DBGrid1.Width/3/2)-15;
     DBGrid1.Columns[3].Width:=Round(DBGrid1.Width/3/2)-15;
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

end.

unit addEditAgentForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls;

type
  TForm7 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  idDepartment:integer=-1;

implementation

uses mainForm, agentForm;

{$R *.dfm}

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     agentForm.editFormOpen:=false;
     Form7.Free;

end;

procedure TForm7.FormCreate(Sender: TObject);
var i:integer;
begin
     while (not(adoQuery1.Eof)) do
     Begin
          i:=adoQuery1.FieldByName('id').AsInteger;
          break;
     End;
     if(idDepartment>-1)then
     Begin
          DBLookupComboBox1.KeyValue:=idDepartment;
     End else
     Begin
          DBLookupComboBox1.KeyValue:=i;
     End;

end;

end.

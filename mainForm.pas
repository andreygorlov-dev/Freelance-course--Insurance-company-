unit mainForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,agentForm,departmentForm,clientForm,eventForm,policyForm;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N2: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  agentFormOpen:boolean;
  departmentFormOpen:boolean;
  clientFormOpen:boolean;
  eventFormOpen:boolean;
  polycyFormOpen:boolean;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
     agentFormOpen:=false;
     departmentFormOpen:=false;
     clientFormOpen:=false;
     eventFormOpen:=false;
     polycyFormOpen:=false;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
     Cascade;
end;

procedure TForm1.N3Click(Sender: TObject);
var formAgent:tForm;
begin
     if(not(agentFormOpen))then
     Begin
          Application.CreateForm(TForm2, Form2);
          formAgent:=agentForm.Form2;
          formAgent.Visible:=true;
          agentFormOpen:=true;
     End;
end;

procedure TForm1.N4Click(Sender: TObject);
var formDepartment:tForm;
begin
     if(not(departmentFormOpen))then
     Begin
          Application.CreateForm(TForm3, Form3);
          formDepartment:=departmentForm.Form3;
          formDepartment.Visible:=true;
          departmentFormOpen:=true;
     End;
end;

procedure TForm1.N5Click(Sender: TObject);
var formClient:tForm;
begin
     if(not(clientFormOpen))then
     Begin
          Application.CreateForm(TForm4, Form4);
          formClient:=clientForm.Form4;
          formClient.Visible:=true;
          clientFormOpen:=true;
     End;
end;

procedure TForm1.N6Click(Sender: TObject);
var formEvent:tForm;
begin
     if(not(eventFormOpen))then
     Begin
          Application.CreateForm(TForm5, Form5);
          formEvent:=eventForm.Form5;
          formEvent.Visible:=true;
          eventFormOpen:=true;
     End;

end;

procedure TForm1.N7Click(Sender: TObject);
var formPolicy:tForm;
begin
     if(not(polycyFormOpen))then
     Begin
          Application.CreateForm(TForm6, Form6);
          formPolicy:=policyForm.Form6;
          formPolicy.Visible:=true;
          polycyFormOpen:=true;
     End;

end;

procedure TForm1.N9Click(Sender: TObject);
var i:integer;
begin
     for i:= MDIChildCount-1 downto 0 do
     Begin
          MDIChildren[i].close;
     End;
end;

end.

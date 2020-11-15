program Project1;

uses
  Vcl.Forms,
  mainForm in 'mainForm.pas' {Form1},
  agentForm in 'agentForm.pas' {Form2},
  departmentForm in 'departmentForm.pas' {Form3},
  clientForm in 'clientForm.pas' {Form4},
  eventForm in 'eventForm.pas' {Form5},
  policyForm in 'policyForm.pas' {Form6},
  addEditAgentForm in 'addEditAgentForm.pas' {Form7},
  addEditDepartmentForm in 'addEditDepartmentForm.pas' {Form8},
  addEditClientForm in 'addEditClientForm.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

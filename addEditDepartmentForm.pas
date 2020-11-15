unit addEditDepartmentForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TForm8 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    BitBtn2: TBitBtn;
    BitBtn1: TBitBtn;
    ADOQuery3: TADOQuery;
    ADOQuery2: TADOQuery;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  idDepartment:integer=-1;

implementation

uses mainForm, departmentForm,agentForm;

{$R *.dfm}

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
     if(Trim(Edit1.Text)<>'')then
     Begin
         if(Trim(Edit2.Text)<>'')then
         Begin
              AdoQuery2.Close;
              ADOQuery2.SQL.Clear;
              try
                if(idDepartment>-1)then
                Begin
                     ADOQuery2.Sql.Add('Update DEPARTMENTTABLE set NAMEDEPARTMENT='''+Edit1.Text+''',LEADER='''+Edit2.Text+''' where(ID='+IntToStr(idDepartment)+')');
                End else
                Begin
                     ADOQuery2.Sql.Add('INSERT INTO DEPARTMENTTABLE (NAMEDEPARTMENT, LEADER) VALUES('''+Edit1.Text+''','''+Edit2.Text+''')');
                End;
                AdoQuery2.ExecSQL;
                if (Assigned(departmentForm.Form3))then departmentForm.RefreshData;
                if (Assigned(agentForm.Form2))then agentForm.RefreshData;
              except
                    MessageDlg('Поля заполнены не корректно!!!!',mtError,[mbOK],0);
                    exit;
              end;
         End else
         Begin
              MessageDlg('ФИО руководителя не указано',mtError,[mbOK],0);
         End;
    End else
    Begin
         MessageDlg('Название отдела не указано',mtError,[mbOK],0);
    End;
end;

procedure TForm8.BitBtn2Click(Sender: TObject);
begin
     departmentForm.editFormOpen:=false;
     Edit1.Text:='';
     Edit2.Text:='';
     idDepartment:=-1;
     Form8.Free;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     departmentForm.editFormOpen:=false;
     Edit1.Text:='';
     Edit2.Text:='';
     idDepartment:=-1;
     Form8.Free;
end;

procedure TForm8.FormCreate(Sender: TObject);
var f:boolean;
begin
     f:=true;
     if(idDepartment>-1)then
     Begin
          BitBtn1.Caption:='Изменить';
          AdoQuery3.Close;
          ADOQuery3.SQL.Clear;
          ADOQuery3.SQL.Add('SELECT * FROM DEPARTMENTTABLE WHERE(ID='+IntToStr(idDepartment)+')');
          ADOQuery3.Open;
          While(not(ADOQuery3.Eof))do
          Begin
               Edit1.Text:=AdoQuery3.FieldByName('NAMEDEPARTMENT').AsString;
               Edit2.Text:=AdoQuery3.FieldByName('LEADER').AsString;
               ADOQuery3.Next;
               f:=false;
          End;
          if(f)then
          begin
               MessageDlg('Ваши данные устарели такого отдела больше нет!!!',mtError,[mbOK],0);
               idDepartment:=-1;
               BitBtn1.Caption:='Добавить отдел';
          end;
     End else
     Begin
          BitBtn1.Caption:='Добавить отдел';
     End;
end;

end.

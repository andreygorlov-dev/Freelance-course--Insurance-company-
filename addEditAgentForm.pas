unit addEditAgentForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.DBCtrls, Vcl.Buttons;

type
  TForm7 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOQuery2: TADOQuery;
    ADOQuery3: TADOQuery;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  idAgent:integer=-1;

implementation

uses mainForm, agentForm;

{$R *.dfm}

procedure TForm7.BitBtn1Click(Sender: TObject);
var Salary,Pay:String;
begin
    if(Trim(Edit1.Text)<>'')then
    Begin
         if(Trim(Edit2.Text)<>'')then
         Begin
              if(Trim(Edit3.Text)<>'')then
              Begin
                   AdoQuery2.Close;
                   ADOQuery2.SQL.Clear;
                   try
                      Salary:=StringReplace(Edit2.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
                      Pay:=StringReplace(Edit3.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
                      if(Pos('.',Salary)>0)then Salary:=Copy(Salary,0,Pos('.',Salary)+2);
                      if(Pos('.',Pay)>0)then Pay:=Copy(Pay,0,Pos('.',Pay)+2);
                      if(idAgent>-1)then
                      Begin
                           ADOQuery2.Sql.Add('Update AgentTable set FIO='''+Edit1.Text+''',Department_ID='+
                                              IntToStr(DBLookupComboBox1.KeyValue)+',Salary='+Salary+',Pay='+Pay+' where(ID='+IntToStr(idAgent)+')');
                      End else
                      Begin
                           ADOQuery2.Sql.Add('Insert into AgentTable (FIO,Department_ID,Salary,Pay) values('''+Edit1.Text+''','+
                                              IntToStr(DBLookupComboBox1.KeyValue)+','+Salary+','+Pay+')');
                      End;
                   AdoQuery2.ExecSQL;
                   if (Assigned(agentForm.Form2))then agentForm.RefreshData;
                   except
                      MessageDlg('Поля заполнены не корректно!!!!',mtError,[mbOK],0);
                      exit;
                   end;
              End else
              Begin
                   MessageDlg('Зарплата агента не указана',mtError,[mbOK],0);
              End;
         End else
         Begin
              MessageDlg('Оклад агента не указан',mtError,[mbOK],0);
         End;
    End else
    Begin
         MessageDlg('ФИО агента не указано',mtError,[mbOK],0);
    End;
end;

procedure TForm7.BitBtn2Click(Sender: TObject);
begin
     agentForm.editFormOpen:=false;
     Edit1.Text:='';
     Edit2.Text:='';
     Edit3.Text:='';
     idAgent:=-1;
     ADOQuery1.Close;
     Form7.Free;
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     agentForm.editFormOpen:=false;
     Edit1.Text:='';
     Edit2.Text:='';
     Edit3.Text:='';
     idAgent:=-1;
     ADOQuery1.Close;
     Form7.Free;
end;

procedure TForm7.FormCreate(Sender: TObject);
var i:integer;
    f:boolean;
begin
     ADOQuery1.Open;
     f:=true;
     while (not(adoQuery1.Eof)) do
     Begin
          i:=adoQuery1.FieldByName('id').AsInteger;
          break;
     End;
     if(idAgent>-1)then
     Begin
          BitBtn1.Caption:='Изменить';
          AdoQuery3.Close;
          ADOQuery3.SQL.Clear;
          ADOQuery3.SQL.Add('SELECT * FROM AGENTTABLE WHERE(ID='+IntToStr(idAgent)+')');
          ADOQuery3.Open;
          While(not(ADOQuery3.Eof))do
          Begin
               Edit1.Text:=AdoQuery3.FieldByName('FIO').AsString;
               DBLookupComboBox1.KeyValue:=AdoQuery3.FieldByName('Department_id').AsInteger;
               Edit2.Text:=AdoQuery3.FieldByName('Salary').AsString;
               Edit3.Text:=AdoQuery3.FieldByName('Pay').AsString;
               ADOQuery3.Next;
               f:=false;
          End;
          if(f)then
          begin
               MessageDlg('Ваши данные устарели такого агента больше нет!!!',mtError,[mbOK],0);
               idAgent:=-1;
               BitBtn1.Caption:='Добавить агента';
          end;
     End else
     Begin
          BitBtn1.Caption:='Добавить агента';
          DBLookupComboBox1.KeyValue:=i;
     End;
end;

end.

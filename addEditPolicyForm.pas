unit addEditPolicyForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Data.DB,
  Data.Win.ADODB, Vcl.ComCtrls, Vcl.Buttons;

type
  TForm11 = class(TForm)
    ADOQuery1: TADOQuery;
    DataSource1: TDataSource;
    DBLookupComboBox1: TDBLookupComboBox;
    Label2: TLabel;
    Label1: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    Label4: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label5: TLabel;
    Edit1: TEdit;
    Label6: TLabel;
    Edit2: TEdit;
    Label7: TLabel;
    Edit3: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    ADOQuery2: TADOQuery;
    DataSource2: TDataSource;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery4: TADOQuery;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;
  idPolicy:Integer=-1;


implementation

uses mainForm, policyForm;

{$R *.dfm}

procedure TForm11.BitBtn1Click(Sender: TObject);
var Contr,Salary,Pay:String;
begin
     if(Trim(Edit1.Text)<>'')then
    Begin
         if(Trim(Edit2.Text)<>'')then
         Begin
              if(Trim(Edit3.Text)<>'')then
              Begin
                   AdoQuery4.Close;
                   ADOQuery4.SQL.Clear;
                   try
                      Contr:=StringReplace(Edit1.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
                      Salary:=StringReplace(Edit2.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
                      Pay:=StringReplace(Edit3.Text,',','.',[rfReplaceAll, rfIgnoreCase]);
                      if(Pos('.',Contr)>0)then Contr:=Copy(Contr,0,Pos('.',Contr)+2);
                      if(Pos('.',Salary)>0)then Salary:=Copy(Salary,0,Pos('.',Salary)+2);
                      if(Pos('.',Pay)>0)then Pay:=Copy(Pay,0,Pos('.',Pay)+2);
                      if(idPolicy>-1)then
                      Begin
                           ADOQuery4.Sql.Add('Update PolicyTable set Agent_id='+IntToStr(DBLookupComboBox1.KeyValue)+
                                                                   ',client_ID='+IntToStr(DBLookupComboBox2.KeyValue)+
                                                                   ',Event_ID='+IntToStr(DBLookupComboBox3.KeyValue)+
                                                                   ',Valid_until='''+DateToStr(DateTimePicker1.Date)+''''+
                                                                   ',Contribution_Amount='+Contr+
                                                                   ',Payout_Amount='+Salary+
                                                                   ',Gonorar='+Pay+
                                                                   ' where(ID='+IntToStr(idPolicy)+')');
                      End else
                      Begin
                           ADOQuery4.Sql.Add('Insert into PolicyTable (Agent_id,client_ID,Event_ID,Valid_until,Contribution_Amount,Payout_Amount,Gonorar) values('+
                                              IntToStr(DBLookupComboBox1.KeyValue)+','+
                                              IntToStr(DBLookupComboBox2.KeyValue)+','+
                                              IntToStr(DBLookupComboBox3.KeyValue)+','''+
                                              DateToStr(DateTimePicker1.Date)+''','+
                                              Contr+','+
                                              Salary+','+
                                              Pay+')'
                           );
                      End;
                   AdoQuery4.ExecSQL;
                   if (Assigned(policyForm.Form6))then policyForm.RefreshData;
                   except
                      MessageDlg('Поля заполнены не корректно!!!!',mtError,[mbOK],0);
                      exit;
                   end;
              End else
              Begin
                   MessageDlg('Оплата за полис не указана',mtError,[mbOK],0);
              End;
         End else
         Begin
              MessageDlg('Сумма выплат не указана',mtError,[mbOK],0);
         End;
    End else
    Begin
         MessageDlg('Сумма взносов не указана',mtError,[mbOK],0);
    End;
end;

procedure TForm11.BitBtn2Click(Sender: TObject);
begin
     policyForm.editFormOpen:=false;
     Edit1.Text:='';
     Edit2.Text:='';
     Edit3.Text:='';
     idPolicy:=-1;
     ADOQuery1.Close;
     Form11.Free;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     policyForm.editFormOpen:=false;
     Edit1.Text:='';
     Edit2.Text:='';
     Edit3.Text:='';
     idPolicy:=-1;
     ADOQuery1.Close;
     Form11.Free;
end;

procedure TForm11.FormCreate(Sender: TObject);
var idAg,idCl,idEv:integer;
    f:boolean;
begin
     f:=true;
     ADOQuery1.Open;
     while (not(adoQuery1.Eof)) do
     Begin
          idAg:=adoQuery1.FieldByName('id').AsInteger;
          break;
     End;
     ADOQuery2.Open;
     while (not(adoQuery2.Eof)) do
     Begin
          idCl:=adoQuery2.FieldByName('id').AsInteger;
          break;
     End;
     ADOQuery3.Open;
     while (not(adoQuery3.Eof)) do
     Begin
          idEv:=adoQuery3.FieldByName('id').AsInteger;
          break;
     End;
     if(idPolicy>-1)then
     Begin
          BitBtn1.Caption:='Изменить';
          AdoQuery4.Close;
          ADOQuery4.SQL.Clear;
          ADOQuery4.SQL.Add('SELECT * FROM POLICYTABLE WHERE(ID='+IntToStr(idPolicy)+')');
          ADOQuery4.Open;
          While(not(ADOQuery4.Eof))do
          Begin
               DBLookupComboBox1.KeyValue:=AdoQuery4.FieldByName('AGENT_id').AsInteger;
               DBLookupComboBox2.KeyValue:=AdoQuery4.FieldByName('Client_id').AsInteger;
               DBLookupComboBox3.KeyValue:=AdoQuery4.FieldByName('Event_id').AsInteger;
               DateTimePicker1.Date:=AdoQuery4.FieldByName('Valid_Until').AsDateTime;
               Edit1.Text:=AdoQuery4.FieldByName('Contribution_Amount').AsString;
               Edit2.Text:=AdoQuery4.FieldByName('Payout_Amount').AsString;
               Edit3.Text:=AdoQuery4.FieldByName('Gonorar').AsString;
               ADOQuery4.Next;
               f:=false;
          End;
          if(f)then
          begin
               MessageDlg('Ваши данные устарели такого полиса больше нет!!!',mtError,[mbOK],0);
               idPolicy:=-1;
               DBLookupComboBox1.KeyValue:=idAg;
               DBLookupComboBox2.KeyValue:=idCl;
               DBLookupComboBox3.KeyValue:=idEv;
               BitBtn1.Caption:='Добавить полис';
          end;
     End else
     Begin
          BitBtn1.Caption:='Добавить полис';
          DBLookupComboBox1.KeyValue:=idAg;
          DBLookupComboBox2.KeyValue:=idCl;
          DBLookupComboBox3.KeyValue:=idEv;
     End;
end;

end.

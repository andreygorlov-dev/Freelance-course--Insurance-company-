unit addEditClientForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Data.DB,
  Data.Win.ADODB;

type
  TForm9 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    ADOQuery3: TADOQuery;
    ADOQuery2: TADOQuery;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  idClient:Integer=-1;

implementation

uses mainForm, clientForm;

{$R *.dfm}

procedure TForm9.BitBtn1Click(Sender: TObject);
begin
     if(Trim(Edit1.Text)<>'')then
     Begin
          AdoQuery2.Close;
          ADOQuery2.SQL.Clear;
          try
                if(idClient>-1)then
                Begin
                     ADOQuery2.Sql.Add('Update ClientTable set FIO='''+Edit1.Text+''' where(ID='+IntToStr(idClient)+')');
                End else
                Begin
                     ADOQuery2.Sql.Add('INSERT INTO ClientTable (FIO) VALUES('''+Edit1.Text+''')');
                End;
                AdoQuery2.ExecSQL;
                if (Assigned(clientForm.Form4))then clientForm.RefreshData;
              except
                    MessageDlg('Поля заполнены не корректно!!!!',mtError,[mbOK],0);
                    exit;
              end;
     End else
     Begin
          MessageDlg('ФИО клиента не указано',mtError,[mbOK],0);
     End;
end;

procedure TForm9.BitBtn2Click(Sender: TObject);
begin
     clientForm.editFormOpen:=false;
     Edit1.Text:='';
     idClient:=-1;
     Form9.Free;
end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     clientForm.editFormOpen:=false;
     Edit1.Text:='';
     idClient:=-1;
     Form9.Free;
end;

procedure TForm9.FormCreate(Sender: TObject);
var f:boolean;
begin
     f:=true;
     if(idClient>-1)then
     Begin
          BitBtn1.Caption:='Изменить';
          AdoQuery3.Close;
          ADOQuery3.SQL.Clear;
          ADOQuery3.SQL.Add('SELECT * FROM ClientTABLE WHERE(ID='+IntToStr(idClient)+')');
          ADOQuery3.Open;
          While(not(ADOQuery3.Eof))do
          Begin
               Edit1.Text:=AdoQuery3.FieldByName('FIO').AsString;
               ADOQuery3.Next;
               f:=false;
          End;
          if(f)then
          begin
               MessageDlg('Ваши данные устарели такого клиента больше нет!!!',mtError,[mbOK],0);
               idClient:=-1;
               BitBtn1.Caption:='Добавить клиента';
          end;
     End else
     Begin
          BitBtn1.Caption:='Добавить клиента';
     End;
end;

end.

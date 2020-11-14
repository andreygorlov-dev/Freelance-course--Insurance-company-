unit policyForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Data.Win.ADODB, Vcl.ToolWin, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ComCtrls,
  Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    DBGrid1: TDBGrid;
    ToolBar1: TToolBar;
    ToolButton1: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    Edit1: TEdit;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses mainForm;

{$R *.dfm}

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     mainForm.polycyFormOpen:=false;
     Form6.Free;
end;

end.

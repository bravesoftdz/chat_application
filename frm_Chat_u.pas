unit frm_Chat_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, IdHTTP, XMLDoc, XMLIntf, ActiveX, StdCtrls, ComCtrls;

type
  TRefresh = class(TThread)
  private
    procedure RefreshData();
  protected
    procedure Execute; override;
  end;
  TForm1 = class(TForm)
    edtMessage: TEdit;
    btnSend: TButton;
    btnClear: TButton;
    edtName: TEdit;
    btnName: TButton;
    redChatBox: TRichEdit;
    lblNE: TLabel;
    btnNewChat: TButton;
    btnExistingChat: TButton;
    lblEnterName: TLabel;
    edtChatID: TEdit;
    btnChatID: TButton;
    edtChatIDDisplay: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure btnClearClick(Sender: TObject);
    procedure btnNameClick(Sender: TObject);
    procedure btnNewChatClick(Sender: TObject);
    procedure btnExistingChatClick(Sender: TObject);
    procedure btnChatIDClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Refresh : TRefresh;
  end;

const
  ServerAddress = 'http://home.kosie.me/Development/Chat/chat.php';


var
  Form1: TForm1;
  CoResult : Integer;
  HTTP: TIdHTTP;
  Doc: IXMLDocument;
  Node: IXMLNode;
  sName, sMessage, sBuffer, sBufferR, sQueryR, sQuery, sActions, sUserName, sChatID : String;
  bIsConnected : Boolean;


implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  CoResult := CoInitializeEx(nil, COINIT_MULTITHREADED);
  HTTP := TIdHTTP.Create(HTTP);
  redChatBox.Text := 'Welcome to the chat! Type a message and press send to continue!';
  sChatID := 'none';
  Refresh := TRefresh.Create(false);
  Refresh.FreeOnTerminate := true;
end;

procedure TRefresh.RefreshData();
begin
  if (bIsConnected) then
  begin
    sQueryR := ServerAddress + '?new=false&clean=false&add=false&create=false&chatid=' + sChatID;
    sBufferR := HTTP.Get(sQueryR);
    Form1.redChatBox.Text := sBufferR;
  end;
end;

procedure TRefresh.Execute();
begin
  repeat
    Sleep(10);
    Synchronize(RefreshData);
  until Terminated;
end;

procedure TForm1.btnSendClick(Sender: TObject);
begin
  sMessage := StringReplace(edtMessage.Text, ' ', '--nbsp--', [rfReplaceAll, rfIgnoreCase]);
  sMessage := StringReplace(sMessage, '&', '--amp--', [rfReplaceAll, rfIgnoreCase]);
  sMessage := StringReplace(sMessage, '=', '--equalsi--', [rfReplaceAll, rfIgnoreCase]);
  sMessage := StringReplace(sMessage, '?', '--questsi--', [rfReplaceAll, rfIgnoreCase]);
  sQuery := ServerAddress + '?create=false&new=false&clean=false&add=true&chatid=' + sChatID + '&text=' + sMessage + '&name=' + sUserName;
  sBuffer := HTTP.Get(sQuery);
  redChatBox.Text := sBuffer;
  edtMessage.Text := '';
end;

procedure TForm1.btnClearClick(Sender: TObject);
begin
  sQuery := ServerAddress + '?new=false&clean=true&add=false&create=false&chatid=' + sChatID;
  sBuffer := HTTP.Get(sQuery);
  redChatBox.Text := sBuffer;
end;

procedure TForm1.btnNameClick(Sender: TObject);
begin
  sUserName := edtName.Text;
  btnName.Visible := False;
  lblEnterName.Visible := False;
  edtName.Visible := False;
  btnExistingChat.Visible := True;
  btnNewChat.Visible := True;
  lblNE.Visible := True;
end;

procedure TForm1.btnNewChatClick(Sender: TObject);
begin
  sQuery := ServerAddress + '?new=false&clean=false&add=false&create=true&chatid=none';
  sBuffer := HTTP.Get(sQuery);
  sChatID := sBuffer;
  edtChatIDDisplay.Text := 'Your chat ID is: ' + sChatID;
  btnExistingChat.Visible := False;
  btnNewChat.Visible := False;
  lblNE.Visible := False;
  edtMessage.Visible := True;
  redChatBox.Visible := True;
  btnSend.Visible := True;
  btnClear.Visible := True;
  edtChatIDDisplay.Visible := True;
  bIsConnected := True;
end;

procedure TForm1.btnExistingChatClick(Sender: TObject);
begin
  btnExistingChat.Visible := False;
  btnNewChat.Visible := False;
  lblNE.Visible := False;
  btnChatID.Visible := True;
  edtChatID.Visible := True;
end;

procedure TForm1.btnChatIDClick(Sender: TObject);
begin
  sChatID := edtChatID.Text;
  edtChatIDDisplay.Text := 'Your chat ID is: ' + sChatID;
  btnChatID.Visible := False;
  edtChatID.Visible := False;
  edtMessage.Visible := True;
  redChatBox.Visible := True;
  btnSend.Visible := True;
  btnClear.Visible := True;
  edtChatIDDisplay.Visible := True;
  bIsConnected := True;
end;

end.


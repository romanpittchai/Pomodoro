unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Menus,
  ExtCtrls, MaskEdit;

type

  { TSettings }

  TSettings = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Settings: TSettings;
  pomodoro_form2: Integer; // Кол-во томатов.
  duration_form2: Integer; // Длина томатов.
  rest_length_form2: Integer; // Длина отдыха.
  input : String;
  value: Integer;

implementation

{$R *.lfm}

{ TSettings }

procedure Message;
begin
  MessageDlg('Invalid value ' + '"' + input + '"' + '!', mtError, [mbOK], 0);
  Exit;
end;

procedure TSettings.FormCreate(Sender: TObject);
// Для создания формы. To create a form.

begin
  //Timer1.Enabled := False;

  Edit1.Text := IntToStr(4);
  Edit2.Text := IntToStr(25);
  Edit3.Text := IntToStr(5);
end;

procedure TSettings.Button1Click(Sender: TObject);
// Кнопка для сохранения настроек.
// A button to save settings.

begin
  begin
    input := Edit2.Text;
    if not TryStrToInt(input, value) then
      begin
        Message();
      end;
    duration_form2 := value;
  end;
  begin
    input := Edit1.Text;
    if not TryStrToInt(input, value) then
      begin
        Message();
      end;
    pomodoro_form2 := value;
  end;
  begin
    input := Edit3.Text;
    if not TryStrToInt(input, value) then
      begin
        Message();
      end;
    rest_length_form2 := value;
  end;
  Close;
end;

end.


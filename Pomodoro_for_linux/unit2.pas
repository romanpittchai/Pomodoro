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

implementation

{$R *.lfm}

{ TSettings }

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
  duration_form2 := StrToInt(Edit2.Text);
  pomodoro_form2 := StrToInt(Edit1.Text);
  rest_length_form2 :=  StrToInt(Edit3.Text);
  Close;
end;

end.


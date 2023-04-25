unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls, process;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Timer1StartTimer(Sender: TObject);
    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    duration: Integer;
    bol: Boolean;
    pomidoro: Integer;
  public

  end;

var
  Form1: TForm1;
  Button2Clicked: Boolean;
  Process1: TProcess;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Timer1StartTimer(Sender: TObject);
// Старт таймера. Timer start.

begin
  if bol = True then
    begin
      Label2.Caption := 'Run';
      duration := 25 * 60; // Работа 25 минут
      bol := False;
    end
  else
    begin
      Label2.Caption := 'Sleep';
      duration := 5 * 60; // Отдых 5 минут
      pomidoro := pomidoro + 1;
      Label3.Caption := IntToStr(pomidoro) + ' pomodoro';
      bol := True;
      Process1 := TProcess.Create(nil);
      Process1.Executable := 'afplay';
      Process1.Parameters.Add('sound/signal.mp3');
      Process1.Execute;
      Process1.Free;
    end;
end;

procedure TForm1.Timer1StopTimer(Sender: TObject);
// Стоп таймера. Stop Timer.

begin
  duration := 0;
  Label1.Caption := '00:00:00';
  Label2.Caption := 'Sleep';
  if Button2Clicked = True then
    begin
      bol := True;
      Button2Clicked := False;
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
// Таймер на 25 минут. Timer for 25 minutes.

begin
  Label1.Caption := FormatDateTime('hh:nn:ss', duration / SecsPerDay);

  if pomidoro = 4 then
    begin
        Timer1.Enabled := False;
        bol := True;
    end;

  duration := duration - 1;

  if duration < -1 then
    begin
        Timer1.Enabled := False;
        Label1.Caption := '00:00:00';
        Timer1.Enabled := True;
    end;
end;

procedure TForm1.Edit1Change(Sender: TObject);
// Поле, которое заполняется таймером.
// The field that is filled in by the timer.

begin

end;

procedure TForm1.Button1Click(Sender: TObject);
// Кнопка для старта таймера.
// The button for the start timer.

begin
  Timer1.Enabled := True;
  pomidoro := 0;
  Label3.Caption := IntToStr(pomidoro) + ' pomodoro';
end;

procedure TForm1.Button2Click(Sender: TObject);
// Кнопка для остановки таймера.
// A button to stop the timer.

begin
  Button2Clicked := True;
  pomidoro := 0;
  Label3.Caption := IntToStr(pomidoro) + ' pomodoro';
  Timer1.Enabled := False;
end;

procedure TForm1.FormCreate(Sender: TObject);
// Для создания формы. To create a form.

begin
  Label1.Left := (Form1.Width - Label1.Width) div 2;
  Label3.Left := (Form1.Width - Label3.Width) div 2;
  Label1.Top := (Form1.Height - Label1.Height) div 2;
  Label1.Caption := '00:00:00';
  Label2.Caption := 'Sleep';
  pomidoro := 0;
  Label3.Caption := IntToStr(pomidoro) + ' pomodoro';
  bol := True;
  Button2Clicked := False;
end;

procedure TForm1.Label2Click(Sender: TObject);
// Поле для служебной информации.
// Field for service information.

begin

end;

procedure TForm1.Label3Click(Sender: TObject);
// Для временных отметок помидорок. For timestamps.

begin

end;

end.


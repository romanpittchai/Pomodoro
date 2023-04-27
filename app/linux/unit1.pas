unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  process, Unit2;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Timer1: TTimer;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1StartTimer(Sender: TObject);
    procedure Timer1StopTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  Form2: TSettings;
  Button2Clicked: Boolean;
  Process1: TProcess;
  pomodoro_num: Integer; // Кол-во томатов.
  duration_min: Integer; // Длина томатов.
  rest_length: Integer;  // Длина отдыха.
  duration: Integer;
  bol: Boolean;
  pomidoro: Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure PlaySound;
  begin
    Process1 := TProcess.Create(nil);
    Process1.Executable := 'cvlc';
    Process1.Parameters.Add('sound/signal.mp3');
    Process1.Execute;
    Process1.Free;
  end;

procedure TForm1.Timer1StartTimer(Sender: TObject);
// Старт таймера. Timer start.

begin
  if bol = True then
    begin
      Label2.Caption := 'Run';
      // Работа "duration_min" минут. Work "duration_min" minutes.
      duration := duration_min * 60;
      bol := False;
      if Button3.Enabled = False then
        begin
          PlaySound();
        end;
    end
  else
    begin
      Label2.Caption := 'Sleep';
      // Отдых "rest_length" минут. Rest "rest_length" minutes.
      duration := rest_length * 60;
      pomidoro := pomidoro + 1;
      Label3.Caption := IntToStr(pomidoro) + ' pomodoro';
      bol := True;
      PlaySound();
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
      Button3.Enabled := True;
    end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
// Таймер на 25 минут. Timer for 25 minutes.

begin
  Label1.Caption := FormatDateTime('hh:nn:ss', duration / SecsPerDay);

  if pomidoro = pomodoro_num then
    begin
        Timer1.Enabled := False;
        Button3.Enabled := True;
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

procedure TForm1.Button1Click(Sender: TObject);
// Кнопка для старта таймера.
// The button for the start timer.

begin
  Timer1.Enabled := True;
  pomidoro := 0;
  Label3.Caption := IntToStr(pomidoro) + ' pomodoro';
  Button3.Enabled := False;
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

procedure TForm1.Button3Click(Sender: TObject);
begin
  // Создаём новый экземпляр формы.
  // Creating a new instance of the form.

  Form2 := TSettings.Create(Self);

  // Открываем форму в модальном режиме.
  // Opening the form in modal mode.
  Form2.ShowModal;

  // Освобождаем экземляр формы.
  // Free form.
  Form2.Free;

  if (pomodoro_form2 > 0) and (duration_form2 > 0) and
     (rest_length_form2 > 0) then
    begin
      pomodoro_num := pomodoro_form2;
      duration_min := duration_form2;
      rest_length := rest_length_form2;
    end;
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
  duration_min := 25;
  pomodoro_num := 4;
  rest_length := 5;
  Label3.Caption := IntToStr(pomidoro) + ' pomodoro';
  bol := True;
  Button2Clicked := False;
  Button3.Enabled := True;
end;

end.

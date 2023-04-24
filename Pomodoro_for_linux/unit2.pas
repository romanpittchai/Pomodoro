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
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Edit4Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Settings: TSettings;

implementation

{$R *.lfm}

{ TSettings }

procedure TSettings.FormCreate(Sender: TObject);
begin

end;

procedure TSettings.Edit4Change(Sender: TObject);
begin

end;

procedure TSettings.Label1Click(Sender: TObject);
begin

end;

end.


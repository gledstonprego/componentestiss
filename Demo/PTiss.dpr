program PTiss;

uses
  Forms,
  tiss in 'tiss.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

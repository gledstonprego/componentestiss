  {COMPONENTE INICIADO POR Fabiano
  Espero ter ajudado alguem com este componente, e
  espero que mais progrmadores se juntem nesta id�ia
  para assim realizarmo o projeto TISS com sucesso,
  pela gra�a de Maria e o amor de Nosso Senhor JESUS CRISTO}
unit tiss;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TissSP_SADT, TissConsulta, ComCtrls, TissInternacao;

type
  TForm1 = class(TForm)
    Button1: TButton;
    TissC: TTissConsulta;
    Button2: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    TissSP: TTissSP_SADT;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    RichEdit1: TRichEdit;
    RichEdit2: TRichEdit;
    lblVersao: TLabel;
    TissInt: TTissInternacao;
    TabSheet3: TTabSheet;
    Memo2: TMemo;
    Button3: TButton;
    TabSheet4: TTabSheet;
    Memo3: TMemo;
    TabSheet5: TTabSheet;
    Memo4: TMemo;
    ckvalidar: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses untTissComp;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  //Habilitar ou n�o a valida��o
  if ckvalidar.Checked then
    TissC.TissValid.UsarValidacao := true
  else
    TissC.TissValid.UsarValidacao := false;

  {ATEN��O ESTE COMPONENTE EST� EM FASE DE TESTE, QUALQUER D�VIDA ENTRE
  EM CONTATO PELO EMAIL: fopprado@gmail.com 
  FALAR COM Fabiano}
  TissC.TissArquivo := 'CONSULTA.xml';
  TissC.TissEncoding := 'ISO-8859-1';
  TissC.TissMensagemTissXml := 'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.ans.gov.br/padroes/tiss/schemas"';
  TissC.TissVersaoXml := '1.0';


  //CABE�ALHO
  TissC.TissTipoTrans := 'ENVIO_LOTE_GUIAS';
  TissC.TissSequencialTrans := '1';
  TissC.TissDataRegistroTrans := Date;
  TissC.TissHoraRegistroTrans := Time;
  TissC.TissTipo := Juridico;
  TissC.TissCNPJCPF := '01614414000173';
  TissC.TissRegANS := '123';
  TissC.TissDataEmis := StrToDate ('26/10/2009');
  TissC.TissVersaoTISS := '2.02.01';
  TissC.TissNumLote := '1545';  
  //FIM CABE�ALHO
  TissC.criaCabecalho;  {COMANDO PARA ADICIONAR O CABE�ALHO}

  {ATEN��O A ORDEM TEM QUE SER DE ACORDO COM ESTE DEMO, PRIMEIRO
  USA-SE O M�TODO "CRIACABE�ALHO" DEPOIS ADICIONA-SE AS GUIAS
  PASSANDO OS VALORES E USANDO O M�TODO "ADICIONARGUIA" E POR
  �LTIMO A PROCEDURE "CRIARRODAPE" SE N�O FOR FEITO ASSIM VAI GERAR ERRO}

  //Adicionando guias
   for i:= 1 to 5 do
     begin
        //VERS�O 2.02.01
        TissC.TissFontePadora.TissRegAns := '123';
        TissC.TissFontePadora.TissCnpj := '01614414000173';
        //VERS�O 2.02.01
        TissC.TissRegANS := '0';
        TissC.TissNumGuia := IntToStr(I);
        TissC.TissNumCarteira := '548787';
        TissC.TissPaciente := 'PACIENTE TESTE';
        TissC.TissNomePlano := 'PLANO DE SAUDE '+IntToStr(I);
        TissC.TissValidadeCart := Date + 30;
        TissC.TissNumCNS := '45787';
        TissC.TissNomeContradado := 'CL�NICA';
        TissC.TisstipoLogradouro := '008';
        TissC.TissLogradouro := 'Av. dos Anjos';
        TissC.TissEndNum := '457';
        TissC.TissComplemento := 'Complemento';
        TissC.TisscodigoIBGE := 014;
        TissC.TissMunicipio := 'Itaperuna';
        TissC.TissUF := 'RJ';
        TissC.TissCEP := '28380000';
        TissC.TissCNES := 457;
        TissC.TissMEDICO := 'M�dico';
        TissC.TissSIGLACONSELHO := 'CRM';
        TissC.TissNUMEROCONSELHO := '02457';
        TissC.TissUFCONSELHO := 'RJ';
        TissC.TissCBOS := '2231.40';

        //hip�tese diagn�stica
        TissC.TissCIDNomeTab := 'CID-10';
        TissC.TissCodigoTabela := 1;
        TissC.TissCodProc := '00010014';
        TissC.TissCIDCodDiag := '';
        TissC.TissCIDDescDiag := '';
        TissC.TissTipDoenca := 'A'; //A,C
        TissC.TissEvolucaoValor := 10;
        TissC.TissUnidTemp := 'D';
        TissC.TissIndicAcid := '1';


        TissC.TissTipoConsulta := '1';
        TissC.TissTipoSaidaa := '5';

        //Se quiser colocar observa��o
        TissC.TissObs := 'OBSERVA��ES SOBRE A CONSULTA';


        TissC.adicionarGuia; //COMANDO PARA ADICIONAR A GUIA ATUAL
     end;
  TissC.criaRodape;
  if FileExists(TissC.TissArquivo) then
    begin
      RichEdit1.Lines.Clear;
      RichEdit1.Lines.LoadFromFile(TissC.TissArquivo);
      PageControl1.ActivePageIndex := 0;
    end;
end;
procedure TForm1.Button2Click(Sender: TObject);
var
  i,j,l: Integer;
begin

          {MUITA ATEN��O AQUI COMO ANS TRABALHA COM V�RGULA PARA SEPARAR AS CASAS
          DECIMAIS � NECESS�RIO COLOCAR A LINHA ABAIXO}
          DecimalSeparator := '.';
  //Habilitar ou n�o a valida��o
  if ckvalidar.Checked then
    TissSP.TissValid.UsarValidacao := true
  else
    TissSP.TissValid.UsarValidacao := false;

  {ATEN��O ESTE COMPONENTE EST� EM FASE DE TESTE, QUALQUER D�VIDA ENTRE
  EM CONTATO PELO EMAIL: fopprado@gmail.com
  FALAR COM FABIANO}
  TissSP.iniciaSPSADT; //M�todo de inicializa��o
  TissSP.Tisscabecalho.TissArquivo := 'SPSADT.xml';
  TissSP.Tisscabecalho.TissEncoding := 'ISO-8859-1';
  TissSP.Tisscabecalho.TissMensagemTissXml := 'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.ans.gov.br/padroes/tiss/schemas"';
  TissSP.Tisscabecalho.TissVersaoXml := '1.0';

  //CABE�ALHO
  TissSP.Tisscabecalho.TissTipoTrans := 'ENVIO_LOTE_GUIAS';//ENVIO_LOTE_GUIAS
  TissSP.Tisscabecalho.TissSequencialTrans := '2';
  TissSP.Tisscabecalho.TissDataRegistroTrans := Date;
  TissSP.Tisscabecalho.TissHoraRegistroTrans := Time;
  TissSP.Tisscabecalho.TissCNPJCPF := '02762719000195';
  TissSP.Tisscabecalho.TissRegANS := '0';
  TissSP.Tisscabecalho.TissVersaoTISS := '2.01.03';
  TissSP.Tisscabecalho.TissNumLote := '1545';
  //FIM CABE�ALHO
  TissSP.criaCabecalho;  {COMANDO PARA ADICIONAR O CABE�ALHO}

  {ATEN��O A ORDEM TEM QUE SER DE ACORDO COM ESTE DEMO, PRIMEIRO
  USA-SE O M�TODO "CRIACABE�ALHO" DEPOIS ADICIONA-SE AS GUIAS
  PASSANDO OS VALORES E USANDO O M�TODO "ADICIONARGUIA" E POR
  �LTIMO A PROCEDURE "CRIARRODAPE" SE N�O FOR FEITO ASSIM VAI GERAR ERRO}
  for i:= 1 to 1 {5} do
    begin
      //identifica��o guia SADTSP

        //VERS�O 2.02.01
        TissSP.TissFontePadora.TissRegAns := '123';
        TissSP.TissFontePadora.TissCnpj := '01614414000173';
        //VERS�O 2.02.01
      TissSP.TissNumGuiaPrest := IntToStr(i);
      TissSP.TissNumGuiaOper := IntToStr(i);
      TissSP.TissNumGuiaPrinc:= IntToStr(i);
      //TissSP.TissRegANS := '0';
      TissSP.TissDataEmis := StrToDate ('26/10/2009');

      //dados autoriza��o
      TissSP.TissDataAut := Date;
      TissSP.TissSenhaAut := '123456';
      TissSP.TissSenhaValid := Date + 30;

      //Dados Beneficiario
      TissSP.TissBeneficiario.TissNumCarteira := IntToStr(I);
      TissSP.TissBeneficiario.TissBenific := 'Paciente TESTE';
      TissSP.TissBeneficiario.TissNomePlano := 'PLANO DE SA�DE'+IntToStr(i);
      TissSP.TissBeneficiario.TissValidadeCart := Date + 30;
      TissSP.TissBeneficiario.TissNumCNS := '45787';

      //Dados Solicitante
      {TissSP.TissContratado.TissTipoGeral INFORME ESSA PROPRIEDADE NO
      OBJECT INSPECTOR por padr�o fica o tipo para Juridico}
      TissSP.TissContratado.TissCNPJCPF := '02762719000195';
      TissSP.TissContratado.TissNomeContradado := 'Fabiano';
      TissSP.TissContratado.TisstipoLogradouro := '008';
      TissSP.TissContratado.TissLogradouro := 'Av. dos Anjos';
      TissSP.TissContratado.TissEndNum := '457';
      TissSP.TissContratado.TissComplemento := 'Complemento';
      TissSP.TissContratado.TisscodigoIBGE := 014;
      TissSP.TissContratado.TissMunicipio := 'Itaperuna';
      TissSP.TissContratado.TissUF := 'RJ';
      TissSP.TissContratado.TissCEP := '28380000';
      TissSP.TissContratado.TissCNES := 457;

        //profissional
      TissSP.TissProfissional.TissProf := 'M�dico';
      TissSP.TissProfissional.TissSIGLACONSELHO := 'CRM';
      TissSP.TissProfissional.TissNumConselho := '02457';
      TissSP.TissProfissional.TissUFCONSELHO := 'RJ';
      TissSP.TissProfissional.TissfCBOS := '2011';

      // Prestador Executante
      {TissSP.TissPrestadorExec.TissTipoGeral INFORME ESSA PROPRIEDADE NO
      OBJECT INSPECTOR por padr�o fica o tipo para Juridico}
      TissSP.TissPrestadorExec.TissCNPJCPF := '02762719000195';
      TissSP.TissPrestadorExec.TissNomeContradado := 'Fabiano';
      TissSP.TissPrestadorExec.TisstipoLogradouro := '008';
      TissSP.TissPrestadorExec.TissLogradouro := 'Av. dos Anjos';
      TissSP.TissPrestadorExec.TissEndNum := '457';
      TissSP.TissPrestadorExec.TissComplemento := 'Complemento';
      TissSP.TissPrestadorExec.TisscodigoIBGE := 014;
      TissSP.TissPrestadorExec.TissMunicipio := 'Itaperuna';
      TissSP.TissPrestadorExec.TissUF := 'RJ';
      TissSP.TissPrestadorExec.TissCEP := '28380000';
      TissSP.TissPrestadorExec.TissCNES := 457;

      //profissional Executante Complementar
      //TissSP.Tissconfig.TissUsarProfissionalCompl:=false;
      TissSP.TissProfissionalCompl.TissProf:='Gledston';
      TissSP.TissProfissionalCompl.TissSiglaConselho:='CRM';
      TissSP.TissProfissionalCompl.TissNumConselho:='3435';
      TissSP.TissProfissionalCompl.TissUFConselho:='DF';
      TissSP.TissProfissionalCompl.TissfCBOS:='2011';
      TissSP.TissPrestadorExecCompl.TissTipoGeral:=FisicGeral;
      TissSP.TissPrestadorExecCompl.TissCNPJCPF:='24428051115';
      //indica��o Clinica
      TissSP.TissindicClinica := 'Teste';
      TissSP.TisscaraterAtend := 'E';
      TissSP.TissDataAtend := Now;

      //diagnostico Guia
      //TissSP.Tissconfig.TissUsarDiagnostico:=False;
      TissSP.TissDiagnostico.TissCIDCodDiag := '1';
      TissSP.TissDiagnostico.TissCIDNomeTab := 'CID-10';
      TissSP.TissDiagnostico.TissCIDDescDiag := 'Teste Sp/Sadt';
      TissSP.TissDiagnostico.TissTipDoenc := 'A';
      TissSP.TissDiagnostico.TissUnTemp := 'D';
      TissSP.TissDiagnostico.TissValor := 0;
      TissSP.TissDiagnostico.TissIndicAcid := 0;

      //tipo saida
      TissSP.TissTipoSaida := '5';
      TissSP.TissTipoAtend := 1;

      TissSP.adicionarGuia;

      //Adicionando Procedimentos Realizados
      for j:= 1 to 1 {2} do
        begin
          {Adiciona-se aqui todos os demais profissionais membros da equipe
          se tiver, se n�o tiver por favor n�o adicione aqui vem um detalhe
          e ser por acaso um procedimento tiver equipe e outro n�o, ent�o
          basta vc mudar a propridade TissSP.Tissconfig.TissProc.TissUsarEquipe para True
          e se no proximo procedimento n�o tiver equipe mude para false e pronto}
          TissSP.Tissconfig.TissProc.TissUsarEquipe := True;
          TissSP.TissProc.TissValorTotalGeral:=0;
          for l:= 1 to 3 do
            begin
              {TissSP.TissProc.TissEquipe.TissTipoMemb INFORME ESSA PROPRIEDADE NO
          OBJECT INSPECTOR por padr�o fica o tipo para FisicGeral}
              TissSP.TissProc.TissEquipe.TissTipoMemb:=conselhoProfissional;
              TissSP.TissProc.TissEquipe.TissCodProf := '22222222';{ o valor informado
              aqui depende do tipo (TissSP.TissProc.TissEquipe.TissTipoMemb)
               informado se o tipo for fis�co informe o CPF, Outros, Conselho Profissional}
              TissSP.TissProc.TissEquipe.TissProfiss.TissProf := 'M�dico ' + IntToStr(l);
              TissSP.TissProc.TissEquipe.TissProfiss.TissSiglaConselho := 'CRM';
              TissSP.TissProc.TissEquipe.TissProfiss.TissNumConselho := '02457';
              TissSP.TissProc.TissEquipe.TissProfiss.TissUFCONSELHO := 'RJ';
              TissSP.TissProc.TissEquipe.TissProfiss.TissfCBOS := '2011';
              TissSP.TissProc.TissEquipe.TissProfiss.TissPosicProf:=10;
              TissSP.adicionaProf;
            end;
          TissSP.TissProc.TissProcs.TissCodigo := '00010014';
          TissSP.TissProc.TissProcs.TissTipTabela := 1;
          TissSP.TissProc.TissProcs.TissDescricao := 'TESTE SP/SADT';
          TissSP.TissProc.TissData := Now;
          TissSP.TissProc.TissHsInicio := Now;
          TissSP.TissProc.TissHsFim := Now;
          TissSP.TissProc.TissQtde := 1;
          TissSP.TissProc.TissVdeAcesso := 'U';
          TissSP.TissProc.TissTecUtil := 'V';
          TissSP.TissProc.TissReducAcres := 0;
          TissSP.TissProc.TissValor := 12.5;
          TissSP.TissProc.TissValorTotal := 125.25;
          TissSP.TissProc.TissValorTotalGeral:=TissSP.TissProc.TissValorTotalGeral+TissSP.TissProc.TissValorTotal;
          TissSP.adicionaProc;
        end;


        // Adicionando OPM
        // � FUNDAMENTAL QUE VC ZERE ESTA PROPRIEDADE ANTES DE ADICIONAR AS OPMs
        TissSP.TissOpmUti.TissVlrTotOPM := 0;

        For j := 1 to 3 do
          begin
            TissSP.TissOpmUti.TissOpm.TissTabOpm.TissCodigo    := '12345678';
            TissSP.TissOpmUti.TissOpm.TissTabOpm.TissTipTab    := '02';
            TissSP.TissOpmUti.TissOpm.TissTabOpm.TissDescricao := 'DESCRICAO ORTESE PROTESE MATERIAL ESPECIAL SP/SADT: ' + IntToStr (j);
            TissSP.TissOpmUti.TissOpm.TissQtde                 := 1 * j;
            TissSP.TissOpmUti.TissOpm.TissCodBar               := '1234567890123';
            TissSP.TissOpmUti.TissOpm.TissVlrUn                := 12.34 * j;
            TissSP.TissOpmUti.TissOpm.TissVlrTot               := TissSP.TissOpmUti.TissOpm.TissQtde * TissSP.TissOpmUti.TissOpm.TissVlrUn;
            TissSP.TissOpmUti.TissVlrTotOPM := TissSP.TissOpmUti.TissVlrTotOPM + TissSP.TissOpmUti.TissOpm.TissVlrTot;
            TissSP.AdicionaOPM;
          end;


        //Adicionando Outras Despesas
        //ESTE M�TODO LIMPA OS VALORES DAS OUTRAS DESPESAS USAR ESTE M�TODO � FUNDAMENTAL
        TissSP.ClearDespesas;
        For j:= 1 to 1 {5} do
          begin
            with TissSP.TissOutDesp do
              begin
                TissDespesa.TissIdentCodigo := '00010014';//informei um c�digo qualquer
                TissDespesa.TissIdentTipoTab := '01'; {Verifique
                os valores nos arquivos da ANS}
                TissDespesa.TissIdentDesc := 'TESTE DE DESPESA SP/SADT' + IntToStr(j);
                TissDespesa.TissTipDespesa := 1;
                TissDespesa.TissDataReal := Date;
                TissDespesa.TissHoraInicial := Time;
                TissDespesa.TissHoraFinal := Time;
                TissDespesa.TissredAcres := 0;
                TissDespesa.TissQtde := 1;
                TissDespesa.TissVlrUn :=  19.80;
                TissDespesa.TissVlrTot := 19.5;

                //ATEN��O AQUI LEMBRE-SE DE ZERAR ESTA PROPRIEDADE NO INICIO
                TissTotalGeral := TissTotalGeral + TissDespesa.TissVlrTot;
                TissSP.adicionaOutDesp;
              end;


          // INFORME VALOR ZERO PARA O TOTAL QUE N�O TEM VALOR
          TissSP.TissProc.TissValorTotalServicos:=1234.56;
          TissSP.TissProc.TissValorTotalDiarias:=0;
          TissSP.TissProc.TissValorTotalTaxas:=239.00;
          TissSP.TissProc.TissValorTotalMateriais:=5678.90;
          TissSP.TissProc.TissValorTotalMedicamentos:=10000.34;
          TissSP.TissProc.TissValorTotalGases:=0;
          TissSP.TissProc.TissValorTotalGeral:=TissSP.TissProc.TissValorTotalGeral+TissSP.TissOutDesp.TissTotalGeral;
          TissSP.TissObservacao := 'Observa��o';
          end;
    TissSP.finalizaGuia;
    end;

 // TissSP.criaRodape;
  TissSP.GerarXml;
                  DecimalSeparator := ',';
    {VOLTANDO O SEPARADOR DE CASAS DECIMAIS AO PADRAO}

  if FileExists(TissSP.Tisscabecalho.TissArquivo) then
    begin
      RichEdit1.Lines.Clear;
      RichEdit1.Lines.LoadFromFile(TissSP.Tisscabecalho.TissArquivo);
      PageControl1.ActivePageIndex := 0;
    end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  lblVersao.Caption :='Vers�o dos componentes: '+ TissC.Versao.Versao;
  PageControl1.ActivePageIndex := 1;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i,j,l: Integer;
begin
  //Habilitar ou n�o a valida��o
  if ckvalidar.Checked then
    TissInt.TissValid.UsarValidacao := true
  else
    TissInt.TissValid.UsarValidacao := false;

  {ATEN��O ESTE COMPONENTE EST� EM FASE DE TESTE, QUALQUER D�VIDA ENTRE
  EM CONTATO PELO EMAIL: fopprado@gmail.com
  FALAR COM Fabiano}
  TissInt.iniciaInternacao; //M�todo de inicializa��o
  TissInt.Tisscabecalho.TissArquivo := 'internacao.xml';
  TissInt.Tisscabecalho.TissEncoding := 'ISO-8859-1';
  TissInt.Tisscabecalho.TissMensagemTissXml := 'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.ans.gov.br/padroes/tiss/schemas"';
  TissInt.Tisscabecalho.TissVersaoXml := '1.0';

  //CABE�ALHO
  TissInt.Tisscabecalho.TissTipoTrans := 'ENVIO_LOTE_GUIAS';//ENVIO_LOTE_GUIAS
  TissInt.Tisscabecalho.TissSequencialTrans := '3';
  TissInt.Tisscabecalho.TissDataRegistroTrans := Date;
  TissInt.Tisscabecalho.TissHoraRegistroTrans := Time;
  TissInt.Tisscabecalho.TissCNPJCPF := '02762719000195';
  TissInt.Tisscabecalho.TissRegANS := '0';
  TissInt.Tisscabecalho.TissVersaoTISS := '2.01.03';
  TissInt.Tisscabecalho.TissNumLote := '1545';
  //FIM CABE�ALHO
  TissInt.criaCabecalho;  {COMANDO PARA ADICIONAR O CABE�ALHO}

  {ATEN��O A ORDEM TEM QUE SER DE ACORDO COM ESTE DEMO, PRIMEIRO
  USA-SE O M�TODO "CRIACABE�ALHO" DEPOIS ADICIONA-SE AS GUIAS
  PASSANDO OS VALORES E USANDO O M�TODO "ADICIONARGUIA" E POR
  �LTIMO A PROCEDURE "CRIARRODAPE" SE N�O FOR FEITO ASSIM VAI GERAR ERRO}
  for i := 1 to 1 {5} do
    begin
      //identifica��o guia Interna��o
      TissInt.TissNumGuiaPrest := IntToStr(i);
      TissInt.TissNumGuiaOper := IntToStr(i);
      TissInt.TissNumGuiaSolic := IntToStr(i);
      TissInt.TissFontePadora.TissRegAns:= '154';
     // TissInt.TissRegANS := '0';
      TissInt.TissDataEmis := StrToDate ('26/10/2009');

      //dados autoriza��o
      TissInt.TissDataAut := Date;
      TissInt.TissSenhaAut := '123456';
      TissInt.TissSenhaValid := Date + 30;

      //Dados Beneficiario
      TissInt.TissBeneficiario.TissNumCarteira := IntToStr(I);
      TissInt.TissBeneficiario.TissBenific := 'Paciente teste';
      TissInt.TissBeneficiario.TissNomePlano := 'PLANO DE SA�DE'+IntToStr(i);
      TissInt.TissBeneficiario.TissValidadeCart := Date + 30;
      TissInt.TissBeneficiario.TissNumCNS := '45787';

      //Dados Solicitante
      {TissInt.TissContratado.TissTipoGeral INFORME ESSA PROPRIEDADE NO
      OBJECT INSPECTOR por padr�o fica o tipo para Juridico}
      TissInt.TissContratado.TissCNPJCPF := '02762719000195';
      TissInt.TissContratado.TissNomeContradado := 'Fabiano';
      TissInt.TissContratado.TisstipoLogradouro := '008';
      TissInt.TissContratado.TissLogradouro := 'Av. dos Anjos';
      TissInt.TissContratado.TissEndNum := '457';
      TissInt.TissContratado.TissComplemento := 'Complemento';
      TissInt.TissContratado.TisscodigoIBGE := 014;
      TissInt.TissContratado.TissMunicipio := 'Itaperuna';
      TissInt.TissContratado.TissUF := 'RJ';
      TissInt.TissContratado.TissCEP := '28380000';
      TissInt.TissContratado.TissCNES := 457;

        //profissional
      TissInt.TissProfissional.TissProf := 'M�dico';
      TissInt.TissProfissional.TissSIGLACONSELHO := 'CRM';
      TissInt.TissProfissional.TissNumConselho := '02457';
      TissInt.TissProfissional.TissUFCONSELHO := 'RJ';
      TissInt.TissProfissional.TissfCBOS := '2231.44';

      // Prestador Executante
      {TissInt.TissPrestadorExec.TissTipoGeral INFORME ESSA PROPRIEDADE NO
      OBJECT INSPECTOR por padr�o fica o tipo para Juridico}
      TissInt.TissPrestadorExec.TissCNPJCPF := '02762719000195';
      TissInt.TissPrestadorExec.TissNomeContradado := 'Fabiano';
      TissInt.TissPrestadorExec.TisstipoLogradouro := '008';
      TissInt.TissPrestadorExec.TissLogradouro := 'Av. dos Anjos';
      TissInt.TissPrestadorExec.TissEndNum := '457';
      TissInt.TissPrestadorExec.TissComplemento := 'Complemento';
      TissInt.TissPrestadorExec.TisscodigoIBGE := 014;
      TissInt.TissPrestadorExec.TissMunicipio := 'Itaperuna';
      TissInt.TissPrestadorExec.TissUF := 'RJ';
      TissInt.TissPrestadorExec.TissCEP := '28380000';
      TissInt.TissPrestadorExec.TissCNES := 457;
      //Carater da interna��o
      TissInt.TisscaraterAtend := 'E';

      TissInt.Tissacomodacao := '1';
      TissInt.TissDataHoraInt := Now;
      TissInt.TissDataHoraSaidaInt := Now;
      //Tipo e regime interna��o
      TissInt.TissTipoInternacao := 1;
      TissInt.TissRegInt := '1';


      //Diagnostico Sa�da interna��o
      TissInt.TissDiagSaidInt.TissIndicAcid := 0;
      TissInt.TissDiagSaidInt.TissMotSaidInt := '11';
      TissInt.TissDiagSaidInt.TissDiagPrinc.TissCIDNomeTab := 'CID-10';
      TissInt.TissDiagSaidInt.TissDiagPrinc.TissCIDCodDiag := '1';
      TissInt.TissDiagSaidInt.TissDiagPrinc.TissCIDDescDiag := 'TESTE INT';

      TissInt.TissDiagSaidInt.TissDiagSec.TissCIDNomeTab := 'CID-10';;
      TissInt.TissDiagSaidInt.TissDiagSec.TissCIDCodDiag := '1';
      TissInt.TissDiagSaidInt.TissDiagSec.TissCIDDescDiag := 'TESTE INT';


      //EM CASO DE �BITO
      TissInt.TissDiagSaidInt.TissObito.TissCID.TissCIDNomeTab := 'CID-10';
      TissInt.TissDiagSaidInt.TissObito.TissCID.TissCIDCodDiag  := '1';
      TissInt.TissDiagSaidInt.TissObito.TissCID.TissCIDDescDiag := 'TESTE INT';
      TissInt.TissDiagSaidInt.TissObito.TissnumeracaoDe := '8';
      //Tipo faturamento
      TissInt.TissTipoFat := 'T';


      TissInt.adicionarGuia;

      //Adicionando Procedimentos Realizados
      for j:= 1 to 1 {2} do
        begin
          {Adiciona-se aqui todos os demais profissionais membros da equipe
          se tiver, se n�o tiver por favor n�o adicione aqui vem um detalhe
          e ser por acaso um procedimento tiver equipe e outro n�o, ent�o
          basta vc mudar a propridade TissInt.Tissconfig.TissProc.TissUsarEquipe para True
          e se no proximo procedimento n�o tiver equipe mude para false e pronto}
          TissInt.Tissconfig.TissProc.TissUsarEquipe := True;
          TissInt.TissProc.TissValorTotalGeral:=0;
          for l:= 1 to 3 do
            begin
              {TissInt.TissProc.TissEquipe.TissTipoMemb INFORME ESSA PROPRIEDADE NO
          OBJECT INSPECTOR por padr�o fica o tipo para Juridico}
              TissInt.TissProc.TissEquipe.TissTipoMemb:=FisicGeral;
              TissInt.TissProc.TissEquipe.TissCodProf := '24428051115';{ o valor informado
              aqui depende do tipo (TissInt.TissProc.TissEquipe.TissTipoMemb)
               informado se o tipo for jur�dico informe o informe CPF, Outros, Conselho Profissional}
              TissInt.TissProc.TissEquipe.TissProfiss.TissProf := 'M�dico ' + IntToStr(l);
              TissInt.TissProc.TissEquipe.TissProfiss.TissSiglaConselho := 'CRM';
              TissInt.TissProc.TissEquipe.TissProfiss.TissNumConselho := '02457';
              TissInt.TissProc.TissEquipe.TissProfiss.TissUFCONSELHO := 'RJ';
              TissInt.TissProc.TissEquipe.TissProfiss.TissfCBOS := '2231.44';
              TissInt.TissProc.TissEquipe.TissProfiss.TissPosicProf := 11;

              TissInt.adicionaProf;
            end;
          TissInt.TissProc.TissProcs.TissCodigo := '00010014';
          TissInt.TissProc.TissProcs.TissTipTabela := 1;
          TissInt.TissProc.TissProcs.TissDescricao := 'TESTE INT.';
          TissInt.TissProc.TissData := Now;
          TissInt.TissProc.TissHsInicio := Now;
          TissInt.TissProc.TissHsFim := Now;
          TissInt.TissProc.TissQtde := 1;
          TissInt.TissProc.TissVdeAcesso := 'U';
          TissInt.TissProc.TissTecUtil := 'V';
          TissInt.TissProc.TissReducAcres := 0;
          TissInt.TissProc.TissValor := 19.80;
          TissInt.TissProc.TissValorTotal := 125.45;
          TissInt.TissProc.TissValorTotalGeral:=TissInt.TissProc.TissValorTotalGeral+TissInt.TissProc.TissValorTotal;
          TissInt.adicionaProc;
        end;


        // Adicionando OPM
        // � FUNDAMENTAL QUE VC ZERE ESTA PROPRIEDADE ANTES DE ADICIONAR AS OPMs
        TissInt.TissOpmUti.TissVlrTotOPM := 0;

        For j := 1 to 2 do
          begin
            TissInt.TissOpmUti.TissOpm.TissTabOpm.TissCodigo    := '12345678';
            TissInt.TissOpmUti.TissOpm.TissTabOpm.TissTipTab    := '02';
            TissInt.TissOpmUti.TissOpm.TissTabOpm.TissDescricao := 'DESCRICAO ORTESE PROTESE MATERIAL ESPECIAL INT.: ' + IntToStr (j);
            TissInt.TissOpmUti.TissOpm.TissQtde                 := 1 * j;
            TissInt.TissOpmUti.TissOpm.TissCodBar               := '1234567890123';
            TissInt.TissOpmUti.TissOpm.TissVlrUn                := 12.34 * j;
            TissInt.TissOpmUti.TissOpm.TissVlrTot               := TissInt.TissOpmUti.TissOpm.TissQtde * TissInt.TissOpmUti.TissOpm.TissVlrUn;
            TissInt.TissOpmUti.TissVlrTotOPM := TissInt.TissOpmUti.TissVlrTotOPM + TissInt.TissOpmUti.TissOpm.TissVlrTot;
            TissInt.AdicionaOPM;
          end;


        //Adicionando Outras Despesas
        ////ESTE M�TODO LIMPA OS VALORES DAS OUTRAS DESPESAS ESTE M�TODO � FUNDAMENTAL
        TissInt.ClearDespesas;
        For j:= 1 to 1 {5} do
          begin
            with TissInt.TissOutDesp do
              begin
                TissDespesa.TissIdentCodigo := '00010014';//informei um c�digo qualquer
                TissDespesa.TissIdentTipoTab := '01'; {Verifique
                os valores nos arquivos da ANS}
                TissDespesa.TissIdentDesc := 'TESTE DE DESPESA INT. ' + IntToStr(j);

                TissDespesa.TissTipDespesa := 1;

                TissDespesa.TissDataReal := Date;
                TissDespesa.TissHoraInicial := Time;
                TissDespesa.TissHoraFinal := Time;
                TissDespesa.TissredAcres := 0;
                TissDespesa.TissQtde := 1;


                TissDespesa.TissVlrUn :=  19.80;
                TissDespesa.TissVlrTot := 19.5;

                //ATEN��O AQUI LEMBRE-SE DE ZERAR ESTA PROPRIEDADE NO INICIO
                TissTotalGeral := TissTotalGeral + TissDespesa.TissVlrTot;
                TissInt.adicionaOutDesp;
              end;
              TissInt.TissProc.TissValorTotalServicos:=1234.56;
              TissInt.TissProc.TissValorTotalDiarias:=0;
              TissInt.TissProc.TissValorTotalTaxas:=239.00;
              TissInt.TissProc.TissValorTotalMateriais:=5678.90;
              TissInt.TissProc.TissValorTotalMedicamentos:=10000.34;
              TissInt.TissProc.TissValorTotalGases:=0;
              TissInt.TissProc.TissValorTotalGeral:=TissInt.TissProc.TissValorTotalGeral+TissInt.TissOutDesp.TissTotalGeral;
          end;

      TissInt.FinalizaGuia;
    end;

 // TissInt.criaRodape;
  TissInt.TissObservacao := 'Observa��o';
  TissInt.GerarXml;
  if FileExists(TissInt.Tisscabecalho.TissArquivo) then
    begin
      RichEdit1.Lines.Clear;
      RichEdit1.Lines.LoadFromFile(TissInt.Tisscabecalho.TissArquivo);
      PageControl1.ActivePageIndex := 0;
    end;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  RenameFile(TissSP.Tisscabecalho.TissArquivo,'fop.xml');
end;

end.

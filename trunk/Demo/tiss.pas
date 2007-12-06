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
  //Habilitar ou não a validação
  if ckvalidar.Checked then
    TissC.TissValid.UsarValidacao := true
  else
    TissC.TissValid.UsarValidacao := false;

  {ATENÇÃO ESTE COMPONENTE ESTÁ EM FASE DE TESTE, QUALQUER DÚVIDA ENTRE
  EM CONTATO PELO EMAIL: fopprado@gmail.com ou pelo MSN: fopprado@hotmail.com
  FALAR COM FABIANO DE OLIVEIRA PRADO}
  TissC.TissArquivo := 'CONSULTA.xml';
  TissC.TissEncoding := 'ISO-8859-1';
  TissC.TissMensagemTissXml := 'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.ans.gov.br/padroes/tiss/schemas"';
  TissC.TissVersaoXml := '1.0';


  //CABEÇALHO
  TissC.TissTipoTrans := 'ENVIO_LOTE_GUIAS';
  TissC.TissSequencialTrans := '1';
  TissC.TissDataRegistroTrans := Date;
  TissC.TissHoraRegistroTrans := Time;
  TissC.TissTipo := Juridico;
  TissC.TissCNPJCPF := '02762719000195';
  TissC.TissRegANS := '0';
  TissC.TissVersaoTISS := '2.01.02';
  TissC.TissNumLote := '1545';  
  //FIM CABEÇALHO
  TissC.criaCabecalho;  {COMANDO PARA ADICIONAR O CABEÇALHO}

  {ATENÇÃO A ORDEM TEM QUE SER DE ACORDO COM ESTE DEMO, PRIMEIRO
  USA-SE O MÉTODO "CRIACABEÇALHO" DEPOIS ADICIONA-SE AS GUIAS
  PASSANDO OS VALORES E USANDO O MÉTODO "ADICIONARGUIA" E POR
  ÚLTIMO A PROCEDURE "CRIARRODAPE" SE NÃO FOR FEITO ASSIM VAI GERAR ERRO}

  //Adicionando guias
   for i:= 1 to 5 do
     begin
        TissC.TissRegANS := '0';
        TissC.TissNumGuia := IntToStr(I);
        TissC.TissNumCarteira := '548787';
        TissC.TissPaciente := 'Fabiano de Oliveira Prado';
        TissC.TissNomePlano := 'PLANO DE SAUDE '+IntToStr(I);
        TissC.TissValidadeCart := Date + 30;
        TissC.TissNumCNS := '45787';
        TissC.TissNomeContradado := 'CLÍNICA';
        TissC.TisstipoLogradouro := '008';
        TissC.TissLogradouro := 'Av. dos Anjos';
        TissC.TissEndNum := '457';
        TissC.TissComplemento := 'Complemento';
        TissC.TisscodigoIBGE := 014;
        TissC.TissMunicipio := 'Itaperuna';
        TissC.TissUF := 'RJ';
        TissC.TissCEP := '28380000';
        TissC.TissCNES := 457;
        TissC.TissMEDICO := 'Médico';
        TissC.TissSIGLACONSELHO := 'CRM';
        TissC.TissNUMEROCONSELHO := '02457';
        TissC.TissUFCONSELHO := 'RJ';
        TissC.TissCBOS := 01280;

        //hipótese diagnóstica
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

        //Se quiser colocar observação
        TissC.TissObs := 'OBSERVAÇÕES SOBRE A CONSULTA';


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

          {MUITA ATENÇÃO AQUI COMO ANS TRABALHA COM VÍRGULA PARA SEPARAR AS CASAS
          DECIMAIS É NECESSÁRIO COLOCAR A LINHA ABAIXO}
          DecimalSeparator := ',';
  //Habilitar ou não a validação
  if ckvalidar.Checked then
    TissSP.TissValid.UsarValidacao := true
  else
    TissSP.TissValid.UsarValidacao := false;

  {ATENÇÃO ESTE COMPONENTE ESTÁ EM FASE DE TESTE, QUALQUER DÚVIDA ENTRE
  EM CONTATO PELO EMAIL: fopprado@gmail.com ou pelo MSN: fopprado@hotmail.com
  FALAR COM FABIANO DE OLIVEIRA PRADO}
  TissSP.iniciaSPSADT; //Método de inicialização
  TissSP.Tisscabecalho.TissArquivo := 'SPSADT.xml';
  TissSP.Tisscabecalho.TissEncoding := 'ISO-8859-1';
  TissSP.Tisscabecalho.TissMensagemTissXml := 'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.ans.gov.br/padroes/tiss/schemas"';
  TissSP.Tisscabecalho.TissVersaoXml := '1.0';

  //CABEÇALHO
  TissSP.Tisscabecalho.TissTipoTrans := 'ENVIO_LOTE_GUIAS';//ENVIO_LOTE_GUIAS
  TissSP.Tisscabecalho.TissSequencialTrans := '2';
  TissSP.Tisscabecalho.TissDataRegistroTrans := Date;
  TissSP.Tisscabecalho.TissHoraRegistroTrans := Time;
  TissSP.Tisscabecalho.TissCNPJCPF := '02762719000195';
  TissSP.Tisscabecalho.TissRegANS := '0';
  TissSP.Tisscabecalho.TissVersaoTISS := '2.01.02';
  TissSP.Tisscabecalho.TissNumLote := '1545';
  //FIM CABEÇALHO
  TissSP.criaCabecalho;  {COMANDO PARA ADICIONAR O CABEÇALHO}

  {ATENÇÃO A ORDEM TEM QUE SER DE ACORDO COM ESTE DEMO, PRIMEIRO
  USA-SE O MÉTODO "CRIACABEÇALHO" DEPOIS ADICIONA-SE AS GUIAS
  PASSANDO OS VALORES E USANDO O MÉTODO "ADICIONARGUIA" E POR
  ÚLTIMO A PROCEDURE "CRIARRODAPE" SE NÃO FOR FEITO ASSIM VAI GERAR ERRO}
  for i:= 1 to 5 do
    begin
      //identificação guia SADTSP
      TissSP.TissNumGuiaPrest := IntToStr(i);
      TissSP.TissNumGuiaOper := IntToStr(i);
      TissSP.TissRegANS := '0';

      //dados autorização
      TissSP.TissDataAut := Date;
      TissSP.TissSenhaAut := '123456';
      TissSP.TissSenhaValid := Date + 30;

      //Dados Beneficiario
      TissSP.TissBeneficiario.TissNumCarteira := IntToStr(I);
      TissSP.TissBeneficiario.TissBenific := 'Fabiano de Oliveira Prado';
      TissSP.TissBeneficiario.TissNomePlano := 'PLANO DE SAÚDE'+IntToStr(i);
      TissSP.TissBeneficiario.TissValidadeCart := Date + 30;
      TissSP.TissBeneficiario.TissNumCNS := '45787';

      //Dados Solicitante
      {TissSP.TissContratado.TissTipoGeral INFORME ESSA PROPRIEDADE NO
      OBJECT INSPECTOR por padrão fica o tipo para Juridico}
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
      TissSP.TissProfissional.TissProf := 'Médico';
      TissSP.TissProfissional.TissSIGLACONSELHO := 'CRM';
      TissSP.TissProfissional.TissNumConselho := '02457';
      TissSP.TissProfissional.TissUFCONSELHO := 'RJ';
      TissSP.TissProfissional.TissfCBOS := 06158;

      // Prestador Executante
      {TissSP.TissPrestadorExec.TissTipoGeral INFORME ESSA PROPRIEDADE NO
      OBJECT INSPECTOR por padrão fica o tipo para Juridico}
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

      //indicação Clinica
      TissSP.TissindicClinica := 'Teste';
      TissSP.TisscaraterAtend := 'E';
      TissSP.TissDataAtend := Now;

      //diagnostico Guia
      TissSP.TissDiagnostico.TissCIDCodDiag := '1';
      TissSP.TissDiagnostico.TissCIDNomeTab := 'CID-10';
      TissSP.TissDiagnostico.TissCIDDescDiag := 'Teste';
      TissSP.TissDiagnostico.TissTipDoenc := 'A';
      TissSP.TissDiagnostico.TissUnTemp := 'D';
      TissSP.TissDiagnostico.TissValor := 0;
      TissSP.TissDiagnostico.TissIndicAcid := 0;

      //tipo saida
      TissSP.TissTipoSaida := '5';
      TissSP.TissTipoAtend := 1;

      TissSP.adicionarGuia;

      //Adicionando Procedimentos Realizados
      for j:= 1 to 2 do
        begin
          {Adiciona-se aqui todos os demais profissionais membros da equipe
          se tiver, se não tiver por favor não adicione aqui vem um detalhe
          e ser por acaso um procedimento tiver equipe e outro não, então
          basta vc mudar a propridade TissSP.Tissconfig.TissProc.TissUsarEquipe para True
          e se no proximo procedimento não tiver equipe mude para false e pronto}
          TissSP.Tissconfig.TissProc.TissUsarEquipe := True;
          for l:= 1 to 3 do
            begin
              {TissSP.TissProc.TissEquipe.TissTipoMemb INFORME ESSA PROPRIEDADE NO
          OBJECT INSPECTOR por padrão fica o tipo para Juridico}
              TissSP.TissProc.TissEquipe.TissCodProf := '02762719000195';{ o valor informado
              aqui depende do tipo (TissSP.TissProc.TissEquipe.TissTipoMemb)
               informado se o tipo for jurídico informe o CNPJ se não
              informe CPF}
              TissSP.TissProc.TissEquipe.TissProfiss.TissProf := 'Médico ' + IntToStr(l);
              TissSP.TissProc.TissEquipe.TissProfiss.TissSiglaConselho := 'CRM';
              TissSP.TissProc.TissEquipe.TissProfiss.TissNumConselho := '02457';
              TissSP.TissProc.TissEquipe.TissProfiss.TissUFCONSELHO := 'RJ';
              TissSP.TissProc.TissEquipe.TissProfiss.TissfCBOS := 06158;


              TissSP.adicionaProf;
            end;
          TissSP.TissProc.TissProcs.TissCodigo := '00010014';
          TissSP.TissProc.TissProcs.TissTipTabela := 1;
          TissSP.TissProc.TissProcs.TissDescricao := 'TESTE';
          TissSP.TissProc.TissData := Now;
          TissSP.TissProc.TissHsInicio := Now;
          TissSP.TissProc.TissHsFim := Now;
          TissSP.TissProc.TissQtde := 1;
          TissSP.TissProc.TissVdeAcesso := 'U';
          TissSP.TissProc.TissTecUtil := 'V';
          TissSP.TissProc.TissReducAcres := 0;
          TissSP.TissProc.TissValor := 12.5;
          TissSP.TissProc.TissValorTotal := 125.25;
          TissSP.adicionaProc;
        end;

        //Adicionando Outras Despesas
        //É FUNDAMENTAL QUE VC ZERE ESTA PROPRIEDADE ANTES DE ADICIONAR AS DESPESAS
        TissSP.TissOutDesp.TissTotalGeral := 0;
        For j:= 1 to 5 do
          begin
            with TissSP.TissOutDesp do
              begin
                TissDespesa.TissIdentCodigo := '00010014';//informei um código qualquer
                TissDespesa.TissIdentTipoTab := '01'; {Verifique
                os valores nos arquivos da ANS}
                TissDespesa.TissIdentDesc := 'TESTE DE DESPESA ' + IntToStr(j);

                TissDespesa.TissTipDespesa := 1;

                TissDespesa.TissDataReal := Date;
                TissDespesa.TissHoraInicial := Time;
                TissDespesa.TissHoraFinal := Time;
                TissDespesa.TissredAcres := 0;
                TissDespesa.TissQtde := 1;


                TissDespesa.TissVlrUn :=  19.80;
                TissDespesa.TissVlrTot := 19.5;

                //ATENÇÃO AQUI LEMBRE-SE DE ZERAR ESTA PROPRIEDADE NO INICIO
                TissTotalGeral := TissTotalGeral + TissDespesa.TissVlrTot;
                TissSP.adicionaOutDesp;
              end;
          end;
      TissSP.finalizaGuia; 
    end;

 // TissSP.criaRodape;
  TissSP.GerarXml;
                  DecimalSeparator := '.';
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
  lblVersao.Caption :='Versão dos componentes: '+ TissC.Versao.Versao;
  PageControl1.ActivePageIndex := 1;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  i,j,l: Integer;
begin
  //Habilitar ou não a validação
  if ckvalidar.Checked then
    TissInt.TissValid.UsarValidacao := true
  else
    TissInt.TissValid.UsarValidacao := false;

  {ATENÇÃO ESTE COMPONENTE ESTÁ EM FASE DE TESTE, QUALQUER DÚVIDA ENTRE
  EM CONTATO PELO EMAIL: fopprado@gmail.com ou pelo MSN: fopprado@hotmail.com
  FALAR COM FABIANO DE OLIVEIRA PRADO}
  TissInt.iniciaInternacao; //Método de inicialização
  TissInt.Tisscabecalho.TissArquivo := 'internacao.xml';
  TissInt.Tisscabecalho.TissEncoding := 'ISO-8859-1';
  TissInt.Tisscabecalho.TissMensagemTissXml := 'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.ans.gov.br/padroes/tiss/schemas"';
  TissInt.Tisscabecalho.TissVersaoXml := '1.0';

  //CABEÇALHO
  TissInt.Tisscabecalho.TissTipoTrans := 'ENVIO_LOTE_GUIAS';//ENVIO_LOTE_GUIAS
  TissInt.Tisscabecalho.TissSequencialTrans := '3';
  TissInt.Tisscabecalho.TissDataRegistroTrans := Date;
  TissInt.Tisscabecalho.TissHoraRegistroTrans := Time;
  TissInt.Tisscabecalho.TissCNPJCPF := '02762719000195';
  TissInt.Tisscabecalho.TissRegANS := '0';
  TissInt.Tisscabecalho.TissVersaoTISS := '2.01.02';
  TissInt.Tisscabecalho.TissNumLote := '1545';
  //FIM CABEÇALHO
  TissInt.criaCabecalho;  {COMANDO PARA ADICIONAR O CABEÇALHO}

  {ATENÇÃO A ORDEM TEM QUE SER DE ACORDO COM ESTE DEMO, PRIMEIRO
  USA-SE O MÉTODO "CRIACABEÇALHO" DEPOIS ADICIONA-SE AS GUIAS
  PASSANDO OS VALORES E USANDO O MÉTODO "ADICIONARGUIA" E POR
  ÚLTIMO A PROCEDURE "CRIARRODAPE" SE NÃO FOR FEITO ASSIM VAI GERAR ERRO}
  for i:= 1 to 5 do
    begin
      //identificação guia SADTSP
      TissInt.TissNumGuiaPrest := IntToStr(i);
      TissInt.TissNumGuiaOper := IntToStr(i);
      TissInt.TissRegANS := '0';

      //dados autorização
      TissInt.TissDataAut := Date;
      TissInt.TissSenhaAut := '123456';
      TissInt.TissSenhaValid := Date + 30;

      //Dados Beneficiario
      TissInt.TissBeneficiario.TissNumCarteira := IntToStr(I);
      TissInt.TissBeneficiario.TissBenific := 'Fabiano de Oliveira Prado';
      TissInt.TissBeneficiario.TissNomePlano := 'PLANO DE SAÚDE'+IntToStr(i);
      TissInt.TissBeneficiario.TissValidadeCart := Date + 30;
      TissInt.TissBeneficiario.TissNumCNS := '45787';

      //Dados Solicitante
      {TissInt.TissContratado.TissTipoGeral INFORME ESSA PROPRIEDADE NO
      OBJECT INSPECTOR por padrão fica o tipo para Juridico}
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
      TissInt.TissProfissional.TissProf := 'Médico';
      TissInt.TissProfissional.TissSIGLACONSELHO := 'CRM';
      TissInt.TissProfissional.TissNumConselho := '02457';
      TissInt.TissProfissional.TissUFCONSELHO := 'RJ';
      TissInt.TissProfissional.TissfCBOS := 06158;

      // Prestador Executante
      {TissInt.TissPrestadorExec.TissTipoGeral INFORME ESSA PROPRIEDADE NO
      OBJECT INSPECTOR por padrão fica o tipo para Juridico}
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
      //Carater da internação
      TissInt.TisscaraterAtend := 'E';

      TissInt.Tissacomodacao := '1';
      TissInt.TissDataHoraInt := Now;
      TissInt.TissDataHoraSaidaInt := Now;
      //Tipo e regime internação
      TissInt.TissTipoInternacao := 1;
      TissInt.TissRegInt := '1';

      
      //Diagnostico Saída internação
      TissInt.TissDiagSaidInt.TissIndicAcid := 0;
      TissInt.TissDiagSaidInt.TissMotSaidInt := '10';
      TissInt.TissDiagSaidInt.TissDiagPrinc.TissCIDNomeTab := 'CID-10';
      TissInt.TissDiagSaidInt.TissDiagPrinc.TissCIDCodDiag := '1';
      TissInt.TissDiagSaidInt.TissDiagPrinc.TissCIDDescDiag := 'TESTE';

      TissInt.TissDiagSaidInt.TissDiagSec.TissCIDNomeTab := 'CID-10';;
      TissInt.TissDiagSaidInt.TissDiagSec.TissCIDCodDiag := '1';
      TissInt.TissDiagSaidInt.TissDiagSec.TissCIDDescDiag := 'TESTE';


      //EM CASO DE ÓBITO
      TissInt.TissDiagSaidInt.TissObito.TissCID.TissCIDNomeTab := 'CID-10';
      TissInt.TissDiagSaidInt.TissObito.TissCID.TissCIDCodDiag  := '1';
      TissInt.TissDiagSaidInt.TissObito.TissCID.TissCIDDescDiag := 'TESTE';
      TissInt.TissDiagSaidInt.TissObito.TissnumeracaoDe := '8';
      //Tipo faturamento
      TissInt.TissTipoFat := 'T';


      TissInt.adicionarGuia;

      //Adicionando Procedimentos Realizados
      for j:= 1 to 2 do
        begin
          {Adiciona-se aqui todos os demais profissionais membros da equipe
          se tiver, se não tiver por favor não adicione aqui vem um detalhe
          e ser por acaso um procedimento tiver equipe e outro não, então
          basta vc mudar a propridade TissInt.Tissconfig.TissProc.TissUsarEquipe para True
          e se no proximo procedimento não tiver equipe mude para false e pronto}
         // TissInt.Tissconfig.TissProc.TissUsarEquipe := True;
          for l:= 1 to 3 do
            begin
              {TissInt.TissProc.TissEquipe.TissTipoMemb INFORME ESSA PROPRIEDADE NO
          OBJECT INSPECTOR por padrão fica o tipo para Juridico}
              TissInt.TissProc.TissEquipe.TissCodProf := '02762719000195';{ o valor informado
              aqui depende do tipo (TissInt.TissProc.TissEquipe.TissTipoMemb)
               informado se o tipo for jurídico informe o CNPJ se não
              informe CPF}
              TissInt.TissProc.TissEquipe.TissProfiss.TissProf := 'Médico ' + IntToStr(l);
              TissInt.TissProc.TissEquipe.TissProfiss.TissSiglaConselho := 'CRM';
              TissInt.TissProc.TissEquipe.TissProfiss.TissNumConselho := '02457';
              TissInt.TissProc.TissEquipe.TissProfiss.TissUFCONSELHO := 'RJ';
              TissInt.TissProc.TissEquipe.TissProfiss.TissfCBOS := 06158;


              TissInt.adicionaProf;
            end;
          TissInt.TissProc.TissProcs.TissCodigo := '00010014';
          TissInt.TissProc.TissProcs.TissTipTabela := 1;
          TissInt.TissProc.TissProcs.TissDescricao := 'TESTE';
          TissInt.TissProc.TissData := Now;
          TissInt.TissProc.TissHsInicio := Now;
          TissInt.TissProc.TissHsFim := Now;
          TissInt.TissProc.TissQtde := 1;
          TissInt.TissProc.TissVdeAcesso := 'U';
          TissInt.TissProc.TissTecUtil := 'V';
          TissInt.TissProc.TissReducAcres := 0;
          TissInt.TissProc.TissValor := 19.80;
          TissInt.TissProc.TissValorTotal := 125.45;
          TissInt.adicionaProc;
        end;

        //Adicionando Outras Despesas
        //É FUNDAMENTAL QUE VC ZERE ESTA PROPRIEDADE ANTES DE ADICIONAR AS DESPESAS
        TissInt.TissOutDesp.TissTotalGeral := 0;
        For j:= 1 to 5 do
          begin
            with TissInt.TissOutDesp do
              begin
                TissDespesa.TissIdentCodigo := '00010014';//informei um código qualquer
                TissDespesa.TissIdentTipoTab := '01'; {Verifique
                os valores nos arquivos da ANS}
                TissDespesa.TissIdentDesc := 'TESTE DE DESPESA ' + IntToStr(j);

                TissDespesa.TissTipDespesa := 1;

                TissDespesa.TissDataReal := Date;
                TissDespesa.TissHoraInicial := Time;
                TissDespesa.TissHoraFinal := Time;
                TissDespesa.TissredAcres := 0;
                TissDespesa.TissQtde := 1;


                TissDespesa.TissVlrUn :=  19.80;
                TissDespesa.TissVlrTot := 19.5;

                //ATENÇÃO AQUI LEMBRE-SE DE ZERAR ESTA PROPRIEDADE NO INICIO
                TissTotalGeral := TissTotalGeral + TissDespesa.TissVlrTot;
                TissInt.adicionaOutDesp;
              end;
          end;
      TissInt.finalizaGuia;
    end;

 // TissInt.criaRodape;
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

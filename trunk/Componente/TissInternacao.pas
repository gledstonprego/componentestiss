unit TissInternacao;

interface

uses
  SysUtils, Classes,untTissComp,Windows,Dialogs,Messages,forms,xmldom, XMLIntf, msxmldom,
  XMLDoc,untConfSPSADT,Graphics,untConfInt;

const
  MSG_TOVALIDATE_PTBR = 'A SER VALIDADO';
  MSG_ISVALID_PTBR    = 'VÁLIDO';
  MSG_ISNTVALID_PTBR  = 'INVÁLIDO';

type
  TTissInternacao = class(TComponent)
  private

    FCabecalho: TStringList;
    FGuia:TStringList;
    FProc:TStringList;
    FMembEquipe:TStringList;
    FOPM: TStringList;
    FOutDesp: TStringList;    
    FGeral: TStringList;  
    FNumeroDN: TStringList;

    FTissCabecalho: TTissCabecalho;
    FNumGuiaOper: String;
    FNumGuiaPrest: String;
    FDataEmis:TDateTime;
    FSenhaAut: String;
    FDataAut: TDateTime;
    FSenhaValid: TDateTime;
    FTissBenific: TTissBenific;
    FTissContratado: TTissContratado;
    FTissProfissional: TTissProfissional;
    FTissPrestExec: TTissContratado;
    FcaraAtend: String;
    Facomodacao: String;
    FTipoInternacao: Integer;
    FRegInt: String;
    FDataHoraSaidaInt: TDateTime;
    FDataHoraInt: TDateTime;
    FDiagSaidInt: TDiagSaidInt;
    FTissSPProcedimentos: TTissSPProcedimentos;
    FTissInternacaoObstetrica: TTissInternacaoObstetrica;
    FTipoFat: String;
    FNumGuiaSolic: String;
    FCarcInt: String;
    FTissOpmUti: TTissOpmUti;
    FTissOutrasDesp: TTissOutrasDesp;
    FCompVersao: TCompVersao;
    FTissConf: TTissConfInt;
    FTissValid: TTissValidacao;
    FAnsVersaoxsd: TTissAnsVersao;
    FFontePagadora: TTissIdentFontPag;
    FObservacao: String;

    procedure setNumGuiaOper(const Value: String);
    procedure setNumGuiaPrest(const Value: String);
    procedure setDataEmis(const Value: TDateTime);

    procedure setDataAut(const Value: TDateTime);
    procedure setSenhaAut(const Value: String);
    procedure setSenhaValid(const Value: TDateTime);
    procedure setcaraAtend(const Value: String);

    procedure setacomodacao(const Value: String);
    procedure setDataHoraInt(const Value: TDateTime);
    procedure setDataHoraSaidaInt(const Value: TDateTime);
    procedure setRegInt(const Value: String);
    procedure setTipoInternacao(const Value: Integer);
    procedure setTipoFat(const Value: String);
    procedure setNumGuiaSolic(const Value: String);
    function hash(arquivohash:string): String;
    procedure setCarcInt(const Value: String);
    procedure setAnsVersaoxsd(const Value: TTissAnsVersao);
    procedure SetFontePagadora(const Value: TTissIdentFontPag);
    procedure setObservacao(const Value: String);
    procedure setTissInternacaoObstetrica(
      const Value: TTissInternacaoObstetrica);

    { Private declarations }
  protected
    { Protected declarations }
    function BooleanToStr(value: Boolean): String;
  public
    { Public declarations }
    procedure iniciaInternacao;
    procedure criaCabecalho;
    procedure adicionarGuia;
    procedure adicionaProc;
    procedure adicionaProf;
    procedure AdicionaOPM;
    procedure adicionaOutDesp;
    procedure adicionaNumeroDN;
    procedure finalizaGuia;
    procedure GerarXml;
    procedure ClearDespesas;
    constructor create(Aowner: TComponent);override;
  published
    { Published declarations }
    //versão do xsd da ANS
    property ansVersaoXSD: TTissAnsVersao read FAnsVersaoxsd write setAnsVersaoxsd;

    //fonte pagadora
    property TissFontePadora: TTissIdentFontPag read FFontePagadora write SetFontePagadora;

    //VERSAO
    property Versao:TCompVersao read FCompVersao write FCompVersao;
       //BENEFICIARIO
    property TissBeneficiario:TTissBenific read FTissBenific write FTissBenific;
     //DADOS CONTRATADO
    property TissContratado:TTissContratado read FTissContratado write FTissContratado;
    //Profissional executante
    property TissProfissional:TTissProfissional read FTissProfissional write FTissProfissional;
    //identificação Executante
    property TissPrestadorExec:TTissContratado read FTissPrestExec write FTissPrestExec;


    //CABEÇALHO
    property Tisscabecalho: TTissCabecalho read FTissCabecalho write FTissCabecalho;
      //identificação Guia
    property TissDataEmis:TDateTime read FDataEmis write setDataEmis;

    property TissNumGuiaPrest:String read FNumGuiaPrest write setNumGuiaPrest;
    property TissNumGuiaOper:String read FNumGuiaOper write setNumGuiaOper;

      //dados Autorização
    property TissDataAut:TDateTime read FDataAut write setDataAut;
    property TissSenhaAut:String read FSenhaAut write setSenhaAut;
    property TissSenhaValid:TDateTime read FSenhaValid write setSenhaValid;

    //carater internação
    property TisscaraterAtend:String read FcaraAtend write setcaraAtend;
    //Acomodacao
    property Tissacomodacao:String read Facomodacao write setacomodacao;

    //Data hora Internação
    property TissDataHoraInt: TDateTime read FDataHoraInt write setDataHoraInt;
    //Data hora Saida Interação
    property TissDataHoraSaidaInt: TDateTime read FDataHoraSaidaInt write setDataHoraSaidaInt;
    //Tipo Internação
    property TissTipoInternacao:Integer read FTipoInternacao write setTipoInternacao;
    //Internacao Obstetrica
    property TissInternacaoObstetrica: TTissInternacaoObstetrica read FTissInternacaoObstetrica write setTissInternacaoObstetrica;
    //Regime internação
    property TissRegInt:String read FRegInt write setRegInt;
    //Diagnóstico Saída Internação
    property TissDiagSaidInt: TDiagSaidInt read FDiagSaidInt write FDiagSaidInt;
    //Procedimentos realizados
    property TissProc:TTissSPProcedimentos read FTissSPProcedimentos write FTissSPProcedimentos;
    //Tipo Faturamento
    property TissTipoFat:String read FTipoFat write setTipoFat;
    //numero guia Solicitacao
    property TissNumGuiaSolic:String read FNumGuiaSolic write setNumGuiaSolic;
    //Carater Internação
    property TissCarcInt:String read FCarcInt write setCarcInt;
    //OpmUtilizada
    property TissOpmUti:TTissOpmUti read FTissOpmUti write FTissOpmUti;
    //Despesas
    property TissOutDesp:TTissOutrasDesp read FTissOutrasDesp write FTissOutrasDesp;
    //Configuracoes
    property TissConfig:TTissConfInt read FTissConf write FTissConf;
    //Validação
    property TissValid: TTissValidacao read FTissValid write FTissValid;
    property TissObservacao: String read FObservacao write setObservacao; 

  end;

procedure Register;

implementation

uses md52, Md5Tiss, untValida, untFunc;


procedure Register;
begin
  RegisterComponents('Tiss', [TTissInternacao]);
end;

{ TTissInternacao }

procedure TTissInternacao.AdicionaOPM;
begin
  Try
    FOPM.Add('<ansTISS:identificacaoOPM>');
    FOPM.Add('<ansTISS:OPM>');

    with FTissConf.TissOPM do
      begin
        if TissCodigo then
          FOPM.Add ('<ansTISS:codigo>' + TissOPMuti.TissOPM.TissTabOPM.TissCodigo + '</ansTISS:codigo>');

        if TissTipTab then
          FOPM.Add ('<ansTISS:tipoTabela>' + RetZero (TissOPMuti.TissOPM.TissTabOPM.TissTipTab, 2) + '</ansTISS:tipoTabela>');

        if TissDescricao then;
          FOPM.Add ('<ansTISS:descricao>' + TissOPMuti.TissOPM.TissTabOPM.TissDescricao + '</ansTISS:descricao>');

        FOPM.Add('</ansTISS:OPM>');

        if TissQtde then
          FOPM.add ('<ansTISS:quantidade>' + CurrToStr (TissOPMuti.TissOPM.TissQtde) + '</ansTISS:quantidade>');

        if TissCodBar then
          FOPM.add ('<ansTISS:codigoBarra>' + TissOPMuti.TissOPM.TissCodBar + '</ansTISS:codigoBarra>');

        if TissVlrUnt then
          FOPM.add ('<ansTISS:valorUnitario>' + CurrToStr (TissOPMuti.TissOPM.TissVlrUn) + '</ansTISS:valorUnitario>');

        if TissVlrTot then
          FOPM.add ('<ansTISS:valorTotal>' + CurrToStr (TissOPMuti.TissOPM.TissVlrTot) + '</ansTISS:valorTotal>');
      end;

    FOPM.Add('</ansTISS:identificacaoOPM>');

  Except on e: Exception do
    begin
      Application.MessageBox (PChar ('Erro ao adicionar OPM: ' + #13 + e.Message), 'ATENÇÃO', MB_OK+MB_ICONERROR);
    end;
  end;
end;


procedure TTissInternacao.adicionaOutDesp;
begin
    try
      FOutDesp.Add('<ansTISS:despesa>');

      with FTissConf.TissOutDesp do
      begin
        FOutDesp.Add('<ansTISS:identificadorDespesa>');
          if TissTipoDesp then
            FOutDesp.Add('<ansTISS:codigo>'+TissOutDesp.TissDespesa.TissIdentCodigo+'</ansTISS:codigo>');
          if TissIdentTipTab then
            //FOutDesp.Add('<ansTISS:tipoTabela>'+TissOutDesp.TissDespesa.TissIdentTipoTab+'</ansTISS:tipoTabela>');
            FOutDesp.Add('<ansTISS:tipoTabela>'+RetZero(TissOutDesp.TissDespesa.TissIdentTipoTab,2)+'</ansTISS:tipoTabela>');
          if TissIdentDesc then
            FOutDesp.Add('<ansTISS:descricao>'+TissOutDesp.TissDespesa.TissIdentDesc+'</ansTISS:descricao>');
        FOutDesp.Add('</ansTISS:identificadorDespesa>');

        if TissTipoDesp then
          FOutDesp.add('<ansTISS:tipoDespesa>'+IntToStr(TissOutDesp.TissDespesa.TissTipDespesa)+'</ansTISS:tipoDespesa>');

        if TissDTRealizacao then
          begin
            if ansVersaoXSD = v2_01_03 then
              FOutDesp.add('<ansTISS:dataRealizacao>'+FormatDateTime('DD/MM/YYYY',TissOutDesp.TissDespesa.TissDataReal)+'</ansTISS:dataRealizacao>')
            else
              FOutDesp.add('<ansTISS:dataRealizacao>'+FormatDateTime('YYYY-MM-DD',TissOutDesp.TissDespesa.TissDataReal)+'</ansTISS:dataRealizacao>');
          end;

        if TissHSInicial then
          begin
            if ansVersaoXSD = v2_01_03 then
              FOutDesp.add('<ansTISS:horaInicial>'+FormatDateTime('hh:mm',TissOutDesp.TissDespesa.TissHoraInicial)+'</ansTISS:horaInicial>')
            else
              FOutDesp.add('<ansTISS:horaInicial>'+FormatDateTime('hh:mm:ss',TissOutDesp.TissDespesa.TissHoraInicial)+'</ansTISS:horaInicial>');
          end;

        if TissHSFinal then
          begin
            if ansVersaoXSD = v2_01_03 then
              FOutDesp.add('<ansTISS:horaFinal>'+FormatDateTime('hh:mm',TissOutDesp.TissDespesa.TissHoraFinal)+'</ansTISS:horaFinal>')
            else
              FOutDesp.add('<ansTISS:horaFinal>'+FormatDateTime('hh:mm:ss',TissOutDesp.TissDespesa.TissHoraFinal)+'</ansTISS:horaFinal>');
          end;


        if TissReducAcres then
          FOutDesp.add('<ansTISS:reducaoAcrescimo>'+CurrToStr(TissOutDesp.TissDespesa.TissredAcres)+'</ansTISS:reducaoAcrescimo>');

        if TissQtde then
          FOutDesp.add('<ansTISS:quantidade>'+CurrToStr(TissOutDesp.TissDespesa.TissQtde)+'</ansTISS:quantidade>');

        if TissVlrUnt then
          FOutDesp.add('<ansTISS:valorUnitario>'+CurrToStr(TissOutDesp.TissDespesa.TissVlrUn)+'</ansTISS:valorUnitario>');

        if TissTotalGeral then
          FOutDesp.add('<ansTISS:valorTotal>'+CurrToStr(TissOutDesp.TissDespesa.TissVlrTot)+'</ansTISS:valorTotal>');

      end;

      FOutDesp.Add('</ansTISS:despesa>');

    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao adicionar procedimento:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;
end;


procedure TTissInternacao.adicionaProc;
var
  i: Integer;
begin
    try
      FProc.Add('<ansTISS:procedimentos>');

      if FTissConf.TissProc.TissUsarEquipe then
        begin
          FProc.Add('<ansTISS:equipe>');
            for i:= 0 to FMembEquipe.Count - 1 do
              begin
                FProc.Add(FMembEquipe.Strings[i]);
              end;
          FProc.Add('</ansTISS:equipe>');
        end;

      FProc.Add('<ansTISS:procedimento>');
      if FTissConf.TissProc.TissProcs.TissCodigo then
        FProc.Add('<ansTISS:codigo>'+TissProc.TissProcs.TissCodigo+'</ansTISS:codigo>');
      if FTissConf.TissProc.TissProcs.TissTipTabela then
        FProc.Add('<ansTISS:tipoTabela>'+FormatFloat('00', TissProc.TissProcs.TissTipTabela)+'</ansTISS:tipoTabela>');
      if FTissConf.TissProc.TissProcs.TissDescricao then
        FProc.Add('<ansTISS:descricao>'+TissProc.TissProcs.TissDescricao+'</ansTISS:descricao>');


      FProc.Add('</ansTISS:procedimento>');
      if FTissConf.TissProc.TissData then
        begin
          if ansVersaoXSD = v2_01_03 then
            FProc.add('<ansTISS:data>'+FormatDateTime('DD/MM/YYYY',TissProc.TissData)+'</ansTISS:data>')
          else
            FProc.add('<ansTISS:data>'+FormatDateTime('YYYY-MM-DD',TissProc.TissData)+'</ansTISS:data>');
        end;
      if FTissConf.TissProc.TissHsInicio then
        begin
          if ansVersaoXSD = v2_01_03 then
            FProc.add('<ansTISS:horaInicio>'+FormatDateTime('hh:mm',TissProc.TissHsInicio)+'</ansTISS:horaInicio>')
          else
            FProc.add('<ansTISS:horaInicio>'+FormatDateTime('hh:mm:ss',TissProc.TissHsInicio)+'</ansTISS:horaInicio>');
        end;
      if FTissConf.TissProc.TissHsFim then
        begin
          if ansVersaoXSD = v2_01_03 then
            FProc.add('<ansTISS:horaFim>'+FormatDateTime('hh:mm',TissProc.TissHsFim)+'</ansTISS:horaFim>')
          else
            FProc.add('<ansTISS:horaFim>'+FormatDateTime('hh:mm:ss',TissProc.TissHsFim)+'</ansTISS:horaFim>');
        end;
      if FTissConf.TissProc.TissQtde then
        FProc.add('<ansTISS:quantidadeRealizada>'+CurrToStr(TissProc.TissQtde)+'</ansTISS:quantidadeRealizada>');
      if FTissConf.TissProc.TissVdeAcesso then
        FProc.Add('<ansTISS:viaAcesso>'+TissProc.TissVdeAcesso+'</ansTISS:viaAcesso>');
      if FTissConf.TissProc.TissTecUtil then
        FProc.Add('<ansTISS:tecnicaUtilizada>'+TissProc.TissTecUtil+'</ansTISS:tecnicaUtilizada>');
      if FTissConf.TissProc.TissReducAcres then
        FProc.Add('<ansTISS:reducaoAcrescimo>'+CurrToStr(TissProc.TissReducAcres)+'</ansTISS:reducaoAcrescimo>');
      if FTissConf.TissProc.TissValor then
        FProc.Add('<ansTISS:valor>'+CurrToStr(TissProc.TissValor)+'</ansTISS:valor>');
      if FTissConf.TissProc.TissValorTotal then
        FProc.Add('<ansTISS:valorTotal>'+CurrToStr(TissProc.TissValorTotal)+'</ansTISS:valorTotal>');


      FProc.Add('</ansTISS:procedimentos>');
      FMembEquipe.Clear;
    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao adicionar procedimento:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;
end;
procedure TTissInternacao.adicionaProf;
begin
  if FTissConf.TissProc.TissUsarEquipe then
    begin
      FMembEquipe.Add('<ansTISS:membroEquipe>');
        if FTissConf.TissProc.TissEquipe.TissCodProf then
          begin
            FMembEquipe.Add('<ansTISS:codigoProfissional>');
              if FTissConf.TissProc.TissEquipe.TissTipoMemb then
                begin
                  //if TissProc.TissEquipe.TissTipoMemb = JuridicoGeral then
                  //  FMembEquipe.Add('<ansTISS:CNPJ>'+TissProc.TissEquipe.TissCodProf+'</ansTISS:CNPJ>');
                  if TissProc.TissEquipe.TissTipoMemb = FisicGeral then
                    FMembEquipe.Add('<ansTISS:cpf>'+TissProc.TissEquipe.TissCodProf+'</ansTISS:cpf>');
                  if TissProc.TissEquipe.TissTipoMemb = Outros then
                    FMembEquipe.Add('<ansTISS:codigoPrestadorNaOperadora>'+TissProc.TissEquipe.TissCodProf+'</ansTISS:codigoPrestadorNaOperadora>');
//----------->adcionei aqui SP/SADT e Internação
                  if TissProc.TissEquipe.TissTipoMemb = conselhoProfissional then
                    begin
                      FMembEquipe.Add('<ansTISS:conselhoProfissional>');
                      FMembEquipe.Add('<ansTISS:siglaConselho>'+TissProc.TissEquipe.TissProfiss.TissSiglaConselho+'</ansTISS:siglaConselho>');
                      FMembEquipe.Add('<ansTISS:numeroConselho>'+TissProc.TissEquipe.TissProfiss.TissNumConselho+'</ansTISS:numeroConselho>');
                      FMembEquipe.Add('<ansTISS:ufConselho>'+TissProc.TissEquipe.TissProfiss.TissUFConselho+'</ansTISS:ufConselho>');
                      FMembEquipe.Add('</ansTISS:conselhoProfissional>');
                    end;
//----------------------->

                end;
            FMembEquipe.Add('</ansTISS:codigoProfissional>');
          end;


        FMembEquipe.Add('<ansTISS:identificacaoProfissional>');
          if FTissConf.TissProc.TissEquipe.TissProfiss.TissProf then
            FMembEquipe.Add('<ansTISS:nomeExecutante>'+TissProc.TissEquipe.TissProfiss.TissProf+'</ansTISS:nomeExecutante>');

            FMembEquipe.Add('<ansTISS:conselhoProfissional>');
                if FTissConf.TissProc.TissEquipe.TissProfiss.TissSiglaConselho then
                  FMembEquipe.Add('<ansTISS:siglaConselho>'+TissProc.TissEquipe.TissProfiss.TissSiglaConselho+'</ansTISS:siglaConselho>');
                if FTissConf.TissProc.TissEquipe.TissProfiss.TissNumConselho then
                  FMembEquipe.Add('<ansTISS:numeroConselho>'+TissProc.TissEquipe.TissProfiss.TissNumConselho+'</ansTISS:numeroConselho>');
                if FTissConf.TissProc.TissEquipe.TissProfiss.TissUFConselho then
                  FMembEquipe.Add('<ansTISS:ufConselho>'+TissProc.TissEquipe.TissProfiss.TissUFConselho+'</ansTISS:ufConselho>');
            FMembEquipe.Add('</ansTISS:conselhoProfissional>');
              if FTissConf.TissProc.TissEquipe.TissProfiss.TissfCBOS then
                FMembEquipe.Add('<ansTISS:codigoCBOS>'+TissProc.TissEquipe.TissProfiss.TissfCBOS+'</ansTISS:codigoCBOS>');
        FMembEquipe.Add('</ansTISS:identificacaoProfissional>');
          if FTissConf.TissProc.TissEquipe.TissProfiss.TissPosicProf then
            FMembEquipe.Add('<ansTISS:posicaoProfissional>'+FormatFloat('00',TissProc.TissEquipe.TissProfiss.TissPosicProf)+'</ansTISS:posicaoProfissional>');

      FMembEquipe.Add('</ansTISS:membroEquipe>');
  end;
 
end;

procedure TTissInternacao.adicionarGuia;
var
  i : Integer;
begin
    try
      FGuia.add('<ansTISS:guiaResumoInternacao>');

        FGuia.add('<ansTISS:identificacaoGuiaInternacao>');
        if (FAnsVersaoxsd <> v2_01_03) then
        begin
          FGuia.Add('<ansTISS:identificacaoFontePagadora>');
          case FTissConf.PadraoTipFontPg of
            RegistroANS: FGuia.add('<ansTISS:registroANS>'+FFontePagadora.TissRegAns+'</ansTISS:registroANS>');
            CNPJ: FGuia.add('<ansTISS:cnpjFontePagadora>'+FFontePagadora.TissCnpj+'</ansTISS:cnpjFontePagadora>');
          end;
          FGuia.add('</ansTISS:identificacaoFontePagadora>');
        end else begin
          if FTissConf.TissRegANS then
            FGuia.add('<ansTISS:registroANS>'+FFontePagadora.TissRegAns+'</ansTISS:registroANS>');
        end;
        if ansVersaoXSD = v2_01_03 then
          FGuia.add('<ansTISS:dataEmissaoGuia>'+FormatDateTime('DD/MM/YYYY', FDataEmis)+'</ansTISS:dataEmissaoGuia>')
        else
          FGuia.add('<ansTISS:dataEmissaoGuia>'+FormatDateTime('YYYY-MM-DD', FDataEmis)+'</ansTISS:dataEmissaoGuia>');

        if FTissConf.TissNumGuiaPrest then
          FGuia.add('<ansTISS:numeroGuiaPrestador>'+FNumGuiaPrest+'</ansTISS:numeroGuiaPrestador>');
        if FTissConf.TissNumGuiaOper then
          FGuia.add('<ansTISS:numeroGuiaOperadora>'+FNumGuiaOper+'</ansTISS:numeroGuiaOperadora>');

        FGuia.add('</ansTISS:identificacaoGuiaInternacao>');
          if FTissConf.TissNumGuiaSolic then
            FGuia.add('<ansTISS:numeroGuiaSolicitacao>'+FNumGuiaSolic+'</ansTISS:numeroGuiaSolicitacao>');

            FGuia.add('<ansTISS:dadosBeneficiario>');
              if FTissConf.TissBenefic.TissNumCarteira then
                FGuia.add('<ansTISS:numeroCarteira>'+FTissBenific.TissNumCarteira+'</ansTISS:numeroCarteira>');
              if FTissConf.TissBenefic.TissBenific then
                FGuia.add('<ansTISS:nomeBeneficiario>'+FTissBenific.TissBenific+'</ansTISS:nomeBeneficiario>');
              if FTissConf.TissBenefic.TissNomePlano then
                FGuia.add('<ansTISS:nomePlano>'+FTissBenific.TissNomePlano+'</ansTISS:nomePlano>');
              if FTissConf.TissBenefic.TissValidadeCart then
                begin
                  if ansVersaoXSD = v2_01_03 then
                    FGuia.add('<ansTISS:validadeCarteira>'+FormatDateTime('DD/MM/YYYY',FTissBenific.TissValidadeCart)+'</ansTISS:validadeCarteira>')
                  else
                    FGuia.add('<ansTISS:validadeCarteira>'+FormatDateTime('YYYY-MM-DD',FTissBenific.TissValidadeCart)+'</ansTISS:validadeCarteira>');
                end;
              if FTissConf.TissBenefic.TissNumCNS then
                FGuia.add('<ansTISS:numeroCNS>'+FTissBenific.TissNumCNS+'</ansTISS:numeroCNS>');

            FGuia.add('</ansTISS:dadosBeneficiario>');

            FGuia.add('<ansTISS:identificacaoExecutante>');
              FGuia.add('<ansTISS:identificacao>');
                if FTissConf.TissIdentExec.TissCNPJCPF then
                  begin
                    if FTissPrestExec.TissTipoGeral = JuridicoGeral then
                      FGuia.add('<ansTISS:CNPJ>'+FTissPrestExec.TissCNPJCPF+'</ansTISS:CNPJ>');
                    if FTissPrestExec.TissTipoGeral = FisicGeral then
                      FGuia.add('<ansTISS:cpf>'+FTissPrestExec.TissCNPJCPF+'</ansTISS:cpf>');
                    if FTissPrestExec.TissTipoGeral = Outros then
                      FGuia.add('<ansTISS:codigoPrestadorNaOperadora>'+FTissPrestExec.TissCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
                  end;
              FGuia.add('</ansTISS:identificacao>');
              FGuia.add('<ansTISS:nomeContratado>'+FTissPrestExec.TissNomeContradado+'</ansTISS:nomeContratado>');

              if FTissConf.TissContratado.TissUsarEnd then
                begin
                  FGuia.add('<ansTISS:enderecoContratado>');
                    if FTissConf.TissIdentExec.TisstipoLogradouro then
                      FGuia.add('<ansTISS:tipoLogradouro>'+FTissPrestExec.TisstipoLogradouro+'</ansTISS:tipoLogradouro>');
                    if FTissConf.TissIdentExec.TissLogradouro then
                      FGuia.add('<ansTISS:logradouro>'+FTissPrestExec.TisstipoLogradouro+'</ansTISS:logradouro>');
                    if FTissConf.TissIdentExec.TissEndNum then
                      FGuia.add('<ansTISS:numero>'+FTissPrestExec.TissEndNum+'</ansTISS:numero>');
                    if FTissConf.TissIdentExec.TissComplemento then
                      FGuia.add('<ansTISS:complemento>'+FTissPrestExec.TissComplemento+'</ansTISS:complemento>');
                    if FTissConf.TissIdentExec.TisscodigoIBGE then
                      FGuia.add('<ansTISS:codigoIBGEMunicipio>'+FormatFloat('0000000',FTissPrestExec.TisscodigoIBGE)+'</ansTISS:codigoIBGEMunicipio>');
                    if FTissConf.TissIdentExec.TissMunicipio then
                      FGuia.add('<ansTISS:municipio>'+FTissPrestExec.TissMunicipio+'</ansTISS:municipio>');
                    if FTissConf.TissIdentExec.TissUF then
                      FGuia.add('<ansTISS:codigoUF>'+FTissPrestExec.TissUF+'</ansTISS:codigoUF>');
                    if FTissConf.TissIdentExec.TissCEP then
                      FGuia.add('<ansTISS:cep>'+FTissPrestExec.TissCEP+'</ansTISS:cep>');
                  FGuia.add('</ansTISS:enderecoContratado>');
                end;
            FGuia.add('</ansTISS:identificacaoExecutante>');

            if  FTissConf.TissUsarDadAut then
              begin
                FGuia.add('<ansTISS:dadosAutorizacao>');
                    if FTissConf.TissDataAut then
                      begin
                        if ansVersaoXSD = v2_01_03 then
                          FGuia.add('<ansTISS:dataAutorizacao>'+FormatDateTime('DD/MM/YYYY',FDataAut)+'</ansTISS:dataAutorizacao>')
                        else
                          FGuia.add('<ansTISS:dataAutorizacao>'+FormatDateTime('YYYY-MM-DD',FDataAut)+'</ansTISS:dataAutorizacao>');
                      end;
                    if FTissConf.TissSenhaAut then
                      FGuia.add('<ansTISS:senhaAutorizacao>'+FSenhaAut+'</ansTISS:senhaAutorizacao>');
                    if FTissConf.TissSenhaValid then
                      begin
                        if ansVersaoXSD = v2_01_03 then
                          FGuia.add('<ansTISS:validadeSenha>'+FormatDateTime('DD/MM/YYYY',FSenhaValid)+'</ansTISS:validadeSenha>')
                        else
                          FGuia.add('<ansTISS:validadeSenha>'+FormatDateTime('YYYY-MM-DD',FSenhaValid)+'</ansTISS:validadeSenha>');
                      end;
                FGuia.add('</ansTISS:dadosAutorizacao>');
              end;
            if FTissConf.TisscaraterInt then
              FGuia.add('<ansTISS:caraterInternacao>'+FcaraAtend+'</ansTISS:caraterInternacao>');
            if FTissConf.TissAcomod then
              FGuia.add('<ansTISS:acomodacao>'+Facomodacao+'</ansTISS:acomodacao>');
            if FTissConf.TissDataInt then
              begin
                if ansVersaoXSD = v2_01_03 then
                  FGuia.add('<ansTISS:dataHoraInternacao>'+FormatDateTime('DD/MM/YYYY',FDataHoraInt)+'H'+FormatDateTime('hh:mm',FDataHoraInt)+'</ansTISS:dataHoraInternacao>')
                else
                  FGuia.add('<ansTISS:dataHoraInternacao>'+FormatDateTime('YYYY-MM-DD',FDataHoraInt)+'T'+FormatDateTime('hh:mm:ss',FDataHoraInt)+'</ansTISS:dataHoraInternacao>');
              end;

            if FTissConf.TissDataSaidInt then
              begin
                if  ansVersaoXSD = v2_01_03 then
                  FGuia.add('<ansTISS:dataHoraSaidaInternacao>'+FormatDateTime('DD/MM/YYYY',FDataHoraSaidaInt)+'H'+FormatDateTime('hh:mm',FDataHoraSaidaInt)+'</ansTISS:dataHoraSaidaInternacao>')
                else
                  FGuia.add('<ansTISS:dataHoraSaidaInternacao>'+FormatDateTime('YYYY-MM-DD',FDataHoraSaidaInt)+'T'+FormatDateTime('hh:mm:ss',FDataHoraSaidaInt)+'</ansTISS:dataHoraSaidaInternacao>');
              end;
            if FTissConf.TissTipoInt then
              FGuia.add('<ansTISS:tipoInternacao>'+IntToStr(FTipoInternacao)+'</ansTISS:tipoInternacao>');
            if FTissConf.TissRegInt then
              FGuia.add('<ansTISS:regimeInternacao>'+FRegInt+'</ansTISS:regimeInternacao>');

            if FTissConf.TissUsarInternacaoObstetrica then
            begin
              FGuia.add('<ansTISS:internacaoObstetrica>');
                FGuia.add('<ansTISS:emGestacao>'+BooleanToStr(FTissInternacaoObstetrica.TissEmGestacao)+'</ansTISS:emGestacao>');
                FGuia.add('<ansTISS:aborto>'+BooleanToStr(FTissInternacaoObstetrica.TissAborto)+'</ansTISS:aborto>');
                FGuia.add('<ansTISS:transtornoMaternoRelGravidez>'+BooleanToStr(FTissInternacaoObstetrica.TissTranstornoMaternoRelGravidez)+'</ansTISS:transtornoMaternoRelGravidez>');
                FGuia.add('<ansTISS:complicacaoPeriodoPuerperio>'+BooleanToStr(FTissInternacaoObstetrica.TissComplicacaoPeriodoPuerperio)+'</ansTISS:complicacaoPeriodoPuerperio>');
                FGuia.add('<ansTISS:atendimentoRNSalaParto>'+BooleanToStr(FTissInternacaoObstetrica.TissAtendimentoRNSalaParto)+'</ansTISS:atendimentoRNSalaParto>');
                FGuia.add('<ansTISS:complicacaoNeonatal>'+BooleanToStr(FTissInternacaoObstetrica.TissComplicacaoNeonatal)+'</ansTISS:complicacaoNeonatal>');
                FGuia.add('<ansTISS:baixoPeso>'+BooleanToStr(FTissInternacaoObstetrica.TissBaixoPeso)+'</ansTISS:baixoPeso>');
                FGuia.add('<ansTISS:partoCesareo>'+BooleanToStr(FTissInternacaoObstetrica.TissPartoCesareo)+'</ansTISS:partoCesareo>');
                FGuia.add('<ansTISS:partoNormal>'+BooleanToStr(FTissInternacaoObstetrica.TissPartoNormal)+'</ansTISS:partoNormal>');

                if FNumeroDN.Count > 0 then
                begin
                  FGuia.add('<ansTISS:declaracoesNascidosVivos>');
                    for i := 0 to FNumeroDN.Count - 1 do
                    begin
                      FGuia.add(FNumeroDN.Strings[i]);
                    end;
                  FGuia.add('</ansTISS:declaracoesNascidosVivos>');
                end;

                FGuia.add('<ansTISS:qtdNascidosVivosTermo>'+IntToStr(FTissInternacaoObstetrica.TissQtdNascidosVivosTermo)+'</ansTISS:qtdNascidosVivosTermo>');
                FGuia.add('<ansTISS:qtdNascidosMortos>'+IntToStr(FTissInternacaoObstetrica.TissQtdNascidosMortos)+'</ansTISS:qtdNascidosMortos>');
                FGuia.add('<ansTISS:qtdVivosPrematuros>'+IntToStr(FTissInternacaoObstetrica.TissQtdVivosPrematuros)+'</ansTISS:qtdVivosPrematuros>');

                if (FTissInternacaoObstetrica.TissObitoMulher = '1') or
                   (FTissInternacaoObstetrica.TissObitoMulher = '2') or
                   (FTissInternacaoObstetrica.TissObitoMulher = '3') then
                  FGuia.add('<ansTISS:obitoMulher>'+FTissInternacaoObstetrica.TissObitoMulher+'</ansTISS:obitoMulher>');
                  
              FGuia.Add('</ansTISS:internacaoObstetrica>');

              if (FTissInternacaoObstetrica.TissQtdeobitoPrecoce <> 0) or
                 (FTissInternacaoObstetrica.TissQtdeobitoTardio <> 0) then
              begin
                FGuia.add('<ansTISS:obitoNeonatal>');

                if (FTissInternacaoObstetrica.TissQtdeobitoPrecoce <> 0) then
                  FGuia.add('<ansTISS:qtdeobitoPrecoce>'+IntToStr(FTissInternacaoObstetrica.TissQtdeobitoPrecoce)+'</ansTISS:qtdeobitoPrecoce>');

                if (FTissInternacaoObstetrica.TissQtdeobitoTardio <> 0) then
                  FGuia.add('<ansTISS:qtdeobitoTardio>'+IntToStr(FTissInternacaoObstetrica.TissQtdeobitoTardio)+'</ansTISS:qtdeobitoTardio>');
                  
                FGuia.add('</ansTISS:obitoNeonatal>');
              end;
            end;


            FGuia.add('<ansTISS:diagnosticosSaidaInternacao>');

              FGuia.add('<ansTISS:diagnosticoPrincipal>');
                if FTissConf.TissDiagnostico.TissCIDNomeTab then
                  FGuia.add('<ansTISS:nomeTabela>'+FDiagSaidInt.TissDiagPrinc.TissCIDNomeTab+'</ansTISS:nomeTabela>');
                if FTissConf.TissDiagnostico.TissCIDCodDiag then
                  FGuia.add('<ansTISS:codigoDiagnostico>'+FDiagSaidInt.TissDiagPrinc.TissCIDCodDiag+'</ansTISS:codigoDiagnostico>');
                if FTissConf.TissDiagnostico.TissCIDDescDiag then
                  FGuia.add('<ansTISS:descricaoDiagnostico>'+FDiagSaidInt.TissDiagPrinc.TissCIDDescDiag+'</ansTISS:descricaoDiagnostico>');
              FGuia.add('</ansTISS:diagnosticoPrincipal>');

              if FTissConf.TissDiagSaidaInt.TissIndicAcid then
                FGuia.add('<ansTISS:indicadorAcidente>'+IntToStr(FDiagSaidInt.TissIndicAcid)+'</ansTISS:indicadorAcidente>');

              if FTissConf.TissDiagSaidaInt.TissDiagSec then
                begin
                  FGuia.add('<ansTISS:diagnosticosSecundarios>');
                    FGuia.add('<ansTISS:CID>');
                      FGuia.add('<ansTISS:nomeTabela>'+FDiagSaidInt.TissDiagSec.TissCIDNomeTab+'</ansTISS:nomeTabela>');
                      FGuia.add('<ansTISS:codigoDiagnostico>'+FDiagSaidInt.TissDiagSec.TissCIDCodDiag+'</ansTISS:codigoDiagnostico>');
                      FGuia.add('<ansTISS:descricaoDiagnostico>'+FDiagSaidInt.TissDiagSec.TissCIDDescDiag+'</ansTISS:descricaoDiagnostico>');
                    FGuia.add('</ansTISS:CID>');
                  FGuia.add('</ansTISS:diagnosticosSecundarios>');
                end;

              if FTissConf.TissDiagSaidaInt.TissMotSaidInt then
                FGuia.add('<ansTISS:motivoSaidaInternacao>'+FDiagSaidInt.TissMotSaidInt+'</ansTISS:motivoSaidaInternacao>');

              if FTissConf.TissDiagSaidaInt.TissObito then
                begin
                  FGuia.add('<ansTISS:obito>');
                    FGuia.add('<ansTISS:CID>');
                      FGuia.add('<ansTISS:nomeTabela>'+FDiagSaidInt.TissObito.TissCID.TissCIDNomeTab+'</ansTISS:nomeTabela>');
                      FGuia.add('<ansTISS:codigoDiagnostico>'+FDiagSaidInt.TissObito.TissCID.TissCIDCodDiag+'</ansTISS:codigoDiagnostico>');
                      FGuia.add('<ansTISS:descricaoDiagnostico>'+FDiagSaidInt.TissObito.TissCID.TissCIDDescDiag+'</ansTISS:descricaoDiagnostico>');
                    FGuia.add('</ansTISS:CID>');
                    FGuia.add('<ansTISS:numeroDeclaracao>'+FDiagSaidInt.TissObito.TissnumeracaoDe+'</ansTISS:numeroDeclaracao>');
                  FGuia.add('</ansTISS:obito>');
                end;

            FGuia.add('</ansTISS:diagnosticosSaidaInternacao>');

            {WLF - Estou colocando essa informação junto da chamada da lista de procedimentos no
             métodos finalizaGuia}
//          if TissConfig.TissUsarProc then
//            FGuia.add('<ansTISS:procedimentosRealizados>');
     // FGuia.add('</ansTISS:guiaSP_SADT>');
    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao criar Guia;'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;
end;

constructor TTissInternacao.create(Aowner: TComponent);
begin
  inherited;
  FTissCabecalho := TTissCabecalho.create;
  FTissBenific := TTissBenific.create;
  FTissContratado := TTissContratado.create;
  FTissInternacaoObstetrica := TTissInternacaoObstetrica.Create;
  FTissProfissional := TTissProfissional.create;
  FTissPrestExec := TTissContratado.create;
  FDiagSaidInt := TDiagSaidInt.create;
  FTissSPProcedimentos := TTissSPProcedimentos.create;
  FTissOpmUti := TTissOpmUti.create;
  FTissOutrasDesp := TTissOutrasDesp.create;
  FCompVersao := TCompVersao.create;
  FTissConf := TTissConfInt.create;
  FTissValid := TTissValidacao.create;
  FFontePagadora := TTissIdentFontPag.Create;
  FAnsVersaoxsd := v2_02_03;

end;

procedure TTissInternacao.criaCabecalho;
begin
  DecimalSeparator := '.';
  if Trim(FTissCabecalho.TissArquivo) = '' then
    begin
      Application.MessageBox('Informe o arquivo xml a ser criado!!!','ATENÇÃO',MB_OK+MB_ICONEXCLAMATION);
      Abort;
    end;
    try
      FCabecalho.Add('<?xml version="'+FTissCabecalho.TissVersaoXml+'" encoding="'+FTissCabecalho.TissEncoding+'" ?>');

      FCabecalho.Add('<ansTISS:mensagemTISS '+FTissCabecalho.TissMensagemTissXml+'>');
      FCabecalho.Add('<ansTISS:cabecalho>');
    //TAG IDENTIFICAÇÃO DA TRANSAÇÃO
      FCabecalho.Add('<ansTISS:identificacaoTransacao>');
      FCabecalho.Add('<ansTISS:tipoTransacao>'+FTissCabecalho.TissTipoTrans+'</ansTISS:tipoTransacao>');

      FCabecalho.Add('<ansTISS:sequencialTransacao>'+FTissCabecalho.TissSequencialTrans+'</ansTISS:sequencialTransacao>');

      if ansVersaoXSD = v2_01_03 then
      begin
        FCabecalho.Add('<ansTISS:dataRegistroTransacao>'+FormatDateTime('DD/MM/YYYY',FTissCabecalho.TissDataRegistroTrans)+'</ansTISS:dataRegistroTransacao>');
        FCabecalho.Add('<ansTISS:horaRegistroTransacao>'+FormatDateTime('hh:mm',FTissCabecalho.TissHoraRegistroTrans)+'</ansTISS:horaRegistroTransacao>');
      end else begin
        FCabecalho.Add('<ansTISS:dataRegistroTransacao>'+FormatDateTime('YYYY-MM-DD',FTissCabecalho.TissDataRegistroTrans)+'</ansTISS:dataRegistroTransacao>');
        FCabecalho.Add('<ansTISS:horaRegistroTransacao>'+FormatDateTime('hh:mm:ss',FTissCabecalho.TissHoraRegistroTrans)+'</ansTISS:horaRegistroTransacao>');
      end;
      FCabecalho.Add('</ansTISS:identificacaoTransacao>');

      //TAG ORIGEM
      FCabecalho.Add('<ansTISS:origem>');
      FCabecalho.Add('<ansTISS:codigoPrestadorNaOperadora>');
      if FTissCabecalho.TissTipoGeral = JuridicoGeral then
        FCabecalho.Add('<ansTISS:CNPJ>'+FTissCabecalho.TissCNPJCPF+'</ansTISS:CNPJ>');
      if FTissCabecalho.TissTipoGeral = FisicGeral then
        FCabecalho.Add('<ansTISS:CPF>'+FTissCabecalho.TissCNPJCPF+'</ansTISS:CPF>');
      if FTissCabecalho.TissTipoGeral = Outros then
        FCabecalho.add('<ansTISS:codigoPrestadorNaOperadora>'+FTissCabecalho.TissCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
       // mmCabecalho.Lines.Add('<ansTISS:codigoPrestadorNaOperadora>'+fdsFaturamentoREGPRESTADORA.AsString+'</ansTISS:codigoPrestadorNaOperadora>');
      FCabecalho.Add('</ansTISS:codigoPrestadorNaOperadora>');
      FCabecalho.Add('</ansTISS:origem>');
      FCabecalho.Add('<ansTISS:destino>');
      FCabecalho.Add('<ansTISS:registroANS>'+FTissCabecalho.TissRegAns+'</ansTISS:registroANS>');
      FCabecalho.Add('</ansTISS:destino>');

      FCabecalho.Add('<ansTISS:versaoPadrao>'+FTissCabecalho.TissVersaoTISS+'</ansTISS:versaoPadrao>');
      // identificacao Software Gerador
      case ansVersaoXSD of
        v2_02_02,v2_02_03:
          begin
            FCabecalho.Add('<ansTISS:identificacaoSoftwareGerador>');
            FCabecalho.Add('<ansTISS:nomeAplicativo>'+FTissCabecalho.TissNomeAplica+'</ansTISS:nomeAplicativo>');
            FCabecalho.Add('<ansTISS:versaoAplicativo>'+FTissCabecalho.TissVersaoAplica+'</ansTISS:versaoAplicativo>');
            FCabecalho.Add('<ansTISS:fabricanteAplicativo>'+FTissCabecalho.TissFabricaAplica+'</ansTISS:fabricanteAplicativo>');
            FCabecalho.Add('</ansTISS:identificacaoSoftwareGerador>');
          end;
      end;

      FCabecalho.Add('</ansTISS:cabecalho>');

      FCabecalho.Add('<ansTISS:prestadorParaOperadora>');
      FCabecalho.Add('<ansTISS:loteGuias>');
      FCabecalho.Add('<ansTISS:numeroLote>'+FTissCabecalho.TissNumLote+'</ansTISS:numeroLote>');
      FCabecalho.Add('<ansTISS:guias>');
      FCabecalho.Add('<ansTISS:guiaFaturamento>');

    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao criar cabeçalho:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;

end;

procedure TTissInternacao.finalizaGuia;
var
  arquivo,arquivoTemp: TextFile;
  numhash,linha, TissTotalGeral, TissVlrTotOpm : string;
  i: integer;
begin
    try
      for i:= 0 to FGuia.Count - 1 do
        begin
          FGeral.Add(FGuia.Strings[i]);
        end;

      if TissConfig.TissUsarProc then
        begin
          FGeral.add('<ansTISS:procedimentosRealizados>');
          for i:= 0 to FProc.Count - 1 do
            begin
              FGeral.Add(FProc.Strings[i]);
            end;

          FGeral.add('</ansTISS:procedimentosRealizados>');
        end;

      if TissConfig.TissUsarOPM then
        begin
         FGeral.Add ('<ansTISS:OPMUtilizadas>');
          FGeral.Add ('<ansTISS:OPM>');
          for i := 0 to FOPM.Count - 1 do FGeral.Add (FOPM.Strings[i]);
          TissVlrTotOpm := CurrToStr (FTissOpmUti.TissVlrTotOPM);
          FGeral.Add ('</ansTISS:OPM>');
          FGeral.Add ('<ansTISS:valorTotalOPM>' + TissVlrTotOpm + '</ansTISS:valorTotalOPM>');
          FGeral.Add ('</ansTISS:OPMUtilizadas>');
        end;

      if Tissconfig.TissUsarOutDespesas then
        begin
          FGeral.Add('<ansTISS:outrasDespesas>');
          for i := 0 to FOutDesp.Count - 1 do
            begin
              FGeral.Add(FOutDesp.Strings[i]);
            end;
//Inclusão das Tags totalGeralOutrasDespesas
          TissTotalGeral:=CurrToStr(FTissOutrasDesp.TissTotalGeral);
          FGeral.Add('<ansTISS:totalGeralOutrasDespesas>'+TissTotalGeral+'</ansTISS:totalGeralOutrasDespesas>');
          FGeral.Add('</ansTISS:outrasDespesas>')
        end;


      if FTissConf.TissTipoFat then
        FGeral.Add('<ansTISS:tipoFaturamento>'+FTipoFat+'</ansTISS:tipoFaturamento>');
      FGeral.Add('<ansTISS:valorTotal>');
      FGeral.Add('<ansTISS:servicosExecutados>'+CurrToStr(TissProc.TissValorTotalServicos)+'</ansTISS:servicosExecutados>');
      FGeral.Add('<ansTISS:diarias>'+CurrToStr(TissProc.TissValorTotalDiarias)+'</ansTISS:diarias>');
      FGeral.Add('<ansTISS:taxas>'+CurrToStr(TissProc.TissValorTotalTaxas)+'</ansTISS:taxas>');
      FGeral.Add('<ansTISS:materiais>'+CurrToStr(TissProc.TissValorTotalMateriais)+'</ansTISS:materiais>');
      FGeral.Add('<ansTISS:medicamentos>'+CurrToStr(TissProc.TissValorTotalMedicamentos)+'</ansTISS:medicamentos>');
      FGeral.Add('<ansTISS:gases>'+CurrToStr(TissProc.TissValorTotalGases)+'</ansTISS:gases>');
      FGeral.Add('<ansTISS:totalGeral>'+CurrToStr(TissProc.TissValorTotalGeral)+'</ansTISS:totalGeral>');
      FGeral.Add('</ansTISS:valorTotal>');
      if FTissConf.TissUsarObs  then
        FGeral.Add('<ansTISS:observacao>'+FObservacao+'</ansTISS:observacao>');

      FGeral.Add('</ansTISS:guiaResumoInternacao>');
      FGuia.Clear;
      FProc.Clear;
      FMembEquipe.Clear;
      FOPM.Clear;
      FOutDesp.Clear;
      FNumeroDN.Clear;
      DecimalSeparator := '.';
      //AssignFile(arquivoTemp,'temp.xml');
      //Reset(arquivoTemp);
//      CloseFile(arquivoTemp);
    except
      on e: Exception do
        begin
          DecimalSeparator := '.';
          Application.MessageBox(PChar('Erro ao acessar arquivo:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;
end;



procedure TTissInternacao.GerarXml;
var
  arquivo,arquivoTemp: TextFile;
  numhash,linha,nomearq: string;
  i: integer;
  TrocaString: TStringList;
begin
    try
      AssignFile(arquivo,FTissCabecalho.TissArquivo);
      Rewrite(arquivo);
 
      for i:= 0 to FCabecalho.Count - 1 do
        begin
          Writeln(arquivo,fcabecalho.Strings[i]);
        end;
      for i:= 0 to FGeral.Count - 1 do
        begin
          Writeln(arquivo,Fgeral.Strings[i]);
        end;

      Writeln(arquivo,'</ansTISS:guiaFaturamento>');
      Writeln(arquivo,'</ansTISS:guias>');
      Writeln(arquivo,'</ansTISS:loteGuias>');
      Writeln(arquivo,'</ansTISS:prestadorParaOperadora>');
      Writeln(arquivo,'</ansTISS:mensagemTISS>');

      CloseFile(arquivo);
      numhash := hash(FTissCabecalho.TissArquivo);
      AssignFile(arquivo,FTissCabecalho.TissArquivo);
      Rewrite(arquivo);

      FGeral.Add('</ansTISS:guiaFaturamento>');
      FGeral.Add('</ansTISS:guias>');
      FGeral.Add('</ansTISS:loteGuias>');
      FGeral.Add('</ansTISS:prestadorParaOperadora>');
      FGeral.Add('<ansTISS:epilogo>');
      FGeral.Add('<ansTISS:hash>'+numhash+'</ansTISS:hash>');
      FGeral.Add('</ansTISS:epilogo>');
      FGeral.Add('</ansTISS:mensagemTISS>');
            
      for i:= 0 to FCabecalho.Count - 1 do
        begin
          Writeln(arquivo,fcabecalho.Strings[i]);
        end;
      for i:= 0 to FGeral.Count - 1 do
        begin
          Writeln(arquivo,Fgeral.Strings[i]);
        end;
      CloseFile(arquivo);

      {Troca String <ansTISS></ansTISS> por <ans></ans>
       para as Versões 2.01.03,2.02.01}
      if (FAnsVersaoxsd <> v2_02_02) and (FAnsVersaoxsd <> v2_02_03) then
        begin
           TrocaString := TStringList.Create;
          try
            TrocaString.LoadFromFile(FTissCabecalho.TissArquivo);
            TrocaString.Text := StringReplace(TrocaString.Text,'ansTISS','ans',[rfignorecase,rfreplaceall]);
            TrocaString.SaveToFile(FTissCabecalho.TissArquivo);
          finally
            TrocaString.Free;
          end;
        end;

    //VALIDACAO
    if FTissValid.UsarValidacao then
      begin
        if Trim(FTissValid.TissXSD) = EmptyStr then
          begin
            Application.MessageBox('Para realizar a validação informe o Schema','ATENÇÃO',MB_OK+MB_ICONERROR);
            Abort;
          end
        else
          begin
            if not (FileExists(Trim(FTissValid.TissXSD))) then
              begin
                Application.MessageBox('Não foi possível encontrar o Schema para Validação','ATENÇÃO',MB_OK+MB_ICONERROR);
                Abort;
              end
          end;
        try
          Application.CreateForm(TfrmValida,frmValida);
          with frmValida do
            begin
              if FileExists(FTissCabecalho.TissArquivo) then
                begin
                  Memo1.Text := fileValidate(FTissCabecalho.TissArquivo,FTissValid.TissXSD);
                  if ( Memo1.Text = EmptyStr ) then
                  begin
                    lblInfo.Caption := MSG_ISVALID_PTBR;
                    lblInfo.Font.Color := clGreen;
                  end
                  else
                  begin
                    lblInfo.Caption := MSG_ISNTVALID_PTBR;
                    lblInfo.Font.Color := clRed;
                  end;
                end;
            end;
          frmValida.ShowModal;
        finally
          FreeAndNil(frmValida);
        end;
      end;
    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao acessar arquivo:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;        

    if TissConfig.TissCabecalho.TissArqNomeHash then
      begin
        try
          if not TissConfig.TissCabecalho.TissUsarNomeArqu then
            begin
              RenameFile(Tisscabecalho.TissArquivo,ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml');
              FTissCabecalho.TissArquivo := ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml';
            end
          else
            begin
              nomearq := copy(ExtractFileName(Tisscabecalho.TissArquivo),1,length(ExtractFileName(Tisscabecalho.TissArquivo))-4);
              RenameFile(Tisscabecalho.TissArquivo,nomearq+ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml');
              FTissCabecalho.TissArquivo := nomearq+ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml';
            end;
        except
          on e:exception do
            begin
              Application.MessageBox(Pchar('Erro ao renomear o arquivo: '+ #13+ e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
            end;
        end;
      end;
end;

function TTissInternacao.hash(arquivohash: string): String;
var
  arquivo: TextFile;
  MD5: TMD5;
  xml: TXMLDocument;
  TrocaString: TStringList;
begin
  {Troca String <ansTISS></ansTISS> por <ans></ans>
   para as Versões 2.01.03,2.02.01}
  if (FAnsVersaoxsd <> v2_02_02) and (FAnsVersaoxsd <> v2_02_03) then
    begin
       TrocaString := TStringList.Create;
      try
        TrocaString.LoadFromFile(arquivohash);
        TrocaString.Text := StringReplace(TrocaString.Text,'ansTISS','ans',[rfignorecase,rfreplaceall]);
        TrocaString.SaveToFile(arquivohash);
      finally
        TrocaString.Free;
      end;
    end;

  try
    MD5 := TMD5.Create;
    xml := TXMLDocument.Create(self);
    xml.FileName := arquivohash;
    xml.Active := True;
    Result :=LowerCase(md5.GeraHash(xml));
    xml.Active := False;
  finally
    FreeAndNil(MD5);
    FreeAndNil(xml);
  end;
end;

procedure TTissInternacao.iniciaInternacao;
begin
  DecimalSeparator := ',';
  FCabecalho := TStringList.Create;
  FGuia := TStringList.Create;
  FProc := TStringList.Create;
  FMembEquipe := TStringList.Create;
  FGeral := TStringList.Create;
  FGeral := TStringList.Create;
  FOPM := TStringList.Create;
  FOutDesp := TStringList.Create;
  FNumeroDN := TStringList.Create;
  FOPM.Clear;
  FOutDesp.Clear;
  FGeral.Clear;
  FMembEquipe.Clear;
  FProc.Clear;
  FGuia.Clear;
  FCabecalho.Clear;
  FNumeroDN.Clear;
end;

procedure TTissInternacao.setacomodacao(const Value: String);
begin
  Facomodacao := Value;
end;

procedure TTissInternacao.setAnsVersaoxsd(const Value: TTissAnsVersao);
begin
  FAnsVersaoxsd := Value;
end;

procedure TTissInternacao.setcaraAtend(const Value: String);
begin
  FcaraAtend := Value;
end;

procedure TTissInternacao.setCarcInt(const Value: String);
begin
  FCarcInt := Value;
end;

procedure TTissInternacao.setDataAut(const Value: TDateTime);
begin
  FDataAut := Value;
end;



procedure TTissInternacao.setDataHoraInt(const Value: TDateTime);
begin
  FDataHoraInt := Value;
end;

procedure TTissInternacao.setDataHoraSaidaInt(const Value: TDateTime);
begin
  FDataHoraSaidaInt := Value;
end;

procedure TTissInternacao.SetFontePagadora(const Value: TTissIdentFontPag);
begin
  FFontePagadora := Value;
end;

procedure TTissInternacao.setNumGuiaOper(const Value: String);
begin
  FNumGuiaOper := Value;
end;

procedure TTissInternacao.setNumGuiaPrest(const Value: String);
begin
  FNumGuiaPrest := Value;
end;

procedure TTissInternacao.setNumGuiaSolic(const Value: String);
begin
  FNumGuiaSolic := Value;
end;

procedure TTissInternacao.setObservacao(const Value: String);
begin
  FObservacao := Value;
end;

procedure TTissInternacao.setDataEmis(const Value: TDateTime);
begin
  FDataEmis := Value;
end;



procedure TTissInternacao.setRegInt(const Value: String);
begin
  FRegInt := Value;
end;

procedure TTissInternacao.setSenhaAut(const Value: String);
begin
  FSenhaAut := Value;
end;

procedure TTissInternacao.setSenhaValid(const Value: TDateTime);
begin
  FSenhaValid := Value;
end;


procedure TTissInternacao.setTipoFat(const Value: String);
begin
  FTipoFat := Value;
end;

procedure TTissInternacao.setTipoInternacao(const Value: Integer);
begin
  FTipoInternacao := Value;
end;

procedure TTissInternacao.ClearDespesas;
begin
  TissProc.TissValorTotalServicos := 0;
  TissProc.TissValorTotalDiarias := 0;
  TissProc.TissValorTotalTaxas := 0;
  TissProc.TissValorTotalMateriais := 0;
  TissProc.TissValorTotalMedicamentos := 0;
  TissProc.TissValorTotalGases := 0;
  FTissOutrasDesp.TissTotalGeral := 0;  
end;

procedure TTissInternacao.setTissInternacaoObstetrica(
  const Value: TTissInternacaoObstetrica);
begin
  FTissInternacaoObstetrica := Value;
end;

procedure TTissInternacao.adicionaNumeroDN;
begin
  try
    FNumeroDN.Add('<ansTISS:numeroDN>'+Trim(FTissInternacaoObstetrica.TissNumeroDN.TissNumeroDN)+'</ansTISS:numeroDN>');
  except on e: Exception do
    begin
      Application.MessageBox (PChar ('Erro ao adicionar declaração de nascidos vivos: ' + #13 + e.Message), 'ATENÇÃO', MB_OK+MB_ICONERROR);
    end;
  end;
end;

function TTissInternacao.BooleanToStr(value: Boolean): String;
begin
  if value then
    Result := 'true'
  else
    Result := 'false';
end;

end.
 
unit TissInternacao;

interface

uses
  SysUtils, Classes,untTissComp,Windows,Dialogs,Messages,forms,xmldom, XMLIntf, msxmldom,
  XMLDoc,untConfSPSADT,Graphics,untConfInt;
  {COMPONENTE INICIADO POR FABIANO DE OLIVEIRA PRADO
  Espero ter ajudado alguem com este componente, e
  espero que mais progrmadores se juntem nesta idéia
  para assim realizarmo o projeto TISS com sucesso,
  pela graça de Maria e o amor de Nosso Senhor JESUS CRISTO}  
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
    FOutDesp: TStringList;    
    FGeral: TStringList;  

    FTissCabecalho: TTissCabecalho;
    FNumGuiaOper: String;
    FNumGuiaPrest: String;
    FRegANS: String;
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
    FTipoFat: String;
    FNumGuiaSolic: String;
    FCarcInt: String;
    FTissOutrasDesp: TTissOutrasDesp;
    FTissOpmUti: TTissOpmUti;
    FCompVersao: TCompVersao;
    FTissConf: TTissConfInt;
    FTissValid: TTissValidacao;

    procedure setNumGuiaOper(const Value: String);
    procedure setNumGuiaPrest(const Value: String);
    procedure setRegANS(const Value: String);
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


    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure iniciaInternacao;
    procedure criaCabecalho;
    procedure adicionarGuia;
    procedure adicionaProc;
    procedure adicionaProf;
    procedure adicionaOutDesp;
    procedure finalizaGuia;
    procedure GerarXml;
    constructor create(Aowner: TComponent);override;
  published
    { Published declarations }

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
    property TissRegANS:String read FRegANS write setRegANS;
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
    //Despesas
    property TissOutDesp:TTissOutrasDesp read FTissOutrasDesp write FTissOutrasDesp;
    //OpmUtilizada
    property TissOpmUti:TTissOpmUti read FTissOpmUti write FTissOpmUti;

    //Configuracoes
    property TissConfig:TTissConfInt read FTissConf write FTissConf;
    //Validação
    property TissValid: TTissValidacao read FTissValid write FTissValid;    

  end;

procedure Register;

implementation

uses md52, Md5Tiss, untValida, untFunc;


procedure Register;
begin
  RegisterComponents('Tiss', [TTissInternacao]);
end;

{ TTissInternacao }

procedure TTissInternacao.adicionaOutDesp;
begin
    try
      FOutDesp.Add('<ans:despesa>');

      with FTissConf.TissOutDesp do
      begin
        FOutDesp.Add('<ans:identificadorDespesa>');
          if TissTipoDesp then
            FOutDesp.Add('<ans:codigo>'+TissOutDesp.TissDespesa.TissIdentCodigo+'</ans:codigo>');
          if TissIdentTipTab then
            FOutDesp.Add('<ans:tipoTabela>'+TissOutDesp.TissDespesa.TissIdentTipoTab+'</ans:tipoTabela>');
          if TissIdentDesc then
            FOutDesp.Add('<ans:descricao>'+TissOutDesp.TissDespesa.TissIdentDesc+'</ans:descricao>');
        FOutDesp.Add('</ans:identificadorDespesa>');

        if TissTipoDesp then
          FOutDesp.add('<ans:tipoDespesa>'+IntToStr(TissOutDesp.TissDespesa.TissTipDespesa)+'</ans:tipoDespesa>');

        if TissDTRealizacao then
          FOutDesp.add('<ans:dataRealizacao>'+FormatDateTime('YYYY-MM-DD',TissOutDesp.TissDespesa.TissDataReal)+'</ans:dataRealizacao>');
          
        if TissHSInicial then
          FOutDesp.add('<ans:horaInicial>'+FormatDateTime('hh:mm:ss',TissOutDesp.TissDespesa.TissHoraInicial)+'</ans:horaInicial>');

        if TissHSFinal then
          FOutDesp.add('<ans:horaFinal>'+FormatDateTime('hh:mm:ss',TissOutDesp.TissDespesa.TissHoraFinal)+'</ans:horaFinal>');


        if TissReducAcres then
          FOutDesp.add('<ans:reducaoAcrescimo>'+CurrToStr(TissOutDesp.TissDespesa.TissredAcres)+'</ans:reducaoAcrescimo>');

        if TissQtde then
          FOutDesp.add('<ans:quantidade>'+CurrToStr(TissOutDesp.TissDespesa.TissQtde)+'</ans:quantidade>');

        if TissVlrUnt then
          FOutDesp.add('<ans:valorUnitario>'+CurrToStr(TissOutDesp.TissDespesa.TissVlrUn)+'</ans:valorUnitario>');
        
        if TissTotalGeral then
          FOutDesp.add('<ans:valorTotal>'+CurrToStr(TissOutDesp.TissDespesa.TissVlrTot)+'</ans:valorTotal>');

      end;

      FOutDesp.Add('</ans:despesa>');

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
      FProc.Add('<ans:procedimentos>');

      if FTissConf.TissProc.TissUsarEquipe then
        begin
          FProc.Add('<ans:equipe>');
            for i:= 0 to FMembEquipe.Count - 1 do
              begin
                FProc.Add(FMembEquipe.Strings[i]);
              end;
          FProc.Add('</ans:equipe>');
        end;

      FProc.Add('<ans:procedimento>');
      if FTissConf.TissProc.TissProcs.TissCodigo then
        FProc.Add('<ans:codigo>'+TissProc.TissProcs.TissCodigo+'</ans:codigo>');
      if FTissConf.TissProc.TissProcs.TissTipTabela then
        FProc.Add('<ans:tipoTabela>'+FormatFloat('00', TissProc.TissProcs.TissTipTabela)+'</ans:tipoTabela>');
      if FTissConf.TissProc.TissProcs.TissDescricao then
        FProc.Add('<ans:descricao>'+TissProc.TissProcs.TissDescricao+'</ans:descricao>');


      FProc.Add('</ans:procedimento>');
      if FTissConf.TissProc.TissData then
        FProc.add('<ans:data>'+FormatDateTime('YYYY-MM-DD',TissProc.TissData)+'</ans:data>');
      if FTissConf.TissProc.TissHsInicio then
        FProc.add('<ans:horaInicio>'+FormatDateTime('hh:mm:ss',TissProc.TissHsInicio)+'</ans:horaInicio>');
      if FTissConf.TissProc.TissHsFim then
        FProc.add('<ans:horaFim>'+FormatDateTime('hh:mm:ss',TissProc.TissHsFim)+'</ans:horaFim>');
      if FTissConf.TissProc.TissQtde then
        FProc.add('<ans:quantidadeRealizada>'+CurrToStr(TissProc.TissQtde)+'</ans:quantidadeRealizada>');
      if FTissConf.TissProc.TissVdeAcesso then
        FProc.Add('<ans:viaAcesso>'+TissProc.TissVdeAcesso+'</ans:viaAcesso>');
      if FTissConf.TissProc.TissTecUtil then
        FProc.Add('<ans:tecnicaUtilizada>'+TissProc.TissTecUtil+'</ans:tecnicaUtilizada>');
      if FTissConf.TissProc.TissReducAcres then
        FProc.Add('<ans:reducaoAcrescimo>'+CurrToStr(TissProc.TissReducAcres)+'</ans:reducaoAcrescimo>');
      if FTissConf.TissProc.TissValor then
        FProc.Add('<ans:valor>'+CurrToStr(TissProc.TissValor)+'</ans:valor>');
      if FTissConf.TissProc.TissValorTotal then
        FProc.Add('<ans:valorTotal>'+CurrToStr(TissProc.TissValorTotal)+'</ans:valorTotal>');


      FProc.Add('</ans:procedimentos>');
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
      FMembEquipe.Add('<ans:membroEquipe>');
        if FTissConf.TissProc.TissEquipe.TissCodProf then
          begin
            FMembEquipe.Add('<ans:codigoProfissional>');
              if FTissConf.TissProc.TissEquipe.TissTipoMemb then
                begin
                  if TissProc.TissEquipe.TissTipoMemb = JuridicoGeral then
                    FMembEquipe.Add('<ans:CNPJ>'+TissProc.TissEquipe.TissCodProf+'</ans:CNPJ>');
                  if TissProc.TissEquipe.TissTipoMemb = FisicGeral then
                    FMembEquipe.Add('<ans:cpf>'+TissProc.TissEquipe.TissCodProf+'</ans:cpf>');
                  if TissProc.TissEquipe.TissTipoMemb = Outros then
                    FMembEquipe.Add('<ans:codigoPrestadorNaOperadora>'+TissProc.TissEquipe.TissCodProf+'</ans:codigoPrestadorNaOperadora>');
                end;
            FMembEquipe.Add('</ans:codigoProfissional>');
          end;


        FMembEquipe.Add('<ans:identificacaoProfissional>');
          if FTissConf.TissProc.TissEquipe.TissProfiss.TissProf then
            FMembEquipe.Add('<ans:nomeExecutante>'+TissProc.TissEquipe.TissProfiss.TissProf+'</ans:nomeExecutante>');

            FMembEquipe.Add('<ans:conselhoProfissional>');
                if FTissConf.TissProc.TissEquipe.TissProfiss.TissSiglaConselho then
                  FMembEquipe.Add('<ans:siglaConselho>'+TissProc.TissEquipe.TissProfiss.TissSiglaConselho+'</ans:siglaConselho>');
                if FTissConf.TissProc.TissEquipe.TissProfiss.TissNumConselho then
                  FMembEquipe.Add('<ans:numeroConselho>'+TissProc.TissEquipe.TissProfiss.TissNumConselho+'</ans:numeroConselho>');
                if FTissConf.TissProc.TissEquipe.TissProfiss.TissUFConselho then
                  FMembEquipe.Add('<ans:ufConselho>'+TissProc.TissEquipe.TissProfiss.TissUFConselho+'</ans:ufConselho>');
            FMembEquipe.Add('</ans:conselhoProfissional>');
              if FTissConf.TissProc.TissEquipe.TissProfiss.TissfCBOS then
                FMembEquipe.Add('<ans:codigoCBOS>'+FormatFloat('00000',TissProc.TissEquipe.TissProfiss.TissfCBOS)+'</ans:codigoCBOS>');
        FMembEquipe.Add('</ans:identificacaoProfissional>');
          if FTissConf.TissProc.TissEquipe.TissProfiss.TissPosicProf then
            FMembEquipe.Add('<ans:posicaoProfissional>'+IntToStr(TissProc.TissEquipe.TissProfiss.TissPosicProf)+'</ans:posicaoProfissional>');

      FMembEquipe.Add('</ans:membroEquipe>');
  end;
 
end;

procedure TTissInternacao.adicionarGuia;
begin
    try
      FGuia.add('<ans:guiaResumoInternacao>');

        FGuia.add('<ans:identificacaoGuiaInternacao>');
            if FTissConf.TissRegANS then
              FGuia.add('<ans:registroANS>'+FRegAns+'</ans:registroANS>');
          FGuia.add('<ans:dataEmissaoGuia>'+FormatDateTime('YYYY-MM-DD',Date)+'</ans:dataEmissaoGuia>');
            if FTissConf.TissNumGuiaPrest then
              FGuia.add('<ans:numeroGuiaPrestador>'+FNumGuiaPrest+'</ans:numeroGuiaPrestador>');
            if FTissConf.TissNumGuiaOper then
              FGuia.add('<ans:numeroGuiaOperadora>'+FNumGuiaOper+'</ans:numeroGuiaOperadora>');

        FGuia.add('</ans:identificacaoGuiaInternacao>');
          if FTissConf.TissNumGuiaSolic then
            FGuia.add('<ans:numeroGuiaSolicitacao>'+FNumGuiaSolic+'</ans:numeroGuiaSolicitacao>');

            FGuia.add('<ans:dadosBeneficiario>');
              if FTissConf.TissBenefic.TissNumCarteira then
                FGuia.add('<ans:numeroCarteira>'+FTissBenific.TissNumCarteira+'</ans:numeroCarteira>');
              if FTissConf.TissBenefic.TissBenific then
                FGuia.add('<ans:nomeBeneficiario>'+FTissBenific.TissBenific+'</ans:nomeBeneficiario>');
              if FTissConf.TissBenefic.TissNomePlano then
                FGuia.add('<ans:nomePlano>'+FTissBenific.TissNomePlano+'</ans:nomePlano>');
              if FTissConf.TissBenefic.TissValidadeCart then
                FGuia.add('<ans:validadeCarteira>'+FormatDateTime('YYYY-MM-DD',FTissBenific.TissValidadeCart)+'</ans:validadeCarteira>');
              if FTissConf.TissBenefic.TissNumCNS then
                FGuia.add('<ans:numeroCNS>'+FTissBenific.TissNumCNS+'</ans:numeroCNS>');

            FGuia.add('</ans:dadosBeneficiario>');

            FGuia.add('<ans:identificacaoExecutante>');
              FGuia.add('<ans:identificacao>');
                if FTissConf.TissIdentExec.TissCNPJCPF then
                  begin
                    if FTissPrestExec.TissTipoGeral = JuridicoGeral then
                      FGuia.add('<ans:CNPJ>'+FTissPrestExec.TissCNPJCPF+'</ans:CNPJ>');
                    if FTissPrestExec.TissTipoGeral = FisicGeral then
                      FGuia.add('<ans:cpf>'+FTissPrestExec.TissCNPJCPF+'</ans:cpf>');

                    if FTissPrestExec.TissTipoGeral = Outros then
                      FGuia.add('<ans:codigoPrestadorNaOperadora>'+FTissPrestExec.TissCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
                  end;
              FGuia.add('</ans:identificacao>');
              FGuia.add('<ans:nomeContratado>'+FTissPrestExec.TissNomeContradado+'</ans:nomeContratado>');

              if FTissConf.TissContratado.TissUsarEnd then
                begin
                  FGuia.add('<ans:enderecoContratado>');
                    if FTissConf.TissIdentExec.TisstipoLogradouro then
                      FGuia.add('<ans:tipoLogradouro>'+FTissPrestExec.TisstipoLogradouro+'</ans:tipoLogradouro>');
                    if FTissConf.TissIdentExec.TissLogradouro then
                      FGuia.add('<ans:logradouro>'+FTissPrestExec.TisstipoLogradouro+'</ans:logradouro>');
                    if FTissConf.TissIdentExec.TissEndNum then
                      FGuia.add('<ans:numero>'+FTissPrestExec.TissEndNum+'</ans:numero>');
                    if FTissConf.TissIdentExec.TissComplemento then
                      FGuia.add('<ans:complemento>'+FTissPrestExec.TissComplemento+'</ans:complemento>');
                    if FTissConf.TissIdentExec.TisscodigoIBGE then
                      FGuia.add('<ans:codigoIBGEMunicipio>'+FormatFloat('0000000',FTissPrestExec.TisscodigoIBGE)+'</ans:codigoIBGEMunicipio>');
                    if FTissConf.TissIdentExec.TissMunicipio then
                      FGuia.add('<ans:municipio>'+FTissPrestExec.TissMunicipio+'</ans:municipio>');
                    if FTissConf.TissIdentExec.TissUF then
                      FGuia.add('<ans:codigoUF>'+FTissPrestExec.TissUF+'</ans:codigoUF>');
                    if FTissConf.TissIdentExec.TissCEP then
                      FGuia.add('<ans:cep>'+FTissPrestExec.TissCEP+'</ans:cep>');
                  FGuia.add('</ans:enderecoContratado>');
                end;
            FGuia.add('</ans:identificacaoExecutante>');

            if  FTissConf.TissUsarDadAut then
              begin
                FGuia.add('<ans:dadosAutorizacao>');
                    if FTissConf.TissDataAut then
                      FGuia.add('<ans:dataAutorizacao>'+FormatDateTime('YYYY-MM-DD',FDataAut)+'</ans:dataAutorizacao>');
                    if FTissConf.TissSenhaAut then
                      FGuia.add('<ans:senhaAutorizacao>'+FSenhaAut+'</ans:senhaAutorizacao>');
                    if FTissConf.TissSenhaValid then
                      FGuia.add('<ans:validadeSenha>'+FormatDateTime('YYYY-MM-DD',FSenhaValid)+'</ans:validadeSenha>');
                FGuia.add('</ans:dadosAutorizacao>');
              end;
            if FTissConf.TisscaraterInt then
              FGuia.add('<ans:caraterInternacao>'+FcaraAtend+'</ans:caraterInternacao>');
            if FTissConf.TissAcomod then
              FGuia.add('<ans:acomodacao>'+Facomodacao+'</ans:acomodacao>');
            if FTissConf.TissDataInt then
              FGuia.add('<ans:dataHoraInternacao>'+FormatDateTime('YYYY-MM-DD',FDataHoraInt)+'T'+FormatDateTime('hh:mm:ss',FDataHoraInt)+'</ans:dataHoraInternacao>');
            if FTissConf.TissDataSaidInt then
              FGuia.add('<ans:dataHoraSaidaInternacao>'+FormatDateTime('YYYY-MM-DD',FDataHoraSaidaInt)+'T'+FormatDateTime('hh:mm:ss',FDataHoraSaidaInt)+'</ans:dataHoraSaidaInternacao>');
            if FTissConf.TissTipoInt then
              FGuia.add('<ans:tipoInternacao>'+IntToStr(FTipoInternacao)+'</ans:tipoInternacao>');
            if FTissConf.TissRegInt then
              FGuia.add('<ans:regimeInternacao>'+FRegInt+'</ans:regimeInternacao>');

            FGuia.add('<ans:diagnosticosSaidaInternacao>');

              FGuia.add('<ans:diagnosticoPrincipal>');
                if FTissConf.TissDiagnostico.TissCIDNomeTab then
                  FGuia.add('<ans:nomeTabela>'+FDiagSaidInt.TissDiagPrinc.TissCIDNomeTab+'</ans:nomeTabela>');
                if FTissConf.TissDiagnostico.TissCIDCodDiag then
                  FGuia.add('<ans:codigoDiagnostico>'+FDiagSaidInt.TissDiagPrinc.TissCIDCodDiag+'</ans:codigoDiagnostico>');
                if FTissConf.TissDiagnostico.TissCIDDescDiag then
                  FGuia.add('<ans:descricaoDiagnostico>'+FDiagSaidInt.TissDiagPrinc.TissCIDDescDiag+'</ans:descricaoDiagnostico>');
              FGuia.add('</ans:diagnosticoPrincipal>');

              if FTissConf.TissDiagSaidaInt.TissIndicAcid then
                FGuia.add('<ans:indicadorAcidente>'+IntToStr(FDiagSaidInt.TissIndicAcid)+'</ans:indicadorAcidente>');

              if FTissConf.TissDiagSaidaInt.TissDiagSec then
                begin
                  FGuia.add('<ans:diagnosticosSecundarios>');
                    FGuia.add('<ans:CID>');
                      FGuia.add('<ans:nomeTabela>'+FDiagSaidInt.TissDiagSec.TissCIDNomeTab+'</ans:nomeTabela>');
                      FGuia.add('<ans:codigoDiagnostico>'+FDiagSaidInt.TissDiagSec.TissCIDCodDiag+'</ans:codigoDiagnostico>');
                      FGuia.add('<ans:descricaoDiagnostico>'+FDiagSaidInt.TissDiagSec.TissCIDDescDiag+'</ans:descricaoDiagnostico>');
                    FGuia.add('</ans:CID>');
                  FGuia.add('</ans:diagnosticosSecundarios>');
                end;

              if FTissConf.TissDiagSaidaInt.TissMotSaidInt then
                FGuia.add('<ans:motivoSaidaInternacao>'+FDiagSaidInt.TissMotSaidInt+'</ans:motivoSaidaInternacao>');

              if FTissConf.TissDiagSaidaInt.TissObito then
                begin
                  FGuia.add('<ans:obito>');
                    FGuia.add('<ans:CID>');
                      FGuia.add('<ans:nomeTabela>'+FDiagSaidInt.TissObito.TissCID.TissCIDNomeTab+'</ans:nomeTabela>');
                      FGuia.add('<ans:codigoDiagnostico>'+FDiagSaidInt.TissObito.TissCID.TissCIDCodDiag+'</ans:codigoDiagnostico>');
                      FGuia.add('<ans:descricaoDiagnostico>'+FDiagSaidInt.TissObito.TissCID.TissCIDDescDiag+'</ans:descricaoDiagnostico>');
                    FGuia.add('</ans:CID>');
                    FGuia.add('<ans:numeroDeclaracao>'+FDiagSaidInt.TissObito.TissnumeracaoDe+'</ans:numeroDeclaracao>');
                  FGuia.add('</ans:obito>');
                end;

            FGuia.add('</ans:diagnosticosSaidaInternacao>');

          FGuia.add('<ans:procedimentosRealizados>');
     // FGuia.add('</ans:guiaSP_SADT>');
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
  FTissProfissional := TTissProfissional.create;
  FTissPrestExec := TTissContratado.create;
  FDiagSaidInt := TDiagSaidInt.create;
  FTissSPProcedimentos := TTissSPProcedimentos.create;
  FTissOutrasDesp := TTissOutrasDesp.create;
  FTissOpmUti := TTissOpmUti.create;
  FCompVersao := TCompVersao.create;
  FTissConf := TTissConfInt.create;
  FTissValid := TTissValidacao.create;

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
      FCabecalho.Add('<?xml version="'+FTissCabecalho.tissVersaoXml+'" encoding="'+FTissCabecalho.TissEncoding+'" ?>');

      FCabecalho.Add('<ans:mensagemTISS '+FTissCabecalho.TissMensagemTissXml+'>');
      FCabecalho.Add('<ans:cabecalho>');
    //TAG IDENTIFICAÇÃO DA TRANSAÇÃO
      FCabecalho.Add('<ans:identificacaoTransacao>');
      FCabecalho.Add('<ans:tipoTransacao>'+FTissCabecalho.TissTipoTrans+'</ans:tipoTransacao>');

      FCabecalho.Add('<ans:sequencialTransacao>'+FTissCabecalho.TissSequencialTrans+'</ans:sequencialTransacao>');

      FCabecalho.Add('<ans:dataRegistroTransacao>'+FormatDateTime('YYYY-MM-DD',FTissCabecalho.TissDataRegistroTrans)+'</ans:dataRegistroTransacao>');

      FCabecalho.Add('<ans:horaRegistroTransacao>'+FormatDateTime('hh:mm:ss',FTissCabecalho.TissHoraRegistroTrans)+'</ans:horaRegistroTransacao>');

      FCabecalho.Add('</ans:identificacaoTransacao>');

      //TAG ORIGEM
      FCabecalho.Add('<ans:origem>');
      FCabecalho.Add('<ans:codigoPrestadorNaOperadora>');
      if FTissCabecalho.TissTipoGeral = JuridicoGeral then
        FCabecalho.Add('<ans:CNPJ>'+FTissCabecalho.TissCNPJCPF+'</ans:CNPJ>');

      if FTissCabecalho.TissTipoGeral = FisicGeral then
        FCabecalho.Add('<ans:cpf>'+FTissCabecalho.TissCNPJCPF+'</ans:cpf>');

      if FTissCabecalho.TissTipoGeral = Outros then
        FCabecalho.add('<ans:codigoPrestadorNaOperadora>'+FTissCabecalho.TissCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
       // mmCabecalho.Lines.Add('<ans:codigoPrestadorNaOperadora>'+fdsFaturamentoREGPRESTADORA.AsString+'</ans:codigoPrestadorNaOperadora>');
      FCabecalho.Add('</ans:codigoPrestadorNaOperadora>');
      FCabecalho.Add('</ans:origem>');
      FCabecalho.Add('<ans:destino>');
      FCabecalho.Add('<ans:registroANS>'+FTissCabecalho.TissRegAns+'</ans:registroANS>');
      FCabecalho.Add('</ans:destino>');

      FCabecalho.Add('<ans:versaoPadrao>'+FTissCabecalho.TissVersaoTISS+'</ans:versaoPadrao>');

      FCabecalho.Add('</ans:cabecalho>');

      FCabecalho.Add('<ans:prestadorParaOperadora>');
      FCabecalho.Add('<ans:loteGuias>');
      FCabecalho.Add('<ans:numeroLote>'+FTissCabecalho.TissNumLote+'</ans:numeroLote>');
      FCabecalho.Add('<ans:guias>');
      FCabecalho.Add('<ans:guiaFaturamento>');

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
  numhash,linha, TissTotalGeral: string;
  i: integer;
begin
    try
      for i:= 0 to FGuia.Count - 1 do
        begin
          FGeral.Add(FGuia.Strings[i]);
        end;

      for i:= 0 to FProc.Count - 1 do
        begin
          FGeral.Add(FProc.Strings[i]);
        end;
      FGeral.add('</ans:procedimentosRealizados>');

      if Tissconfig.TissUsarOutDespesas then
        begin
          FGeral.Add('<ans:outrasDespesas>');
          for i := 0 to FOutDesp.Count - 1 do
            begin
              FGeral.Add(FOutDesp.Strings[i]);
            end;
//Inclusão das Tags totalGeralOutrasDespesas
          TissTotalGeral:=CurrToStr(FTissOutrasDesp.TissTotalGeral);
          FGeral.Add('<ans:totalGeralOutrasDespesas>'+TissTotalGeral+'</ans:totalGeralOutrasDespesas>');

          FGeral.Add('</ans:outrasDespesas>')
        end;
              
      if FTissConf.TissTipoFat then
        FGeral.Add('<ans:tipoFaturamento>'+FTipoFat+'</ans:tipoFaturamento>');

      FGeral.Add('</ans:guiaResumoInternacao>');
      FGuia.Clear;
      FProc.Clear;
      FMembEquipe.Clear;
      FOutDesp.Clear;
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

      Writeln(arquivo,'</ans:guiaFaturamento>');
      Writeln(arquivo,'</ans:guias>');
      Writeln(arquivo,'</ans:loteGuias>');
      Writeln(arquivo,'</ans:prestadorParaOperadora>');

      Writeln(arquivo,'</ans:mensagemTISS>');



      //AssignFile(arquivoTemp,'temp.xml');
      //Reset(arquivoTemp);

      CloseFile(arquivo);
      numhash := hash(FTissCabecalho.TissArquivo);

      AssignFile(arquivo,FTissCabecalho.TissArquivo);
      Rewrite(arquivo);

      FGeral.Add('</ans:guiaFaturamento>');
      FGeral.Add('</ans:guias>');
      FGeral.Add('</ans:loteGuias>');
      FGeral.Add('</ans:prestadorParaOperadora>');
      FGeral.Add('<ans:epilogo>');
      FGeral.Add('<ans:hash>'+numhash+'</ans:hash>');
      FGeral.Add('</ans:epilogo>');
      FGeral.Add('</ans:mensagemTISS>');
            
      for i:= 0 to FCabecalho.Count - 1 do
        begin
          Writeln(arquivo,fcabecalho.Strings[i]);
        end;
      for i:= 0 to FGeral.Count - 1 do
        begin
          Writeln(arquivo,Fgeral.Strings[i]);
        end;
//      CloseFile(arquivoTemp);
      CloseFile(arquivo);
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

   { if FTissValid.UsarValidacao then
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
      end; }

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

  //         RenameFile(Tisscabecalho.TissArquivo,ExtractFilePath(Tisscabecalho.TissArquivo)+FormatFloat('00000000000000000000', StrToFloat(Tisscabecalho.TissSequencialTrans))+'_'+ numhash+'.xml');
//           FTissCabecalho.TissArquivo := ExtractFilePath(Tisscabecalho.TissArquivo)+FormatFloat('00000000000000000000', StrToFloat(Tisscabecalho.TissSequencialTrans))+'_'+ numhash+'.xml';
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
begin
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
  FOutDesp := TStringList.Create;
  FOutDesp.Clear;
  FGeral.Clear;
  FMembEquipe.Clear;
  FProc.Clear;
  FGuia.Clear;
  FCabecalho.Clear;

end;

procedure TTissInternacao.setacomodacao(const Value: String);
begin
  Facomodacao := Value;
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

procedure TTissInternacao.setRegANS(const Value: String);
begin
  FRegANS := Value;
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

end.
 
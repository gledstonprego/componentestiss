unit TissSP_SADT;

interface

uses
  SysUtils, Classes,Windows,Dialogs,Messages,forms,xmldom, XMLIntf, msxmldom,
  XMLDoc,untTissComp,untConfSPSADT,Graphics;
  {COMPONENTE INICIADO POR FABIANO
   Espero ter ajudado alguem com este componente, e
   espero que mais programadores se juntem nesta idéia
   para assim realizarmo o projeto TISS com sucesso,
   pela graça de Maria e o amor de Nosso Senhor JESUS CRISTO}

const
  MSG_TOVALIDATE_PTBR = 'A SER VALIDADO';
  MSG_ISVALID_PTBR    = 'VÁLIDO';
  MSG_ISNTVALID_PTBR  = 'INVÁLIDO';

type
  TpessoaSP_SADT = (FisicoSP_SADT,JuridicoSP_SADT);
  TTissSP_SADT = class(TComponent)
  private
//    FRegANS: String;
    FCNPJCPF: String;

    FTissSPSADT: TStringList;
    FCabecalho: TStringList;
    FGuia:TStringList;
    FProc:TStringList;
    FMembEquipe:TStringList;
    FGeral: TStringList;
    FOPM: TStringList;
    FOutDesp: TStringList;

    FTipo: TpessoaSP_SADT;
    FNumLote: String;
    FNomeAplica: string;
    FVersaoAplica: string;
    FFabricaAplica: string;

    FNumGuiaPrest: String;
    FNumGuiaOper: String;
    FNumGuiaPrinc: String;
    FDataEmis : TDateTime;
    FDataAut: TDateTime;
    FSenhaAut: String;
    FSenhaValid: TDateTime;
    FNomePlano: String;
    FTipoSP: TpessoaSP_SADT;

    FTissCabecalho: TTissCabecalho;
    FTissBenific: TTissBenific;
    FTissContratado: TTissContratado;
    FTissPrestExec: TTissContratado;
    FTissPrestExecCompl: TTissContratado;
    FTissProfissional: TTissProfissional;
    FTissProfissionalCompl: TTissProfissional;
    FindicClinica: String;
    FcaraAtend: String;
    FHoraAtend: TDateTime;
    FDataAtend: TDateTime;
    FTissDiagnostico: TTissDiagnostico;
    FTipoSaida: String;
    FTipoAtend: integer;
    FTissSPProcedimentos: TTissSPProcedimentos;
    FTissConfSP_SADT: TTissConfSP_SADT;
    FCompVersao: TCompVersao;
    FTissValid: TTissValidacao;
    FTissOpmUti: TTissOpmUti;
    FTissOutrasDesp: TTissOutrasDesp;
    FAnsVersaoxsd: TTissAnsVersao;
    FFontePagadora: TTissIdentFontPag;
    FObservacao: String;

    procedure setCNPJCPF(const Value: String);
    procedure setNumLote(const Value: String);
    function TiraMascara(Texto: String): String;
    function hash(arquivohash:string): String;
    procedure setNumGuiaOper(const Value: String);
    procedure setNumGuiaPrest(const Value: String);
    procedure setNumGuiaPrinc(const Value: String);
    procedure setDataEmis(const Value: TDateTime);
    procedure setDataAut(const Value: TDateTime);
    procedure setSenhaAut(const Value: String);
    procedure setSenhaValid(const Value: TDateTime);
    procedure setTipoSP(const Value: TpessoaSP_SADT);
    procedure setindicClinica(const Value: String);
    procedure setcaraAtend(const Value: String);
    procedure setDataAtend(const Value: TDateTime);
    procedure setHoraAtend(const Value: TDateTime);
    procedure setTipoSaida(const Value: String);
    procedure setTipoAtend(const Value: integer);
    procedure setAnsVersaoxsd(const Value: TTissAnsVersao);
    procedure SetFontePagadora(const Value: TTissIdentFontPag);
    procedure setNomeAplica(const Value: string);
    procedure setVersaoAplica(const Value: string);
    procedure setFabricaAplica(const Value: string);
    procedure setObservacao(const Value: String);

    { Private declarations }
  protected
    { Protected declarations }
  public
    { Public declarations }
    procedure iniciaSPSADT;
    procedure criaCabecalho;
    procedure criaRodape;
    procedure adicionarGuia;
    procedure adicionaProc;
    procedure finalizaProc;
    procedure adicionaProf;
    procedure adicionaOPM;
    procedure adicionaOutDesp;
    procedure finalizaGuia;
    procedure ClearDespesas;
    procedure GerarXml;
    
    constructor create(Aowner: TComponent);override;
  published
    { Published declarations }
    //versão do xsd da ANS
    property ansVersaoXSD: TTissAnsVersao read FAnsVersaoxsd write setAnsVersaoxsd;

    //fonte pagadora
    property TissFontePadora: TTissIdentFontPag read FFontePagadora write SetFontePagadora;    

    //VERSAO
    property Versao:TCompVersao read FCompVersao write FCompVersao;
    //CONFIGURAÇÕES
    property Tissconfig: TTissConfSP_SADT read FTissConfSP_SADT write FTissConfSP_SADT;
    //PROPRIEDADES DO XML
    //CABEÇALHO
    property Tisscabecalho: TTissCabecalho read FTissCabecalho write FTissCabecalho;
       //BENEFICIARIO
    property TissBeneficiario:TTissBenific read FTissBenific write FTissBenific;
     //DADOS CONTRATADO
    property TissContratado:TTissContratado read FTissContratado write FTissContratado;
    //Prestador Executante
    property TissPrestadorExec:TTissContratado read FTissPrestExec write FTissPrestExec;
    //Prestador Executante Complementar
    property TissPrestadorExecCompl:TTissContratado read FTissPrestExecCompl write FTissPrestExecCompl;
    //Profissional executante
    property TissProfissional:TTissProfissional read FTissProfissional write FTissProfissional;

    //Profissional executante complementar
    property TissProfissionalCompl:TTissProfissional read FTissProfissionalCompl write FTissProfissionalCompl;

    property TissCNPJCPF:String read FCNPJCPF write setCNPJCPF;
//    property TissRegANS:String read FRegANS write setRegANS;
    property TissNumLote:String read FNumLote write setNumLote;
    property TissNomeAplica:string read FNomeAplica write setNomeAplica;
    property TissVersaoAplica:string read FVersaoAplica write setVersaoAplica;
    property TissFabricaAplica:string read FFabricaAplica write setFabricaAplica;

    //GUIA
    property TissNumGuiaPrest:String read FNumGuiaPrest write setNumGuiaPrest;
    property TissNumGuiaOper:String read FNumGuiaOper write setNumGuiaOper;
    property TissNumGuiaPrinc:String read FNumGuiaPrinc write setNumGuiaPrinc;
    property TissDataEmis:TDateTime read FDataEmis write setDataEmis;
    property TissDataAut:TDateTime read FDataAut write setDataAut;
    property TissSenhaAut:String read FSenhaAut write setSenhaAut;
    property TissSenhaValid:TDateTime read FSenhaValid write setSenhaValid;

    property TissTipoSP:TpessoaSP_SADT read FTipoSP write setTipoSP;
    property TissindicClinica:String read FindicClinica write setindicClinica;
    property TisscaraterAtend:String read FcaraAtend write setcaraAtend;
    property TissDataAtend:TDateTime read FDataAtend write setDataAtend;
    property TissHoraAtend:TDateTime read FHoraAtend write setHoraAtend;

    //Diagnostico guia
    property TissDiagnostico:TTissDiagnostico read FTissDiagnostico write FTissDiagnostico;
    property TissTipoSaida:String read FTipoSaida write setTipoSaida; //1,2,3,4,5,6
    property TissTipoAtend:integer read FTipoAtend write setTipoAtend; //01,02,03,04,05,06,07,08,09,10

    //Procedimentos
    property TissProc:TTissSPProcedimentos read FTissSPProcedimentos write FTissSPProcedimentos;
    //OpmUtilizada
    property TissOpmUti:TTissOpmUti read FTissOpmUti write FTissOpmUti;
    //Despesas
    property TissOutDesp:TTissOutrasDesp read FTissOutrasDesp write FTissOutrasDesp;
    //Validação
    property TissValid: TTissValidacao read FTissValid write FTissValid;
    property TissObservacao: String read FObservacao write setObservacao;

  end;

procedure Register;

implementation

uses md52, TissConsulta, untFunc, untValida, Base64Tiss;


procedure Register;
begin
  RegisterComponents('Tiss', [TTissSP_SADT]);
end;

{ TTissSP_SADT }


procedure TTissSP_SADT.AdicionaOPM;
begin
  Try
    FOPM.Add('<ansTISS:identificacaoOPM>');
    FOPM.Add('<ansTISS:OPM>');

    with FTissConfSP_SADT.TissOPM do
      begin
        if TissCodigo then
//          FOPM.Add ('<ans:codigo>' + TissOPMuti.TissOPM.TissTabOPM.TissCodigo + '</ans:codigo>');
          FOPM.Add ('<ansTISS:codigo>' + TissOPMuti.TissOpm.TissTabOPM.TissCodigo + '</ansTISS:codigo>');

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


procedure TTissSP_SADT.adicionaOutDesp;
begin
    try
      FOutDesp.Add('<ansTISS:despesa>');

      with FTissConfSP_SADT.TissOutDesp do
      begin
        FOutDesp.Add('<ansTISS:identificadorDespesa>');
          if TissTipoDesp then
            FOutDesp.Add('<ansTISS:codigo>'+TissOutDesp.TissDespesa.TissIdentCodigo+'</ansTISS:codigo>');
          if TissIdentTipTab then
            FOutDesp.Add('<ansTISS:tipoTabela>'+TissOutDesp.TissDespesa.TissIdentTipoTab+'</ansTISS:tipoTabela>');
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

procedure TTissSP_SADT.adicionaProc;
var
  i: Integer;
begin
    try
      FProc.Add('<ansTISS:procedimentos>');
        if Tissconfig.TissProc.TissUsarEquipe then
          begin
            FProc.Add('<ansTISS:equipe>');
              for i:= 0 to FMembEquipe.Count - 1 do
                begin
                  FProc.Add(FMembEquipe.Strings[i]);
                end;
            FProc.Add('</ansTISS:equipe>');
          end;

        with FTissConfSP_SADT.TissProc do
          begin
            FProc.Add('<ansTISS:procedimento>');
              if TissProcs.TissCodigo then
                FProc.Add('<ansTISS:codigo>'+TissProc.TissProcs.TissCodigo+'</ansTISS:codigo>');
              if TissProcs.TissTipTabela then
                FProc.Add('<ansTISS:tipoTabela>'+FormatFloat('00', TissProc.TissProcs.TissTipTabela)+'</ansTISS:tipoTabela>');
              if TissProcs.TissDescricao then
                FProc.Add('<ansTISS:descricao>'+TissProc.TissProcs.TissDescricao+'</ansTISS:descricao>');
            FProc.Add('</ansTISS:procedimento>');
            if TissData then
              begin
                if ansVersaoXSD = v2_01_03 then
                  FProc.add('<ansTISS:data>'+FormatDateTime('DD/MM/YYYY',TissProc.TissData)+'</ansTISS:data>')
                else
                  FProc.add('<ansTISS:data>'+FormatDateTime('YYYY-MM-DD',TissProc.TissData)+'</ansTISS:data>');
              end;
            if TissHsInicio then
              begin
                if ansVersaoXSD = v2_01_03 then
                  FProc.add('<ansTISS:horaInicio>'+FormatDateTime('hh:mm',TissProc.TissHsInicio)+'</ansTISS:horaInicio>')
                else
                  FProc.add('<ansTISS:horaInicio>'+FormatDateTime('hh:mm:ss',TissProc.TissHsInicio)+'</ansTISS:horaInicio>');
              end;
            if TissHsFim then
              begin
                if ansVersaoXSD = v2_01_03 then
                  FProc.add('<ansTISS:horaFim>'+FormatDateTime('hh:mm',TissProc.TissHsFim)+'</ansTISS:horaFim>')
                else
                  FProc.add('<ansTISS:horaFim>'+FormatDateTime('hh:mm:ss',TissProc.TissHsFim)+'</ansTISS:horaFim>');
              end;
            if TissQtde then
              FProc.add('<ansTISS:quantidadeRealizada>'+CurrToStr(TissProc.TissQtde)+'</ansTISS:quantidadeRealizada>');
            if TissVdeAcesso then
              FProc.Add('<ansTISS:viaAcesso>'+TissProc.TissVdeAcesso+'</ansTISS:viaAcesso>');
            if TissTecUtil then
              FProc.Add('<ansTISS:tecnicaUtilizada>'+TissProc.TissTecUtil+'</ansTISS:tecnicaUtilizada>');
            if TissReducAcres then
              FProc.Add('<ansTISS:reducaoAcrescimo>'+CurrToStr(TissProc.TissReducAcres)+'</ansTISS:reducaoAcrescimo>');
            if TissValor then
              FProc.Add('<ansTISS:valor>'+CurrToStr(TissProc.TissValor)+'</ansTISS:valor>');
            if TissValorTotal then
              FProc.Add('<ansTISS:valorTotal>'+CurrToStr(TissProc.TissValorTotal)+'</ansTISS:valorTotal>');
          end;

      FProc.Add('</ansTISS:procedimentos>');
      FMembEquipe.Clear;
    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao adicionar procedimento:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;
end;

procedure TTissSP_SADT.adicionaProf;
begin
  if Tissconfig.TissProc.TissUsarEquipe then
    begin
      FMembEquipe.Add('<ansTISS:membroEquipe>');
        FMembEquipe.Add('<ansTISS:codigoProfissional>');
          if FTissConfSP_SADT.TissProc.TissEquipe.TissTipoMemb then
            begin
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

        FMembEquipe.Add('<ansTISS:identificacaoProfissional>');
          with FTissConfSP_SADT.TissProc.TissEquipe do
            begin
              if FTissConfSP_SADT.TissProc.TissEquipe.TissProfiss.TissProf then
                FMembEquipe.Add('<ansTISS:nomeExecutante>'+TissProc.TissEquipe.TissProfiss.TissProf+'</ansTISS:nomeExecutante>');
                FMembEquipe.Add('<ansTISS:conselhoProfissional>');
                  if FTissConfSP_SADT.TissProc.TissEquipe.TissProfiss.TissSiglaConselho then
                    FMembEquipe.Add('<ansTISS:siglaConselho>'+TissProc.TissEquipe.TissProfiss.TissSiglaConselho+'</ansTISS:siglaConselho>');
                  if FTissConfSP_SADT.TissProc.TissEquipe.TissProfiss.TissNumConselho then
                    FMembEquipe.Add('<ansTISS:numeroConselho>'+TissProc.TissEquipe.TissProfiss.TissNumConselho+'</ansTISS:numeroConselho>');
                  if FTissConfSP_SADT.TissProc.TissEquipe.TissProfiss.TissUFConselho then
                    FMembEquipe.Add('<ansTISS:ufConselho>'+TissProc.TissEquipe.TissProfiss.TissUFConselho+'</ansTISS:ufConselho>');
                FMembEquipe.Add('</ansTISS:conselhoProfissional>');
                
                if FTissConfSP_SADT.TissProc.TissEquipe.TissProfiss.TissfCBOS then
                  FMembEquipe.Add('<ansTISS:codigoCBOS>'+TissProc.TissEquipe.TissProfiss.TissfCBOS+'</ansTISS:codigoCBOS>');
              FMembEquipe.Add('</ansTISS:identificacaoProfissional>');
              if FTissConfSP_SADT.TissProc.TissEquipe.TissProfiss.TissPosicProf then
                //FMembEquipe.Add('<ansTISS:posicaoProfissional>'+IntToStr(TissProc.TissEquipe.TissProfiss.TissPosicProf)+'</ansTISS:posicaoProfissional>');
                FMembEquipe.Add('<ansTISS:posicaoProfissional>'+FormatFloat('00',TissProc.TissEquipe.TissProfiss.TissPosicProf)+'</ansTISS:posicaoProfissional>');
            end;
      FMembEquipe.Add('</ansTISS:membroEquipe>');
    end;
end;

procedure TTissSP_SADT.adicionarGuia;
begin
    try  
      FGuia.add('<ansTISS:guiaSP_SADT>');

        FGuia.add('<ansTISS:identificacaoGuiaSADTSP>');
        if (FAnsVersaoxsd <> v2_01_03) then
          begin
            FGuia.Add('<ansTISS:identificacaoFontePagadora>');
            case FTissConfSP_SADT.PadraoTipFontPg of
              RegistroANS: FGuia.add('<ansTISS:registroANS>'+FFontePagadora.TissRegAns+'</ansTISS:registroANS>');
              CNPJ: FGuia.add('<ansTISS:cnpjFontePagadora>'+FFontePagadora.TissCnpj+'</ansTISS:cnpjFontePagadora>');
            end;    
            FGuia.add('</ansTISS:identificacaoFontePagadora>');
          end;
        if FAnsVersaoxsd = v2_01_03 then
          if FTissConfSP_SADT.TissRegANS then
            FGuia.add('<ansTISS:registroANS>'+FFontePagadora.TissRegAns+'</ansTISS:registroANS>');
          if ansVersaoXSD = v2_01_03 then
            FGuia.add('<ansTISS:dataEmissaoGuia>'+FormatDateTime('DD/MM/YYYY',FDataEmis)+'</ansTISS:dataEmissaoGuia>')
          else
            FGuia.add('<ansTISS:dataEmissaoGuia>'+FormatDateTime('YYYY-MM-DD',FDataEmis)+'</ansTISS:dataEmissaoGuia>');

          if FTissConfSP_SADT.TissNumGuiaPrest then
            FGuia.add('<ansTISS:numeroGuiaPrestador>'+FNumGuiaPrest+'</ansTISS:numeroGuiaPrestador>');
          if FTissConfSP_SADT.TissNumGuiaOper then
            FGuia.add('<ansTISS:numeroGuiaOperadora>'+FNumGuiaOper+'</ansTISS:numeroGuiaOperadora>');

        FGuia.add('</ansTISS:identificacaoGuiaSADTSP>');
        if FTissConfSP_SADT.TissNumGuiaPrinc then
          FGuia.add('<ansTISS:numeroGuiaPrincipal>'+FNumGuiaPrinc+'</ansTISS:numeroGuiaPrincipal>');

        if (FTissConfSP_SADT.TissDataAut) or
        (FTissConfSP_SADT.TissSenhaAut) or
        (FTissConfSP_SADT.TissSenhaValid) then
          begin
            FGuia.add('<ansTISS:dadosAutorizacao>');
              if FTissConfSP_SADT.TissDataAut then
                begin
                  if ansVersaoXSD = v2_01_03 then
                    FGuia.add('<ansTISS:dataAutorizacao>'+FormatDateTime('DD/MM/YYYY',FDataAut)+'</ansTISS:dataAutorizacao>')
                  else
                    FGuia.add('<ansTISS:dataAutorizacao>'+FormatDateTime('YYYY-MM-DD',FDataAut)+'</ansTISS:dataAutorizacao>');
                end;
              if FTissConfSP_SADT.TissSenhaAut then
                FGuia.add('<ansTISS:senhaAutorizacao>'+FSenhaAut+'</ansTISS:senhaAutorizacao>');
              if FTissConfSP_SADT.TissSenhaValid then
                begin
                  if ansVersaoXSD = v2_01_03 then
                    FGuia.add('<ansTISS:validadeSenha>'+FormatDateTime('DD/MM/YYYY',FSenhaValid)+'</ansTISS:validadeSenha>')
                  else
                    FGuia.add('<ansTISS:validadeSenha>'+FormatDateTime('YYYY-MM-DD',FSenhaValid)+'</ansTISS:validadeSenha>');
                end;
            FGuia.add('</ansTISS:dadosAutorizacao>');
          end;

        if Tissconfig.TissUsarBenefic then
          begin
            FGuia.add('<ansTISS:dadosBeneficiario>');
              if FTissConfSP_SADT.TissBenefic.TissNumCarteira then
                FGuia.add('<ansTISS:numeroCarteira>'+FTissBenific.TissNumCarteira+'</ansTISS:numeroCarteira>');
              if FTissConfSP_SADT.TissBenefic.TissBenific then
                FGuia.add('<ansTISS:nomeBeneficiario>'+FTissBenific.TissBenific+'</ansTISS:nomeBeneficiario>');
              if FTissConfSP_SADT.TissBenefic.TissNomePlano then
                FGuia.add('<ansTISS:nomePlano>'+FTissBenific.TissNomePlano+'</ansTISS:nomePlano>');
              if FTissConfSP_SADT.TissBenefic.TissValidadeCart then
                begin
                  if ansVersaoXSD = v2_01_03 then
                    FGuia.add('<ansTISS:validadeCarteira>'+FormatDateTime('DD/MM/YYYY',FTissBenific.TissValidadeCart)+'</ansTISS:validadeCarteira>')
                  else
                    FGuia.add('<ansTISS:validadeCarteira>'+FormatDateTime('YYYY-MM-DD',FTissBenific.TissValidadeCart)+'</ansTISS:validadeCarteira>');
                end;
              if FTissConfSP_SADT.TissBenefic.TissNumCNS then
                FGuia.add('<ansTISS:numeroCNS>'+FTissBenific.TissNumCNS+'</ansTISS:numeroCNS>');

            FGuia.add('</ansTISS:dadosBeneficiario>');
          end;

        if (Tissconfig.TissUsarProfissional) or
        (Tissconfig.TissUsarContratado) then
          begin
            FGuia.add('<ansTISS:dadosSolicitante>');
            if Tissconfig.TissUsarContratado then
              begin
                FGuia.add('<ansTISS:contratado>');

                  FGuia.add('<ansTISS:identificacao>');
                    if FTissConfSP_SADT.TissContratado.TissCNPJCPF then
                      begin
                        if TissContratado.TissTipoGeral = JuridicoGeral then
                          FGuia.add('<ansTISS:CNPJ>'+TissContratado.TissCNPJCPF+'</ansTISS:CNPJ>');

                        if TissContratado.TissTipoGeral = FisicGeral then
                          FGuia.add('<ansTISS:cpf>'+TissContratado.TissCNPJCPF+'</ansTISS:cpf>');

                        if TissContratado.TissTipoGeral = Outros then
                          FGuia.Add('<ansTISS:codigoPrestadorNaOperadora>'+TissContratado.TissCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
                      end;

                  FGuia.add('</ansTISS:identificacao>');
                  if FTissConfSP_SADT.TissContratado.TissNomeContradado then
                    FGuia.add('<ansTISS:nomeContratado>'+TissContratado.TissNomeContradado+'</ansTISS:nomeContratado>');

                  If FTissConfSP_SADT.TissContratado.TissUsarEnd then
                    begin
                      FGuia.add('<ansTISS:enderecoContratado>');
                        if FTissConfSP_SADT.TissContratado.TisstipoLogradouro then
                          FGuia.add('<ansTISS:tipoLogradouro>'+TissContratado.TisstipoLogradouro+'</ansTISS:tipoLogradouro>');
                        if FTissConfSP_SADT.TissContratado.TissLogradouro then
                          FGuia.add('<ansTISS:logradouro>'+TissContratado.TissLogradouro+'</ansTISS:logradouro>');
                        if FTissConfSP_SADT.TissContratado.TissEndNum then
                          FGuia.add('<ansTISS:numero>'+TissContratado.TissEndNum+'</ansTISS:numero>');
                        if FTissConfSP_SADT.TissContratado.TissComplemento then
                          FGuia.add('<ansTISS:complemento>'+TissContratado.TissComplemento+'</ansTISS:complemento>');
                        if FTissConfSP_SADT.TissContratado.TisscodigoIBGE then
                          FGuia.add('<ansTISS:codigoIBGEMunicipio>'+FormatFloat('0000000',TissContratado.TisscodigoIBGE)+'</ansTISS:codigoIBGEMunicipio>');
                        if FTissConfSP_SADT.TissContratado.TissMunicipio then
                          FGuia.add('<ansTISS:municipio>'+TissContratado.TissMunicipio+'</ansTISS:municipio>');
                        if FTissConfSP_SADT.TissContratado.TissUF then
                          FGuia.add('<ansTISS:codigoUF>'+TissContratado.TissUF+'</ansTISS:codigoUF>');
                        if FTissConfSP_SADT.TissContratado.TissCEP then
                          FGuia.add('<ansTISS:cep>'+TissContratado.TissCEP+'</ansTISS:cep>');

                      FGuia.add('</ansTISS:enderecoContratado>');
                    end;
                  if FTissConfSP_SADT.TissContratado.TissCNES then
                    FGuia.add('<ansTISS:numeroCNES>'+FormatFloat('0000000', TissContratado.TissCNES)+'</ansTISS:numeroCNES>');

                FGuia.add('</ansTISS:contratado>');
              end;
              if Tissconfig.TissUsarProfissional then
                begin
                  FGuia.add('<ansTISS:profissional>');
                    if FTissConfSP_SADT.TissProfissional.TissProf then
                      FGuia.add('<ansTISS:nomeProfissional>'+ FTissProfissional.TissProf+'</ansTISS:nomeProfissional>');
                    FGuia.add('<ansTISS:conselhoProfissional>');
                    if FTissConfSP_SADT.TissProfissional.TissSiglaConselho then
                      FGuia.add('<ansTISS:siglaConselho>'+FTissProfissional.TissSiglaConselho+'</ansTISS:siglaConselho>');
                    if FTissConfSP_SADT.TissProfissional.TissNumConselho then
                      FGuia.add('<ansTISS:numeroConselho>'+FTissProfissional.TissNumConselho+'</ansTISS:numeroConselho>');
                    if FTissConfSP_SADT.TissProfissional.TissUFConselho then
                      FGuia.add('<ansTISS:ufConselho>'+FTissProfissional.TissUFConselho+'</ansTISS:ufConselho>');
                    FGuia.add('</ansTISS:conselhoProfissional>');
                    if FTissConfSP_SADT.TissProfissional.TissfCBOS then
                     FGuia.add('<ansTISS:cbos>'+FTissProfissional.TissfCBOS+'</ansTISS:cbos>');
                  FGuia.add('</ansTISS:profissional>');
               end;
            FGuia.add('</ansTISS:dadosSolicitante>');
          end;
        if Tissconfig.TissUsarPrestadorExec then
          begin
            FGuia.add('<ansTISS:prestadorExecutante>');
              FGuia.add('<ansTISS:identificacao>');
                if FTissConfSP_SADT.TissPrestadorExec.TissCNPJCPF then
                  begin
                    if FTissPrestExec.TissTipoGeral = JuridicoGeral then
                      FGuia.add('<ansTISS:CNPJ>'+FTissPrestExec.TissCNPJCPF+'</ansTISS:CNPJ>');
                    if FTissPrestExec.TissTipoGeral = FisicGeral then
                      FGuia.add('<ansTISS:cpf>'+FTissPrestExec.TissCNPJCPF+'</ansTISS:cpf>');
                    if FTissPrestExec.TissTipoGeral = Outros then
                      FGuia.add('<ansTISS:codigoPrestadorNaOperadora>'+FTissPrestExec.TissCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
                  end;
              FGuia.add('</ansTISS:identificacao>');
              if FTissConfSP_SADT.TissPrestadorExec.TissNomeContradado then
                FGuia.add('<ansTISS:nomeContratado>'+FTissPrestExec.TissNomeContradado+'</ansTISS:nomeContratado>');

              if FTissConfSP_SADT.TissPrestadorExec.TissUsarEnd then
                begin
                  FGuia.add('<ansTISS:enderecoContratado>');
                    if FTissConfSP_SADT.TissPrestadorExec.TisstipoLogradouro then
                      FGuia.add('<ansTISS:tipoLogradouro>'+FTissPrestExec.TisstipoLogradouro+'</ansTISS:tipoLogradouro>');
                    if FTissConfSP_SADT.TissPrestadorExec.TissLogradouro then
                      FGuia.add('<ansTISS:logradouro>'+FTissPrestExec.TissLogradouro+'</ansTISS:logradouro>');
                    if FTissConfSP_SADT.TissPrestadorExec.TissEndNum then
                      FGuia.add('<ansTISS:numero>'+FTissPrestExec.TissEndNum+'</ansTISS:numero>');
                    if FTissConfSP_SADT.TissPrestadorExec.TissComplemento then
                      FGuia.add('<ansTISS:complemento>'+FTissPrestExec.TissComplemento+'</ansTISS:complemento>');
                    if FTissConfSP_SADT.TissPrestadorExec.TisscodigoIBGE then
                      FGuia.add('<ansTISS:codigoIBGEMunicipio>'+FormatFloat('0000000',FTissPrestExec.TisscodigoIBGE)+'</ansTISS:codigoIBGEMunicipio>');
                    if FTissConfSP_SADT.TissPrestadorExec.TissMunicipio then
                      FGuia.add('<ansTISS:municipio>'+FTissPrestExec.TissMunicipio+'</ansTISS:municipio>');
                    if FTissConfSP_SADT.TissPrestadorExec.TissUF then
                      FGuia.add('<ansTISS:codigoUF>'+FTissPrestExec.TissUF+'</ansTISS:codigoUF>');
                    if FTissConfSP_SADT.TissPrestadorExec.TissCEP then
                      FGuia.add('<ansTISS:cep>'+FTissPrestExec.TissCEP+'</ansTISS:cep>');

                  FGuia.add('</ansTISS:enderecoContratado>');
                end;
              if FTissConfSP_SADT.TissPrestadorExec.TissCNES then
                FGuia.add('<ansTISS:numeroCNES>'+FormatFloat('0000000', FTissPrestExec.TissCNES)+'</ansTISS:numeroCNES>');
//Inclusão das tags profissionalExecutanteCompl
              if Tissconfig.TissUsarProfissionalCompl then
                begin
                  FGuia.add('<ansTISS:profissionalExecutanteCompl>');
                    if FTissConfSP_SADT.TissProfissionalCompl.TissProf then
                      FGuia.add('<ansTISS:nomeExecutante>'+ FTissProfissionalCompl.TissProf+'</ansTISS:nomeExecutante>');
                    FGuia.add('<ansTISS:conselhoProfissional>');
                    if FTissConfSP_SADT.TissProfissionalCompl.TissSiglaConselho then
                      FGuia.add('<ansTISS:siglaConselho>'+FTissProfissionalCompl.TissSiglaConselho+'</ansTISS:siglaConselho>');
                    if FTissConfSP_SADT.TissProfissionalCompl.TissNumConselho then
                      FGuia.add('<ansTISS:numeroConselho>'+FTissProfissionalCompl.TissNumConselho+'</ansTISS:numeroConselho>');
                    if FTissConfSP_SADT.TissProfissionalCompl.TissUFConselho then
                      FGuia.add('<ansTISS:ufConselho>'+FTissProfissionalCompl.TissUFConselho+'</ansTISS:ufConselho>');
                    FGuia.add('</ansTISS:conselhoProfissional>');
                    if FTissConfSP_SADT.TissProfissionalCompl.TissfCBOS then
                     FGuia.add('<ansTISS:codigoCBOS>'+FTissProfissionalCompl.TissfCBOS+'</ansTISS:codigoCBOS>');
                    FGuia.Add('<ansTISS:codigoProfissionalCompl>');
                    if FTissConfSP_SADT.TissUsarPrestadorExecCompl then
                      begin
                        if FTissPrestExecCompl.TissTipoGeral = FisicGeral then
                          FGuia.add('<ansTISS:cpf>'+FTissPrestExecCompl.TissCNPJCPF+'</ansTISS:cpf>');
                        if FTissPrestExecCompl.TissTipoGeral = Outros then
                          FGuia.add('<ansTISS:codigoPrestadorNaOperadora>'+FTissPrestExecCompl.TissCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
                      end;
                    FGuia.Add('</ansTISS:codigoProfissionalCompl>');
                  FGuia.add('</ansTISS:profissionalExecutanteCompl>');
               end;
//Termina aqui

            FGuia.add('</ansTISS:prestadorExecutante>');
          end;

        if FTissConfSP_SADT.TissindicClinica then
          FGuia.add('<ansTISS:indicacaoClinica>'+FindicClinica+'</ansTISS:indicacaoClinica>');
        if FTissConfSP_SADT.TisscaraterAtend then
          FGuia.add('<ansTISS:caraterAtendimento>'+FcaraAtend+'</ansTISS:caraterAtendimento>');
        if FTissConfSP_SADT.TissDataAtend then
          begin
            if ansVersaoXSD = v2_01_03 then
              FGuia.add('<ansTISS:dataHoraAtendimento>'+FormatDateTime('DD/MM/YYYY',FDataATend)+'H'+FormatDateTime('hh:mm',FHoraAtend)+'</ansTISS:dataHoraAtendimento>')
            else
              FGuia.add('<ansTISS:dataHoraAtendimento>'+FormatDateTime('YYYY-MM-DD',FDataATend)+'T'+FormatDateTime('hh:mm:ss',FHoraAtend)+'</ansTISS:dataHoraAtendimento>');
          end;

        if Tissconfig.TissUsarDiagnostico then
          begin
            FGuia.add('<ansTISS:diagnosticoAtendimento>');
              FGuia.add('<ansTISS:CID>');
                if FTissConfSP_SADT.TissDiagnostico.TissCIDNomeTab then
                  FGuia.add('<ansTISS:nomeTabela>'+FTissDiagnostico.TissCIDNomeTab+'</ansTISS:nomeTabela>');
                if FTissConfSP_SADT.TissDiagnostico.TissCIDCodDiag then
                  FGuia.add('<ansTISS:codigoDiagnostico>'+FTissDiagnostico.TissCIDCodDiag+'</ansTISS:codigoDiagnostico>');
                if FTissConfSP_SADT.TissDiagnostico.TissCIDDescDiag then
                  FGuia.add('<ansTISS:descricaoDiagnostico>'+FTissDiagnostico.TissCIDDescDiag+'</ansTISS:descricaoDiagnostico>');
              FGuia.add('</ansTISS:CID>');
              if FTissConfSP_SADT.TissDiagnostico.TissTipDoenc then
                FGuia.add('<ansTISS:tipoDoenca>'+FTissDiagnostico.TissTipDoenc+'</ansTISS:tipoDoenca>');
              if (FTissConfSP_SADT.TissDiagnostico.TissValor) or
               (FTissConfSP_SADT.TissDiagnostico.TissUnTemp) then
                begin
                  FGuia.add('<ansTISS:tempoReferidoEvolucaoDoenca>');
                    if FTissConfSP_SADT.TissDiagnostico.TissValor then
                      FGuia.add('<ansTISS:valor>'+inttoStr(FTissDiagnostico.TissValor)+'</ansTISS:valor>');
                    if FTissConfSP_SADT.TissDiagnostico.TissUnTemp then
                      FGuia.add('<ansTISS:unidadeTempo>'+FTissDiagnostico.TissUnTemp+'</ansTISS:unidadeTempo>');
                  FGuia.add('</ansTISS:tempoReferidoEvolucaoDoenca>');
                end;
              if FTissConfSP_SADT.TissDiagnostico.TissIndicAcid then
                FGuia.add('<ansTISS:indicadorAcidente>'+inttoStr(FTissDiagnostico.TissIndicAcid)+'</ansTISS:indicadorAcidente>');

            FGuia.add('</ansTISS:diagnosticoAtendimento>');
          end;
        if FTissConfSP_SADT.TissTipoSaida then
          FGuia.add('<ansTISS:tipoSaida>'+FTipoSaida+'</ansTISS:tipoSaida>');
        if FTissConfSP_SADT.TissTipoAtend then
          FGuia.add('<ansTISS:tipoAtendimento>'+FormatFloat('00',FTipoAtend)+'</ansTISS:tipoAtendimento>');
        if Tissconfig.TissUsarProc then
          FGuia.add('<ansTISS:procedimentosRealizados>');
     // FGuia.add('</ansTISS:guiaSP_SADT>');
    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao criar Guia;'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;
end;

constructor TTissSP_SADT.create(Aowner: TComponent);
begin
  FTissCabecalho := TTissCabecalho.create;
  FTissBenific := TTissBenific.Create;
  FTissContratado := TTissContratado.Create;
  FTissPrestExec := TTissContratado.Create;
  FTissPrestExecCompl := TTissContratado.Create;
  FTissProfissional := TTissProfissional.create;
  FTissProfissionalCompl := TTissProfissional.create;
  FTissDiagnostico := TTissDiagnostico.create;
  FTissSPProcedimentos := TTissSPProcedimentos.create;
  FTissConfSP_SADT := TTissConfSP_SADT.create;
  FCompVersao := TCompVersao.create;
  FTissValid := TTissValidacao.create;
  FTissOpmUti := TTissOpmUti.create;
  FTissOutrasDesp := TTissOutrasDesp.create;
  FFontePagadora := TTissIdentFontPag.Create;

  FAnsVersaoxsd := v2_02_03;
  FTissCabecalho.TissEncoding:='ISO-8859-1';
  FTissCabecalho.TissVersaoXml:='1.0';
  FTissCabecalho.TissVersaoTISS:='2.02.03';
  FTipoSP:=JuridicoSP_SADT;
  FTissCabecalho.TissMensagemTissXml:='xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ansTISS="http://www.ans.gov.br/padroes/tiss/schemas"';

  inherited;

end;

procedure TTissSP_SADT.criaCabecalho;
begin
  //DecimalSeparator := '.';
  if Trim(FTissCabecalho.TissArquivo) = '' then
    begin
      Application.MessageBox('Informe o arquivo xml a ser criado!!!','ATENÇÃO',MB_OK+MB_ICONEXCLAMATION);
      Abort;
    end;
    try
      FCabecalho.Add('<?xml version="'+FTissCabecalho.tissVersaoXml+'" encoding="'+FTissCabecalho.TissEncoding+'" ?>');

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
        FCabecalho.Add('<ansTISS:cpf>'+FTissCabecalho.TissCNPJCPF+'</ansTISS:cpf>');

      if FTissCabecalho.TissTipoGeral = Outros then
        FCabecalho.Add('<ansTISS:codigoPrestadorNaOperadora>'+FTissCabecalho.TissCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
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

procedure TTissSP_SADT.criaRodape;
var
  arquivo,arquivoTemp: TextFile;
  numhash,linha: string;
begin
    try
      AssignFile(arquivo,FTissCabecalho.TissArquivo);
      Append(arquivo);

      Writeln(arquivo,'</ansTISS:guiaFaturamento>');
      Writeln(arquivo,'</ansTISS:guias>');
      Writeln(arquivo,'</ansTISS:loteGuias>');
      Writeln(arquivo,'</ansTISS:prestadorParaOperadora>');  

      Writeln(arquivo,'</ansTISS:mensagemTISS>');


      CloseFile(arquivo);
      AssignFile(arquivoTemp,'temp.xml');
      Rewrite(arquivoTemp);

      numhash := hash(FTissCabecalho.TissArquivo);
      
      AssignFile(arquivo,FTissCabecalho.TissArquivo);
      Reset(arquivo);
      while not Eof(arquivo) do
        begin
          Readln(arquivo,linha);
          if linha <> '</ansTISS:mensagemTISS>' then
            Writeln(arquivotemp,linha);
        end;  
      CloseFile(arquivo);
              //TAG EPILOGO
      Writeln(arquivotemp,'<ansTISS:epilogo>');
      Writeln(arquivotemp,'<ansTISS:hash>'+numhash+'</ansTISS:hash>');
      Writeln(arquivotemp,'</ansTISS:epilogo>');
      Writeln(arquivotemp,'</ansTISS:mensagemTISS>');
      CloseFile(arquivoTemp);

      AssignFile(arquivoTemp,'temp.xml');
      Reset(arquivoTemp);

      AssignFile(arquivo,FTissCabecalho.TissArquivo);
      Rewrite(arquivo);
      while not Eof(arquivoTemp) do
        begin
           Readln(arquivoTemp,linha);
           Writeln(arquivo,linha); 
        end;
      CloseFile(arquivo);
      CloseFile(arquivoTemp);
    except
      on e: Exception do
        begin

          Application.MessageBox(PChar('Erro ao acessar arquivo:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;
end;

procedure TTissSP_SADT.finalizaGuia;
var
  arquivo,arquivoTemp: TextFile;
  numhash,linha, TissTotalServicos, TissTotalDiarias,
  TissTotalTaxas,TissTotalMateriais, TissTotalMedicamentos,
  TissTotalGases, TissTotalGeral, TissVlrTotOpm : string;
  i: integer;
begin
    try

      for i:= 0 to FGuia.Count - 1 do
        begin
          FGeral.Add(FGuia.Strings[i]);
        end;

      if Tissconfig.TissUsarProc then
        begin
          for i:= 0 to FProc.Count - 1 do
            begin
              FGeral.Add(FProc.Strings[i]);
            end;
          FGeral.add('</ansTISS:procedimentosRealizados>');
        end;


      if Tissconfig.TissUsarOutDespesas then
        begin
          FGeral.Add('<ansTISS:outrasDespesas>');
          for i := 0 to FOutDesp.Count - 1 do
            begin
              FGeral.Add(FOutDesp.Strings[i]);
            end;

          TissTotalGeral:=CurrToStr(FTissOutrasDesp.TissTotalGeral);
          FGeral.Add('<ansTISS:totalGeralOutrasDespesas>'+TissTotalGeral+'</ansTISS:totalGeralOutrasDespesas>');
          FGeral.Add('</ansTISS:outrasDespesas>')
        end;


      if TissConfig.TissUsarOPM then
        begin
         FGeral.Add ('<ansTISS:OPMUtilizada>');
          FGeral.Add ('<ansTISS:OPM>');
          for i := 0 to FOPM.Count - 1 do FGeral.Add (FOPM.Strings[i]);
          TissVlrTotOpm := CurrToStr (FTissOpmUti.TissVlrTotOPM);
          FGeral.Add ('</ansTISS:OPM>');
          FGeral.Add ('<ansTISS:valorTotalOPM>' + TissVlrTotOpm + '</ansTISS:valorTotalOPM>');
          FGeral.Add ('</ansTISS:OPMUtilizada>');
        end;

      FGeral.Add('<ansTISS:valorTotal>');

      FGeral.Add('<ansTISS:servicosExecutados>'+CurrToStr(TissProc.TissValorTotalServicos)+'</ansTISS:servicosExecutados>');
      FGeral.Add('<ansTISS:diarias>'+CurrToStr(TissProc.TissValorTotalDiarias)+'</ansTISS:diarias>');
      FGeral.Add('<ansTISS:taxas>'+CurrToStr(TissProc.TissValorTotalTaxas)+'</ansTISS:taxas>');
      FGeral.Add('<ansTISS:materiais>'+CurrToStr(TissProc.TissValorTotalMateriais)+'</ansTISS:materiais>');
      FGeral.Add('<ansTISS:medicamentos>'+CurrToStr(TissProc.TissValorTotalMedicamentos)+'</ansTISS:medicamentos>');
      FGeral.Add('<ansTISS:gases>'+CurrToStr(TissProc.TissValorTotalGases)+'</ansTISS:gases>');
      FGeral.Add('<ansTISS:totalGeral>'+CurrToStr(TissProc.TissValorTotalGeral)+'</ansTISS:totalGeral>');  
      FGeral.Add('</ansTISS:valorTotal>');
      if FTissConfSP_SADT.TissUsarObs  then      
        FGeral.Add('<ansTISS:observacao>'+FObservacao+'</ansTISS:observacao>');
      FGeral.Add('</ansTISS:guiaSP_SADT>');
      FGuia.Clear;
      FProc.Clear;
      FMembEquipe.Clear;
      FOPM.Clear;
      FOutDesp.Clear;


      //AssignFile(arquivoTemp,'temp.xml');
      //Reset(arquivoTemp);
//      CloseFile(arquivoTemp);
    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao acessar arquivo:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);

        end;
    end;
end;

procedure TTissSP_SADT.finalizaProc;
begin

end;

procedure TTissSP_SADT.GerarXml;
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



      //AssignFile(arquivoTemp,'temp.xml');
      //Reset(arquivoTemp);

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
//      CloseFile(arquivoTemp);
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

    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao acessar arquivo:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        
        end;
    end;        

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

      if Tissconfig.TissCabecalho.TissArqNomeHash then
        begin
          //ShowMessage(copy(ExtractFileName(Tisscabecalho.TissArquivo),1,length(ExtractFileName(Tisscabecalho.TissArquivo))-4));
          //RenameFile(Tisscabecalho.TissArquivo,copy(ExtractFileName(Tisscabecalho.TissArquivo),1,length(ExtractFileName(Tisscabecalho.TissArquivo))-4)+ numhash+'.xml');
         try

           if not TissConfig.TissCabecalho.TissUsarNomeArqu then
             begin 
               RenameFile(Tisscabecalho.TissArquivo,ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml');
               FTissCabecalho.TissArquivo := ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml';
               //RenameFile(Tisscabecalho.TissArquivo,ExtractFilePath(Tisscabecalho.TissArquivo)+'_'+ numhash+'.xml');
               //FTissCabecalho.TissArquivo := ExtractFilePath(Tisscabecalho.TissArquivo)+'_'+ numhash+'.xml';
             end
           else
             begin
               nomearq := copy(ExtractFileName(Tisscabecalho.TissArquivo),1,length(ExtractFileName(Tisscabecalho.TissArquivo))-4);
               //RenameFile(Tisscabecalho.TissArquivo,nomearq+ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml');
               //FTissCabecalho.TissArquivo := nomearq+ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml';
               RenameFile(Tisscabecalho.TissArquivo,nomearq+ExtractFilePath(Tisscabecalho.TissArquivo)+'_'+ numhash+'.xml');
               FTissCabecalho.TissArquivo := nomearq+ExtractFilePath(Tisscabecalho.TissArquivo)+'_'+ numhash+'.xml';
             end;

           //RenameFile(Tisscabecalho.TissArquivo,ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml');
           //FTissCabecalho.TissArquivo := ExtractFilePath(Tisscabecalho.TissArquivo)+RetZero(Tisscabecalho.TissSequencialTrans,Tisscabecalho.TissZerosArq)+'_'+ numhash+'.xml';
         except
           on e:exception do
             begin
               Application.MessageBox(Pchar('Erro ao renomear o arquivo: '+ #13+ e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);               
             end;
         end;

        end;

end;
function TTissSP_SADT.hash(arquivohash: string): String;
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


procedure TTissSP_SADT.iniciaSPSADT;
begin
  FCabecalho := TStringList.Create;
  FTissSPSADT := TStringList.create;
  FGuia := TStringList.Create;
  FProc := TStringList.Create;
  FMembEquipe := TStringList.Create;
  FGeral := TStringList.Create;
  FGeral := TStringList.Create;
  FOPM := TStringList.Create;
  FOPM.Clear;
  FOutDesp := TStringList.Create;
  FOutDesp.Clear;
  FGeral.Clear;
  FMembEquipe.Clear;
  FProc.Clear;
  FGuia.Clear;
  FCabecalho.Clear;
  FTissSPSADT.Clear;
 
end;

procedure TTissSP_SADT.setAnsVersaoxsd(const Value: TTissAnsVersao);
begin
  FAnsVersaoxsd := Value;
end;

procedure TTissSP_SADT.setcaraAtend(const Value: String);
begin
  FcaraAtend := Value;
end;

procedure TTissSP_SADT.setCNPJCPF(const Value: String);
begin
  FCNPJCPF := Value;
end;

procedure TTissSP_SADT.setDataAtend(const Value: TDateTime);
begin
  FDataAtend := Value;
end;

procedure TTissSP_SADT.setDataEmis(const Value: TDateTime);
begin
  FDataEmis := Value;
end;

procedure TTissSP_SADT.SetFontePagadora(const Value: TTissIdentFontPag);
begin
  FFontePagadora := Value;
end;

procedure TTissSP_SADT.setDataAut(const Value: TDateTime);
begin
  FDataAut := Value;
end;


procedure TTissSP_SADT.setHoraAtend(const Value: TDateTime);
begin
  FHoraAtend := Value;
end;

procedure TTissSP_SADT.setindicClinica(const Value: String);
begin
  FindicClinica := Value;
end;

procedure TTissSP_SADT.setNumGuiaOper(const Value: String);
begin
  FNumGuiaOper := Value;
end;

procedure TTissSP_SADT.setNumGuiaPrest(const Value: String);
begin
  FNumGuiaPrest := Value;
end;

procedure TTissSP_SADT.setNumGuiaPrinc(const Value: String);
begin
  FNumGuiaPrinc := Value;
end;

procedure TTissSP_SADT.setNumLote(const Value: String);
begin
  FNumLote := Value;
end;

procedure TTissSP_SADT.setNomeAplica(const Value: String);
begin
  FNomeAplica := Value;
end;

procedure TTissSP_SADT.setVersaoAplica(const Value: String);
begin
  FVersaoAplica := Value;
end;

procedure TTissSP_SADT.setFabricaAplica(const Value: String);
begin
  FFabricaAplica := Value;
end;

procedure TTissSP_SADT.setObservacao(const Value: String);
begin
  FObservacao := Value;
end;

{procedure TTissSP_SADT.setRegANS(const Value: String);
begin
  FRegANS := Value;
end;}

procedure TTissSP_SADT.setSenhaAut(const Value: String);
begin
  FSenhaAut := Value;
end;

procedure TTissSP_SADT.setSenhaValid(const Value: TDateTime);
begin
  FSenhaValid := Value;
end;

procedure TTissSP_SADT.setTipoAtend(const Value: integer);
begin
  FTipoAtend := Value;
end;

procedure TTissSP_SADT.setTipoSaida(const Value: String);
begin
  FTipoSaida := Value;
end;

procedure TTissSP_SADT.setTipoSP(const Value: TpessoaSP_SADT);
begin
  FTipoSP := Value;
end;  

function TTissSP_SADT.TiraMascara(Texto: String): String;
var
  aux: string;
  i: integer;
begin
  Aux := '';
  for i :=1 to Length(Texto) do
  begin
    if (texto[i] in ['0'..'9']) then
    begin
      Aux := Aux + copy(texto,i,1);
    end;
  end;
  Result := Aux;
end;

procedure TTissSP_SADT.ClearDespesas;
begin
  TissProc.TissValorTotalServicos := 0;
  TissProc.TissValorTotalDiarias := 0;
  TissProc.TissValorTotalTaxas := 0;
  TissProc.TissValorTotalMateriais := 0;
  TissProc.TissValorTotalMedicamentos := 0;
  TissProc.TissValorTotalGases := 0;
end;

end.

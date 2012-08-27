unit TissConsulta;

interface
  
uses
  SysUtils, Classes,Windows,Dialogs,Messages,forms,xmldom, XMLIntf, msxmldom, XMLDoc,untTissComp,Graphics;
  {COMPONENTE INICIADO POR Fabiano
  Espero ter ajudado alguem com este componente, e
  espero que mais progrmadores se juntem nesta idéia
  para assim realizarmo o projeto TISS com sucesso,
  pela graça de Maria e o amor de Nosso Senhor JESUS CRISTO}
const
  MSG_TOVALIDATE_PTBR = 'A SER VALIDADO';
  MSG_ISVALID_PTBR    = 'VÁLIDO';
  MSG_ISNTVALID_PTBR  = 'INVÁLIDO';  
type
  Tpessoa = (Fisico,Juridico,Outro);
  TTissConsulta = class(TComponent)
  private
    { Private declarations }
    FEncoding: String;
    FVersaoXml: String;
    FMensagemTissXml: String;
    FTipoTrans: String;
    FSequencialTrans: String;
    FArquivo: String;
    FDataRegistroTrans: TDateTime;
    FHoraRegistroTrans: TDateTime;
    FTipo: Tpessoa;
    FCNPJCPF: String;
    FVersaoTISS: String;
    FRegANS: String;
    FNomeAplica: string;
    FVersaoAplica: string;
    FFabricaAplica: string;
    FDataEmis : TDateTime;
    FNumLote: String;
    FNumPres: String;
    FNumGuia: String;
    FNumCarteira: String;
    FPaciente: String;
    FNomePlano: String;
    FValidadeCart: TDateTime;
    FNumCNS: String;
    FNomeContradado: String;
    FtipoLogradouro: String;
    FLogradouro: String;
    FEndNum: String;
    FComplemento: String;
    FcodigoIBGE: Currency;
    FMunicipio: String;
    FUF: String;
    fCEP: String;
    fCNES: Currency;

    fCodigoTabela: Integer;
    fUFCONSELHO: String;
    fSIGLACONSELHO: String;
    fCIDNomeTab: String;
    fCIDDescDiag: String;
    FTipoSaida: String;
    FCodProc: String;
    fNUMEROCONSELHO: String;
    FMedico: String;
    FTipoConsulta: String;
    fCIDCodDiag: String;
    fdataAtendimento: TDateTime;
    FTissReq: TTissReq;
    FCompVersao: TCompVersao;
    FTissValid: TTissValidacao;
    FEvolucaoValor: Currency;
    FIndicAcid: String;
    FUnidTemp: String;
    FTipDoenca: String;
    FObs: String;
    FArqNomeHash: Boolean;
    FZerosArq: integer;
    Fvalidado: Boolean;
    FAnsVersaoxsd: TTissAnsVersao;

    procedure setEncoding(const Value: String);
    procedure setVersaoXml(const Value: String);
    procedure setMensagemTissXml(const Value: String);
    procedure setTipoTrans(const Value: String);

    procedure setSequencialTrans(const Value: String);
    procedure setArquivo(const Value: String);
    procedure setDataRegistroTrans(const Value: TDateTime);
    procedure setHoraRegistroTrans(const Value: TDateTime);
    procedure setTipo(const Value: Tpessoa);
    procedure setCNPJCPF(const Value: String);
    function RegANS: String;
    procedure setRegANS(const Value: String);
    procedure setDataEmis(const Value: TDateTime);
    procedure setVersaoTISS(const Value: String);
    procedure setNomeAplica(const Value: String);
    procedure setVersaoAplica(const Value: String);
    procedure setFabricaAplica(const Value: String);
    procedure setNumLote(const Value: String);
    procedure setNumPres(const Value: String);
    procedure setNumGuia(const Value: String);
    procedure setNumCarteira(const Value: String);
    procedure setPaciente(const Value: String);
    procedure setNomePlano(const Value: String);
    procedure setValidadeCart(const Value: TDateTime);
    procedure setNumCNS(const Value: String);
    procedure setNomeContradado(const Value: String);
    procedure settipoLogradouro(const Value: String);
    procedure setLogradouro(const Value: String);
    procedure setComplemento(const Value: String);
    procedure setEndNum(const Value: String);
    procedure setcodigoIBGE(const Value: Currency);
    procedure setMunicipio(const Value: String);
    procedure setUF(const Value: String);
    procedure setCEP(const Value: String);
    procedure setCNES(const Value: Currency);

    procedure setCIDCodDiag(const Value: String);
    procedure setCIDDescDiag(const Value: String);
    procedure setCIDNomeTab(const Value: String);
    procedure setCodigoTabela(const Value: Integer);
    procedure setCodProc(const Value: String);
    procedure setdataAtendimento(const Value: TDateTime);
    procedure setMEDICO(const Value: String);
    procedure setNUMEROCONSELHO(const Value: String);
    procedure setSIGLACONSELHO(const Value: String);
    procedure setTipoConsulta(const Value: String);
    procedure setTipoSaida(const Value: String);
    procedure setUFCONSELHO(const Value: String);
    function TiraMascara(Texto: String): String;
    function hash(arquivohash:string): String;
    procedure Verifica; 
    procedure setEvolucaoValor(const Value: Currency);
    procedure setIndicAcid(const Value: String);
    procedure setUnidTemp(const Value: String);
    procedure setTipDoenca(const Value: String);
    procedure setObs(const Value: String);
    procedure setFArqNomeHash(const Value: Boolean);
    procedure SetZerosArq(const Value: integer);
    procedure setvalidado(const Value: Boolean);
    procedure setAnsVersaoxsd(const Value: TTissAnsVersao);
  private
    FFontePadora: TTissIdentFontPag;
    fCBOS: String;
    procedure SetFontePagora(const Value: TTissIdentFontPag);
    procedure setCBOS(const Value: String);
    property validado: Boolean read Fvalidado write setvalidado;
  protected
    { Protected declarations }

  public
    { Public declarations } 

    procedure criaCabecalho;
    procedure criaRodape;    
    procedure adicionarGuia;
    constructor Create(Aowner: TComponent);override;
    function arqvalidado: Boolean;

  published
    { Published declarations }
    //versão do xsd da ANS
    property ansVersaoXSD: TTissAnsVersao read FAnsVersaoxsd write setAnsVersaoxsd;
    //fonte pagadora
    property TissFontePadora: TTissIdentFontPag read FFontePadora write SetFontePagora;
    property Versao:TCompVersao read FCompVersao write FCompVersao;
    property TissVersaoXml: String read FVersaoXml write setVersaoXml;
    property TissVersaoTISS: String read FVersaoTISS write setVersaoTISS;
    property TissNomeAplica: String read FNomeAplica write setNomeAplica;
    property TissVersaoAplica: String read FVersaoAplica write setVersaoAplica;
    property TissFabricaAplica: String read FFabricaAplica write setFabricaAplica;
    property TissEncoding:String read FEncoding write setEncoding;
    property TissMensagemTissXml:String read FMensagemTissXml write setMensagemTissXml;
    property TissTipoTrans:String read FTipoTrans write setTipoTrans;
    property TissArquivo:String read FArquivo write setArquivo;
    property TissDataRegistroTrans:TDateTime read FDataRegistroTrans write setDataRegistroTrans;
    property TissHoraRegistroTrans:TDateTime read FHoraRegistroTrans write setHoraRegistroTrans;
    property TissSequencialTrans:String read FSequencialTrans write setSequencialTrans;
    property TissTipo:Tpessoa read FTipo write setTipo;
    property TissCNPJCPF:String read FCNPJCPF write setCNPJCPF;
    property TissRegANS:String read FRegANS write setRegANS;
    property TissDataEmis:TDateTime read FDataEmis write setDataEmis;
    property TissNumLote:String read FNumLote write setNumLote;
    property TissNumPres:String read FNumPres write setNumPres;
    property TissNumGuia:String read FNumGuia write setNumGuia;
    property TissNumCarteira:String read FNumCarteira write setNumCarteira;
    property TissPaciente:String read FPaciente write setPaciente;
    property TissNomePlano:String read FNomePlano write setNomePlano;
    property TissValidadeCart:TDateTime read FValidadeCart write setValidadeCart;
    property TissNumCNS:String read FNumCNS write setNumCNS;
    property TissNomeContradado:String read FNomeContradado write setNomeContradado;
    property TisstipoLogradouro:String read FtipoLogradouro write settipoLogradouro;
    property TissLogradouro:String read FLogradouro write setLogradouro;
    property TissEndNum:String read FEndNum write setEndNum;
    property TissComplemento:String read FComplemento write setComplemento;
    property TisscodigoIBGE:Currency read FcodigoIBGE write setcodigoIBGE;
    property TissMunicipio:String read FMunicipio write setMunicipio;
    property TissUF:String read FUF write setUF;
    property TissCEP:String read fCEP write setCEP;
    property TissCNES:Currency read fCNES write setCNES;
    property TissMEDICO:String read FMedico write setMEDICO;
    property TissSIGLACONSELHO:String read fSIGLACONSELHO write setSIGLACONSELHO;
    property TissNUMEROCONSELHO:String read fNUMEROCONSELHO write setNUMEROCONSELHO;
    property TissUFCONSELHO:String read fUFCONSELHO write setUFCONSELHO;
    property TissCBOS:String read fCBOS write setCBOS;
    property TissCIDNomeTab:String read fCIDNomeTab write setCIDNomeTab;
    property TissCIDCodDiag:String read fCIDCodDiag write setCIDCodDiag;
    property TissCIDDescDiag:String read fCIDDescDiag write setCIDDescDiag;
    property TissdataAtendimento:TDateTime read fdataAtendimento write setdataAtendimento;
    property TissCodigoTabela:Integer read fCodigoTabela write setCodigoTabela;
    property TissCodProc:String read FCodProc write setCodProc;
    property TissTipoConsulta:String read FTipoConsulta write setTipoConsulta;
    property TissTipoSaidaa:String read FTipoSaida write setTipoSaida;

    
    //Hipotese diagnostica
    //property TissHipoteseDiag:String read FHipoteseDiag write setHipoteseDiag;
    property TissEvolucaoValor:Currency read FEvolucaoValor write setEvolucaoValor;
    property TissUnidTemp:String read FUnidTemp write setUnidTemp;
    property TissIndicAcid:String read FIndicAcid write setIndicAcid;
    property TissTipDoenca:String read FTipDoenca write setTipDoenca;
    
    //observacao
    property TissObs:String read FObs write setObs;
    property TissConfig: TTissReq read FTissReq write FTissReq;
    //Validação
    property TissValid: TTissValidacao read FTissValid write FTissValid;

    //zeros na formação do arquivo
    property TissZerosArq: integer read FZerosArq write SetZerosArq;    
  end;

procedure Register;

implementation

uses Md5tiss, U_Ciphertiss, md52, untValida, untFunc;

procedure Register;
begin
  RegisterComponents('Tiss', [TTissConsulta]);
end;

procedure TTissConsulta.adicionarGuia;
var
  arquivo: TextFile;
begin
    try
      AssignFile(arquivo,FArquivo);
      Append(arquivo);
      Writeln(arquivo,'<ansTISS:guiaConsulta>');
      Writeln(arquivo,'<ansTISS:identificacaoGuia>');
      if (FAnsVersaoxsd <> v2_01_03) then
        begin
          Writeln(arquivo,'<ansTISS:identificacaoFontePagadora>');
          case FTissReq.PadraoTipFontPg of
            RegistroANS: Writeln(arquivo,'<ansTISS:registroANS>'+FFontePadora.TissRegAns+'</ansTISS:registroANS>');
            CNPJ: Writeln(arquivo,'<ansTISS:cnpjFontePagadora>'+FFontePadora.TissCnpj+'</ansTISS:cnpjFontePagadora>');
          end;    
          Writeln(arquivo,'</ansTISS:identificacaoFontePagadora>');
        end;      
      if FTissReq.UsarRegANS then
        if FAnsVersaoxsd = v2_01_03 then        
          Writeln(arquivo,'<ansTISS:registroANS>'+fRegAns+'</ansTISS:registroANS>');
      if FansVersaoXSD = v2_01_03 then
        Writeln(arquivo,'<ansTISS:dataEmissaoGuia>'+FormatDateTime('DD/MM/YYYY',FDataEmis)+'</ansTISS:dataEmissaoGuia>')
      else
        Writeln(arquivo,'<ansTISS:dataEmissaoGuia>'+FormatDateTime('YYYY-MM-DD',FDataEmis)+'</ansTISS:dataEmissaoGuia>');

      if FTissReq.UsarNumPres then
        Writeln(arquivo,'<ansTISS:numeroGuiaPrestador>'+FNumPres+'</ansTISS:numeroGuiaPrestador>');
      if FTissReq.UsarNumGuia then
        Writeln(arquivo,'<ansTISS:numeroGuiaOperadora>'+FNumGuia+'</ansTISS:numeroGuiaOperadora>');
      Writeln(arquivo,'</ansTISS:identificacaoGuia>');
      Writeln(arquivo,'<ansTISS:beneficiario>');
      if FTissReq.UsarNumCarteira then
        Writeln(arquivo,'<ansTISS:numeroCarteira>'+FNumCarteira+'</ansTISS:numeroCarteira>');
      if FTissReq.UsarPaciente then
        Writeln(arquivo,'<ansTISS:nomeBeneficiario>'+FPaciente+'</ansTISS:nomeBeneficiario>');
      if FTissReq.UsarNomePlano then
        Writeln(arquivo,'<ansTISS:nomePlano>'+FNomePlano+'</ansTISS:nomePlano>');
      if FTissReq.UsarValidadeCart then
        begin
          if FansVersaoXSD = v2_01_03 then
            Writeln(arquivo,'<ansTISS:validadeCarteira>'+FormatDateTime('DD/MM/YYYY',FValidadeCart)+'</ansTISS:validadeCarteira>')
          else
            Writeln(arquivo,'<ansTISS:validadeCarteira>'+FormatDateTime('YYYY-MM-DD',FValidadeCart)+'</ansTISS:validadeCarteira>');
        end;
      if FTissReq.UsarNumCNS then
        Writeln(arquivo,'<ansTISS:numeroCNS>'+FNumCNS+'</ansTISS:numeroCNS>');

      Writeln(arquivo,'</ansTISS:beneficiario>');

      Writeln(arquivo,'<ansTISS:dadosContratado>');
      Writeln(arquivo,'<ansTISS:identificacao>');
      if FTissReq.UsarCNPJCPF then
        begin
          if FTipo = Juridico then
            Writeln(arquivo,'<ansTISS:CNPJ>'+FCNPJCPF+'</ansTISS:CNPJ>');
          if FTipo = Fisico then
            Writeln(arquivo,'<ansTISS:CPF>'+FCNPJCPF+'</ansTISS:CPF>');
          if FTipo = Outro then
            Writeln(arquivo,'<ansTISS:codigoPrestadorNaOperadora>'+FCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
        end;

      Writeln(arquivo,'</ansTISS:identificacao>');
      if FTissReq.UsarNomeContradado then
        Writeln(arquivo,'<ansTISS:nomeContratado>'+FNomeContradado+'</ansTISS:nomeContratado>');

      if FTissReq.UsarEndContratado then
        begin
          Writeln(arquivo,'<ansTISS:enderecoContratado>');
          if FTissReq.UsartipoLogradouro then
            Writeln(arquivo,'<ansTISS:tipoLogradouro>'+FtipoLogradouro+'</ansTISS:tipoLogradouro>');
          if FTissReq.UsarLogradouro then
            Writeln(arquivo,'<ansTISS:logradouro>'+FLogradouro+'</ansTISS:logradouro>');
          if FTissReq.UsarEndNum then
            Writeln(arquivo,'<ansTISS:numero>'+FEndNum+'</ansTISS:numero>');
          if FTissReq.UsarComplemento then
            Writeln(arquivo,'<ansTISS:complemento>'+FComplemento+'</ansTISS:complemento>');
          if FTissReq.UsarcodigoIBGE then
            Writeln(arquivo,'<ansTISS:codigoIBGEMunicipio>'+FormatFloat('0000000',FcodigoIBGE)+'</ansTISS:codigoIBGEMunicipio>');
          if FTissReq.UsarMunicipio then
            Writeln(arquivo,'<ansTISS:municipio>'+FMunicipio+'</ansTISS:municipio>');
          if FTissReq.UsarUF then
            Writeln(arquivo,'<ansTISS:codigoUF>'+FUF+'</ansTISS:codigoUF>');
          if FTissReq.UsarCEP then
            Writeln(arquivo,'<ansTISS:cep>'+fCEP+'</ansTISS:cep>');

          Writeln(arquivo,'</ansTISS:enderecoContratado>');
        end;
      if FTissReq.UsarCNES then
        Writeln(arquivo,'<ansTISS:numeroCNES>'+FormatFloat('0000000', fCNES)+'</ansTISS:numeroCNES>');

      Writeln(arquivo,'</ansTISS:dadosContratado>');

      Writeln(arquivo,'<ansTISS:profissionalExecutante>');
      if FTissReq.UsarMEDICO then
        Writeln(arquivo,'<ansTISS:nomeProfissional>'+fMEDICO+'</ansTISS:nomeProfissional>');

      Writeln(arquivo,'<ansTISS:conselhoProfissional>');
      if FTissReq.UsarSIGLACONSELHO then
        Writeln(arquivo,'<ansTISS:siglaConselho>'+fSIGLACONSELHO+'</ansTISS:siglaConselho>');
      if FTissReq.UsarNUMEROCONSELHO then
        Writeln(arquivo,'<ansTISS:numeroConselho>'+fNUMEROCONSELHO+'</ansTISS:numeroConselho>');
      if FTissReq.UsarUFCONSELHO then
        Writeln(arquivo,'<ansTISS:ufConselho>'+fUFCONSELHO+'</ansTISS:ufConselho>');

      Writeln(arquivo,'</ansTISS:conselhoProfissional>');
      if FTissReq.UsarCBOS then
        Writeln(arquivo,'<ansTISS:cbos>'+fCBOS+'</ansTISS:cbos>');

      Writeln(arquivo,'</ansTISS:profissionalExecutante>');

      if FTissReq.UsarHipoteseDiag then
        begin
          Writeln(arquivo,'<ansTISS:hipoteseDiagnostica>');
          Writeln(arquivo,'<ansTISS:CID>');
          if FTissReq.UsarCIDNomeTab then
            Writeln(arquivo,'<ansTISS:nomeTabela>'+fCIDNomeTab+'</ansTISS:nomeTabela>');
          if FTissReq.UsarCIDCodDiag then
            Writeln(arquivo,'<ansTISS:codigoDiagnostico>'+fCIDCodDiag+'</ansTISS:codigoDiagnostico>');
          if FTissReq.UsarCIDDescDiag then
            Writeln(arquivo,'<ansTISS:descricaoDiagnostico>'+fCIDDescDiag+'</ansTISS:descricaoDiagnostico>');
          Writeln(arquivo,'</ansTISS:CID>');
          if FTissReq.UsarTipDoenca then
            Writeln(arquivo,'<ansTISS:tipoDoenca>'+FTipDoenca+'</ansTISS:tipoDoenca>');
          Writeln(arquivo,'<ansTISS:tempoReferidoEvolucaoDoenca>');
            if FTissReq.UsarEvolucaoValor then
              Writeln(arquivo,'<ansTISS:valor>'+CurrToStr(FEvolucaoValor)+'</ansTISS:valor>');
            if FTissReq.UsarUnidTemp then
              Writeln(arquivo,'<ansTISS:unidadeTempo>'+FUnidTemp+'</ansTISS:unidadeTempo>');
          Writeln(arquivo,'</ansTISS:tempoReferidoEvolucaoDoenca>');
          if FTissReq.UsarIndicAcid then
            Writeln(arquivo,'<ansTISS:indicadorAcidente>'+FIndicAcid+'</ansTISS:indicadorAcidente>');
          Writeln(arquivo,'</ansTISS:hipoteseDiagnostica>');
        end;

      Writeln(arquivo,'<ansTISS:dadosAtendimento>');
      if FTissReq.UsardataAtendimento then
        begin
          if FAnsVersaoxsd = v2_01_03 then
            Writeln(arquivo,'<ansTISS:dataAtendimento>'+FormatDateTime('DD/MM/YYYY',fdataAtendimento)+'</ansTISS:dataAtendimento>')
          else
            Writeln(arquivo,'<ansTISS:dataAtendimento>'+FormatDateTime('YYYY-MM-DD',fdataAtendimento)+'</ansTISS:dataAtendimento>');
        end;

      Writeln(arquivo,'<ansTISS:procedimento>');
      if FTissReq.UsarCodigoTabela then
        Writeln(arquivo,'<ansTISS:codigoTabela>'+FormatFloat('00',fCodigoTabela)+'</ansTISS:codigoTabela>');
      if FTissReq.UsarCodProc then
        Writeln(arquivo,'<ansTISS:codigoProcedimento>'+TiraMascara(FCodProc)+'</ansTISS:codigoProcedimento>');

      Writeln(arquivo,'</ansTISS:procedimento>');
      if FTissReq.UsarTipoConsulta then
        Writeln(arquivo,'<ansTISS:tipoConsulta>'+FTipoConsulta+'</ansTISS:tipoConsulta>');
      if FTissReq.UsarTipoSaidaa then
        Writeln(arquivo,'<ansTISS:tipoSaida>'+FTipoSaida+'</ansTISS:tipoSaida>');

      Writeln(arquivo,'</ansTISS:dadosAtendimento>');
      if FTissReq.UsarObs then
        Writeln(arquivo,'<ansTISS:observacao>'+FObs+'</ansTISS:observacao>');
      Writeln(arquivo,'</ansTISS:guiaConsulta>');
      CloseFile(arquivo);
    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao criar arquivo:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;
end;

function TTissConsulta.arqvalidado: Boolean;
begin
  result := Fvalidado;
end;

constructor TTissConsulta.create(Aowner: TComponent);
begin
  FZerosArq := 20;
  FEncoding:='ISO-8859-1';
  FVersaoXml:='1.0';
  FVersaoTISS:='2.02.03';
  FTipo:=Juridico;
  FMensagemTissXml:='xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ansTISS="http://www.ans.gov.br/padroes/tiss/schemas"';
  FTissReq := TTissReq.Create;
  FCompVersao := TCompVersao.create;
  FTissValid := TTissValidacao.create;
  FFontePadora := TTissIdentFontPag.Create;
  FAnsVersaoxsd := v2_02_03;
  // FBusca := TBusca.Create(self);
  inherited;
end;


{ TTissConsulta }

procedure TTissConsulta.criaCabecalho;
var
  arquivo: TextFile;
begin
  DecimalSeparator := '.';
  if Trim(FArquivo) = '' then
    begin
      Application.MessageBox('Informe o arquivo xml a ser criado!!!','ATENÇÃO',MB_OK+MB_ICONEXCLAMATION);
      Abort;
    end;
    try
      AssignFile(arquivo,FArquivo);
      Rewrite(arquivo);
      Append(arquivo);
      Writeln(arquivo,'<?xml version="'+FVersaoXml+'" encoding="'+FEncoding+'" ?>');
      Writeln(arquivo,'<ansTISS:mensagemTISS '+FMensagemTissXml+'>');
      Writeln(arquivo,'<ansTISS:cabecalho>');
    //TAG IDENTIFICAÇÃO DA TRANSAÇÃO
      Writeln(arquivo,'<ansTISS:identificacaoTransacao>');
      


      Writeln(arquivo,'<ansTISS:tipoTransacao>'+FTipoTrans+'</ansTISS:tipoTransacao>');
      if FTissReq.UsarSequencialTrans then
        Writeln(arquivo,'<ansTISS:sequencialTransacao>'+FSequencialTrans+'</ansTISS:sequencialTransacao>');
      if FTissReq.UsarDataRegistroTrans then
        begin
          if FAnsVersaoxsd = v2_01_03 then
            Writeln(arquivo,'<ansTISS:dataRegistroTransacao>'+FormatDateTime('DD/MM/YYYY',FDataRegistroTrans)+'</ansTISS:dataRegistroTransacao>')
          else
            Writeln(arquivo,'<ansTISS:dataRegistroTransacao>'+FormatDateTime('YYYY-MM-DD',FDataRegistroTrans)+'</ansTISS:dataRegistroTransacao>');
        end;
      if FTissReq.UsarHoraRegistroTrans then
        begin
          if FAnsVersaoxsd = v2_01_03 then
            Writeln(arquivo,'<ansTISS:horaRegistroTransacao>'+FormatDateTime('hh:mm',FHoraRegistroTrans)+'</ansTISS:horaRegistroTransacao>')
          else
            Writeln(arquivo,'<ansTISS:horaRegistroTransacao>'+FormatDateTime('hh:mm:ss',FHoraRegistroTrans)+'</ansTISS:horaRegistroTransacao>');
        end;

      Writeln(arquivo,'</ansTISS:identificacaoTransacao>');

      //TAG ORIGEM
      Writeln(arquivo,'<ansTISS:origem>');
      Writeln(arquivo,'<ansTISS:codigoPrestadorNaOperadora>');
      if FTissReq.UsarCNPJCPF then
        begin
          if FTipo = Juridico then
            Writeln(arquivo,'<ansTISS:CNPJ>'+FCNPJCPF+'</ansTISS:CNPJ>');

          if FTipo = Fisico then
            Writeln(arquivo,'<ansTISS:CPF>'+FCNPJCPF+'</ansTISS:CPF>');

          if FTipo = Outro then
            Writeln(arquivo,'<ansTISS:codigoPrestadorNaOperadora>'+FCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
        end;

       // mmCabecalho.Lines.Add('<ansTISS:codigoPrestadorNaOperadora>'+fdsFaturamentoREGPRESTADORA.AsString+'</ansTISS:codigoPrestadorNaOperadora>');
      Writeln(arquivo,'</ansTISS:codigoPrestadorNaOperadora>');
      Writeln(arquivo,'</ansTISS:origem>');
      Writeln(arquivo,'<ansTISS:destino>');
      if FTissReq.UsarRegANS then
        Writeln(arquivo,'<ansTISS:registroANS>'+fRegANS+'</ansTISS:registroANS>');
      Writeln(arquivo,'</ansTISS:destino>');

      Writeln(arquivo,'<ansTISS:versaoPadrao>'+FVersaoTISS+'</ansTISS:versaoPadrao>');
      // identificacao Software Gerador
      case ansVersaoXSD of
        v2_02_02,v2_02_03:
          begin
            Writeln(arquivo,'<ansTISS:identificacaoSoftwareGerador>');
            Writeln(arquivo,'<ansTISS:nomeAplicativo>'+FNomeAplica+'</ansTISS:nomeAplicativo>');
            Writeln(arquivo,'<ansTISS:versaoAplicativo>'+FVersaoAplica+'</ansTISS:versaoAplicativo>');
            Writeln(arquivo,'<ansTISS:fabricanteAplicativo>'+FFabricaAplica+'</ansTISS:fabricanteAplicativo>');
            Writeln(arquivo,'</ansTISS:identificacaoSoftwareGerador>');
          end;
      end;

      Writeln(arquivo,'</ansTISS:cabecalho>');

      Writeln(arquivo,'<ansTISS:prestadorParaOperadora>');
      Writeln(arquivo,'<ansTISS:loteGuias>');
      if FTissReq.UsarNumLote then
        Writeln(arquivo,'<ansTISS:numeroLote>'+FNumLote+'</ansTISS:numeroLote>');
      Writeln(arquivo,'<ansTISS:guias>');
      Writeln(arquivo,'<ansTISS:guiaFaturamento>');
      CloseFile(arquivo);
    except
      on e: Exception do
        begin
          Application.MessageBox(PChar('Erro ao acessar arquivo:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
        end;
    end;      

end;

procedure TTissConsulta.criaRodape;
var
  arquivo,arquivoTemp: TextFile;
  numhash,linha,nomeArq: string;
  TrocaString: TStringList;
begin
    try
      Fvalidado := False;
      AssignFile(arquivo,FArquivo);
      Append(arquivo);
      Writeln(arquivo,'</ansTISS:guiaFaturamento>');
      Writeln(arquivo,'</ansTISS:guias>');
      Writeln(arquivo,'</ansTISS:loteGuias>');
      Writeln(arquivo,'</ansTISS:prestadorParaOperadora>');

      Writeln(arquivo,'</ansTISS:mensagemTISS>');

      CloseFile(arquivo);
      AssignFile(arquivoTemp,'temp.xml');
      Rewrite(arquivoTemp);

      numhash := hash(FArquivo);

      AssignFile(arquivo,FArquivo);
      Reset(arquivo);
      while not Eof(arquivo) do
        begin
          Readln(arquivo,linha);
          if (linha <> '</ansTISS:mensagemTISS>') and
             (linha <> '</ans:mensagemTISS>') then
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

      AssignFile(arquivo,FArquivo);
      Rewrite(arquivo);
      while not Eof(arquivoTemp) do
        begin
           Readln(arquivoTemp,linha);
           Writeln(arquivo,linha);
        end;
      CloseFile(arquivo);
      CloseFile(arquivoTemp);
      {Troca String <ansTISS></ansTISS> por <ans></ans>
       para as Versões 2.01.03,2.02.01}
      if (FAnsVersaoxsd <> v2_02_02) and (FAnsVersaoxsd <> v2_02_03)then
        begin
          TrocaString := TStringList.Create;
          TrocaString.Clear;
          try
            TrocaString.LoadFromFile(TissArquivo);
            TrocaString.Text := StringReplace(TrocaString.Text,'ansTISS','ans',[rfignorecase,rfreplaceall]);
            TrocaString.SaveToFile(TissArquivo);
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
              if FileExists(TissArquivo) then
                begin
                  Memo1.Text := fileValidate(TissArquivo,FTissValid.TissXSD);
                  if ( Memo1.Text = EmptyStr ) then
                  begin
                    lblInfo.Caption := MSG_ISVALID_PTBR;
                    lblInfo.Font.Color := clGreen;
                    Fvalidado := True;

                  end
                  else
                  begin
                    lblInfo.Caption := MSG_ISNTVALID_PTBR;
                    lblInfo.Font.Color := clRed;
                    Fvalidado := True;
                  end;
                end;
            end;
          frmValida.ShowModal;
        finally
          FreeAndNil(frmValida);
        end;
      end;
      if TissConfig.UsarArqNomeHash then
        begin
           try
             if not TissConfig.UsarNomeArq then
               begin
                 RenameFile(FArquivo,ExtractFilePath(FArquivo)+RetZero(TissSequencialTrans,TissZerosArq)+'_'+ numhash+'.xml');
                 TissArquivo := ExtractFilePath(FArquivo)+RetZero(TissSequencialTrans,TissZerosArq)+'_'+ numhash+'.xml';
               end
             else
               begin
                 nomearq := copy(ExtractFileName(FArquivo),1,length(ExtractFileName(FArquivo))-4);
                 RenameFile(FArquivo,nomeArq + ExtractFilePath(FArquivo)+RetZero(TissSequencialTrans,TissZerosArq)+'_'+ numhash+'.xml');
                 TissArquivo := nomeArq + ExtractFilePath(FArquivo)+RetZero(TissSequencialTrans,TissZerosArq)+'_'+ numhash+'.xml';                 
               end;

           except
             on e:exception do
               begin
                 Application.MessageBox(Pchar('Erro ao renomear o arquivo: '+ #13+ e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
               end;
           end;
        end; 
end;



function TTissConsulta.hash(arquivohash:string): String;
var
  arquivo: TextFile;
  MD5: TMD5;
  xml: TXMLDocument;
  TrocaString: TStringList;
begin
  {Troca String <ansTISS></ansTISS> por <ans></ans>
   para as Versões 2.01.03,2.02.01}
  if (FAnsVersaoxsd <> v2_02_02) and (FAnsVersaoxsd <> v2_02_03)then
    begin
      TrocaString := TStringList.Create;
      TrocaString.Clear;
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

function TTissConsulta.RegANS: String;
begin

end;

procedure TTissConsulta.setDataEmis(const Value: TDateTime);
begin
  FDataEmis := Value;
end;

procedure TTissConsulta.setAnsVersaoxsd(const Value: TTissAnsVersao);
begin
  FAnsVersaoxsd := Value;
end;

procedure TTissConsulta.setArquivo(const Value: String);
begin
  FArquivo := Value;
end;


procedure TTissConsulta.setCBOS(const Value: String);
begin
  fCBOS := Value;
end;

procedure TTissConsulta.setCEP(const Value: String);
begin
  fCEP := Value;
end;

procedure TTissConsulta.setCIDCodDiag(const Value: String);
begin
  fCIDCodDiag := Value;
end;

procedure TTissConsulta.setCIDDescDiag(const Value: String);
begin
  fCIDDescDiag := Value;
end;

procedure TTissConsulta.setCIDNomeTab(const Value: String);
begin
  fCIDNomeTab := Value;
end;

procedure TTissConsulta.setCNES(const Value: Currency);
begin
  fCNES := Value;
end;

procedure TTissConsulta.setCNPJCPF(const Value: String);
begin
  FCNPJCPF := Value;
end;

procedure TTissConsulta.setcodigoIBGE(const Value: Currency);
begin
  FcodigoIBGE := Value;
end;

procedure TTissConsulta.setCodigoTabela(const Value: Integer);
begin
  fCodigoTabela := Value;
end;

procedure TTissConsulta.setCodProc(const Value: String);
begin
  FCodProc := Value;
end;

procedure TTissConsulta.setComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TTissConsulta.setdataAtendimento(const Value: TDateTime);
begin
  fdataAtendimento := Value;
end;

procedure TTissConsulta.setDataRegistroTrans(const Value: TDateTime);
begin
  FDataRegistroTrans := Value;
end;



procedure TTissConsulta.setEncoding(const Value: String);
begin
  FEncoding := Value;
end;



procedure TTissConsulta.setEndNum(const Value: String);
begin
  FEndNum := Value;
end;

procedure TTissConsulta.setEvolucaoValor(const Value: Currency);
begin
  FEvolucaoValor := Value;
end;



procedure TTissConsulta.setFArqNomeHash(const Value: Boolean);
begin
  FArqNomeHash := Value;
end;

procedure TTissConsulta.SetFontePagora(const Value: TTissIdentFontPag);
begin
  FFontePadora := Value;
end;

procedure TTissConsulta.setHoraRegistroTrans(const Value: TDateTime);
begin
  FHoraRegistroTrans := value;
end;

procedure TTissConsulta.setIndicAcid(const Value: String);
begin
  FIndicAcid := Value;
end;

procedure TTissConsulta.setLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TTissConsulta.setMEDICO(const Value: String);
begin
  FMedico := Value;
end;

procedure TTissConsulta.setMensagemTissXml(const Value: String);
begin
  FMensagemTissXml := Value;
end;

procedure TTissConsulta.setMunicipio(const Value: String);
begin
  FMunicipio := Value;
end;

procedure TTissConsulta.setNomeContradado(const Value: String);
begin
  FNomeContradado := Value;
end;

procedure TTissConsulta.setNomePlano(const Value: String);
begin
  FNomePlano := Value;
end;

procedure TTissConsulta.setNumCarteira(const Value: String);
begin
  FNumCarteira := Value;
end;

procedure TTissConsulta.setNumCNS(const Value: String);
begin
  FNumCNS := Value;
end;

procedure TTissConsulta.setNUMEROCONSELHO(const Value: String);
begin
  fNUMEROCONSELHO := Value;
end;

procedure TTissConsulta.setNumPres(const Value: String);
begin
  FNumPres := Value;
end;

procedure TTissConsulta.setNumGuia(const Value: String);
begin
  FNumGuia := Value;
end;

procedure TTissConsulta.setNumLote(const Value: String);
begin
  FNumLote := Value;
end;

procedure TTissConsulta.setObs(const Value: String);
begin
  FObs := Value;
end;

procedure TTissConsulta.setPaciente(const Value: String);
begin
  FPaciente := Value;
end;

procedure TTissConsulta.setRegANS(const Value: String);
begin
  FRegANS := Value;
end;

procedure TTissConsulta.setSequencialTrans(const Value: String);
begin
  FSequencialTrans := Value;
end;



procedure TTissConsulta.setSIGLACONSELHO(const Value: String);
begin
  fSIGLACONSELHO := Value;
end;

procedure TTissConsulta.setTipDoenca(const Value: String);
begin
  FTipDoenca := Value;
end;

procedure TTissConsulta.setTipo(const Value: Tpessoa);
begin
  FTipo := Value;
end;

procedure TTissConsulta.setTipoConsulta(const Value: String);
begin
  FTipoConsulta := Value;
end;

procedure TTissConsulta.settipoLogradouro(const Value: String);
begin
  FtipoLogradouro := Value;
end;

procedure TTissConsulta.setTipoSaida(const Value: String);
begin
  FTipoSaida := Value;
end;

procedure TTissConsulta.setTipoTrans(const Value: String);
begin
  FTipoTrans := Value;
end;


procedure TTissConsulta.setUF(const Value: String);
begin
  FUF := Value;
end;

procedure TTissConsulta.setUFCONSELHO(const Value: String);
begin
  fUFCONSELHO := Value;
end;

procedure TTissConsulta.setUnidTemp(const Value: String);
begin
  FUnidTemp := Value;
end;

procedure TTissConsulta.setValidadeCart(const Value: TDateTime);
begin
  FValidadeCart := Value;
end;

procedure TTissConsulta.setvalidado(const Value: Boolean);
begin
  Fvalidado := Value;
end;

procedure TTissConsulta.setVersaoTISS(const Value: String);
begin
  FVersaoTISS := Value;
end;

procedure TTissConsulta.setNomeAplica(const Value: String);
begin
  FNomeAplica := Value;
end;

procedure TTissConsulta.setVersaoAplica(const Value: String);
begin
  FVersaoAplica := Value;
end;

procedure TTissConsulta.setFabricaAplica(const Value: String);
begin
  FFabricaAplica := Value;
end;

procedure TTissConsulta.setVersaoXml(const Value: String);
begin
  FVersaoXml := Value;
end;

procedure TTissConsulta.SetZerosArq(const Value: integer);
begin
  FZerosArq := Value;
end;

function TTissConsulta.TiraMascara(Texto: String): String;
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

procedure TTissConsulta.Verifica;
begin
  {if FTissReq.UsarCBOS = True then
    begin
      if  fCBOS = 0 then
        begin
          Application.MessageBox('Informe o CBOS','ATENÇÃO',MB_OK+MB_ICONEXCLAMATION);
          Abort;
        end;
    end;
    //TA EM FASE DE DESENVOLVIMENTO ESTA ROTINA
  {FComplemento:= True;
  FNomeContradado:= True;
  FHoraRegistroTrans:= True;
  fCNES:= True;
  FTissReq:= True;
  FMedico:= True;
  FValidadeCart:= True;
  fCEP:= True;
  FCNPJCPF:= True;
  FTipo:= True;
  FNumLote:= True;
  FCodProc:= True;
  fCIDCodDiag:= True;
  fCodigoTabela:= True;
  FTipoSaida:= True;
  FMunicipio:= True;
  FtipoLogradouro:= True;
  fCIDNomeTab:= True;
  FSequencialTrans:= True;
  fSIGLACONSELHO:= True;
  FNomePlano:= True;
  FDataRegistroTrans:= True;
  FRegANS:= True;
  FTipoConsulta:= True;
  FEndNum:= True;
  FNumCNS:= True;
  FNumGuia:= True;
  FUF:= True;
  FPaciente:= True;
  fUFCONSELHO:= True;
  fCIDDescDiag:= True;
  FNumCarteira:= True;
  FcodigoIBGE:= True;
  FLogradouro:= True;
  fNUMEROCONSELHO:= True;
  fdataAtendimento:= True;
  FTipoTrans:= True;}
end;

end.

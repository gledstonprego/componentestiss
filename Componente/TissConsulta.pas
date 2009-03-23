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
    FDataEmis : TDateTime;
    FNumLote: String;
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
    procedure setNumLote(const Value: String);
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
      Writeln(arquivo,'<ans:guiaConsulta>');
      Writeln(arquivo,'<ans:identificacaoGuia>');
      if FAnsVersaoxsd = v2_02_01 then
        begin
          Writeln(arquivo,'<ans:identificacaoFontePagadora>');
          case FTissReq.PadraoTipFontPg of
            RegistroANS: Writeln(arquivo,'<ans:registroANS>'+FFontePadora.TissRegAns+'</ans:registroANS>');
            CNPJ: Writeln(arquivo,'<ans:cnpjFontePagadora>'+FFontePadora.TissCnpj+'</ans:cnpjFontePagadora>');
          end;    
          Writeln(arquivo,'</ans:identificacaoFontePagadora>');
        end;      
      if FTissReq.UsarRegANS then
        if FAnsVersaoxsd = v2_01_03 then        
          Writeln(arquivo,'<ans:registroANS>'+fRegAns+'</ans:registroANS>');
      case FansVersaoXSD of
          //v2_01_02: Writeln(arquivo,'<ans:dataEmissaoGuia>'+FormatDateTime('YYYY-MM-DD',FDataEmis)+'</ans:dataEmissaoGuia>');
          v2_01_03: Writeln(arquivo,'<ans:dataEmissaoGuia>'+FormatDateTime('DD/MM/YYYY',FDataEmis)+'</ans:dataEmissaoGuia>');
          v2_02_01: Writeln(arquivo,'<ans:dataEmissaoGuia>'+FormatDateTime('YYYY-MM-DD',FDataEmis)+'</ans:dataEmissaoGuia>');
        end;

      if FTissReq.UsarNumGuia then
        Writeln(arquivo,'<ans:numeroGuiaPrestador>'+FNumGuia+'</ans:numeroGuiaPrestador>');
      if FTissReq.UsarNumGuia then
        Writeln(arquivo,'<ans:numeroGuiaOperadora>'+FNumGuia+'</ans:numeroGuiaOperadora>');
      Writeln(arquivo,'</ans:identificacaoGuia>');
      Writeln(arquivo,'<ans:beneficiario>');
      if FTissReq.UsarNumCarteira then
        Writeln(arquivo,'<ans:numeroCarteira>'+FNumCarteira+'</ans:numeroCarteira>');
      if FTissReq.UsarPaciente then
        Writeln(arquivo,'<ans:nomeBeneficiario>'+FPaciente+'</ans:nomeBeneficiario>');
      if FTissReq.UsarNomePlano then
        Writeln(arquivo,'<ans:nomePlano>'+FNomePlano+'</ans:nomePlano>');
      if FTissReq.UsarValidadeCart then
        begin
          case FansVersaoXSD of
            v2_01_03: Writeln(arquivo,'<ans:validadeCarteira>'+FormatDateTime('DD/MM/YYYY',FValidadeCart)+'</ans:validadeCarteira>');
            v2_02_01: Writeln(arquivo,'<ans:validadeCarteira>'+FormatDateTime('YYYY-MM-DD',FValidadeCart)+'</ans:validadeCarteira>');
          end;

        end;
      if FTissReq.UsarNumCNS then
        Writeln(arquivo,'<ans:numeroCNS>'+FNumCNS+'</ans:numeroCNS>');

      Writeln(arquivo,'</ans:beneficiario>');

      Writeln(arquivo,'<ans:dadosContratado>');
      Writeln(arquivo,'<ans:identificacao>');
      if FTissReq.UsarCNPJCPF then
        begin
          if FTipo = Juridico then
            Writeln(arquivo,'<ans:CNPJ>'+FCNPJCPF+'</ans:CNPJ>');
          if FTipo = Fisico then
            Writeln(arquivo,'<ans:CPF>'+FCNPJCPF+'</ans:CPF>');
          if FTipo = Outro then
            Writeln(arquivo,'<ans:codigoPrestadorNaOperadora>'+FCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
        end;

      Writeln(arquivo,'</ans:identificacao>');
      if FTissReq.UsarNomeContradado then
        Writeln(arquivo,'<ans:nomeContratado>'+FNomeContradado+'</ans:nomeContratado>');

      if FTissReq.UsarEndContratado then
        begin
          Writeln(arquivo,'<ans:enderecoContratado>');
          if FTissReq.UsartipoLogradouro then
            Writeln(arquivo,'<ans:tipoLogradouro>'+FtipoLogradouro+'</ans:tipoLogradouro>');
          if FTissReq.UsarLogradouro then
            Writeln(arquivo,'<ans:logradouro>'+FLogradouro+'</ans:logradouro>');
          if FTissReq.UsarEndNum then
            Writeln(arquivo,'<ans:numero>'+FEndNum+'</ans:numero>');
          if FTissReq.UsarComplemento then
            Writeln(arquivo,'<ans:complemento>'+FComplemento+'</ans:complemento>');
          if FTissReq.UsarcodigoIBGE then
            Writeln(arquivo,'<ans:codigoIBGEMunicipio>'+FormatFloat('0000000',FcodigoIBGE)+'</ans:codigoIBGEMunicipio>');
          if FTissReq.UsarMunicipio then
            Writeln(arquivo,'<ans:municipio>'+FMunicipio+'</ans:municipio>');
          if FTissReq.UsarUF then
            Writeln(arquivo,'<ans:codigoUF>'+FUF+'</ans:codigoUF>');
          if FTissReq.UsarCEP then
            Writeln(arquivo,'<ans:cep>'+fCEP+'</ans:cep>');

          Writeln(arquivo,'</ans:enderecoContratado>');
        end;
      if FTissReq.UsarCNES then
        Writeln(arquivo,'<ans:numeroCNES>'+FormatFloat('0000000', fCNES)+'</ans:numeroCNES>');

      Writeln(arquivo,'</ans:dadosContratado>');

      Writeln(arquivo,'<ans:profissionalExecutante>');
      if FTissReq.UsarMEDICO then
        Writeln(arquivo,'<ans:nomeProfissional>'+fMEDICO+'</ans:nomeProfissional>');

      Writeln(arquivo,'<ans:conselhoProfissional>');
      if FTissReq.UsarSIGLACONSELHO then
        Writeln(arquivo,'<ans:siglaConselho>'+fSIGLACONSELHO+'</ans:siglaConselho>');
      if FTissReq.UsarNUMEROCONSELHO then
        Writeln(arquivo,'<ans:numeroConselho>'+fNUMEROCONSELHO+'</ans:numeroConselho>');
      if FTissReq.UsarUFCONSELHO then
        Writeln(arquivo,'<ans:ufConselho>'+fUFCONSELHO+'</ans:ufConselho>');

      Writeln(arquivo,'</ans:conselhoProfissional>');
      if FTissReq.UsarCBOS then
        Writeln(arquivo,'<ans:cbos>'+fCBOS+'</ans:cbos>');

      Writeln(arquivo,'</ans:profissionalExecutante>');

      if FTissReq.UsarHipoteseDiag then
        begin
          Writeln(arquivo,'<ans:hipoteseDiagnostica>');
          Writeln(arquivo,'<ans:CID>');
          if FTissReq.UsarCIDNomeTab then
            Writeln(arquivo,'<ans:nomeTabela>'+fCIDNomeTab+'</ans:nomeTabela>');
          if FTissReq.UsarCIDCodDiag then
            Writeln(arquivo,'<ans:codigoDiagnostico>'+fCIDCodDiag+'</ans:codigoDiagnostico>');
          if FTissReq.UsarCIDDescDiag then
            Writeln(arquivo,'<ans:descricaoDiagnostico>'+fCIDDescDiag+'</ans:descricaoDiagnostico>');
          Writeln(arquivo,'</ans:CID>');
          if FTissReq.UsarTipDoenca then
            Writeln(arquivo,'<ans:tipoDoenca>'+FTipDoenca+'</ans:tipoDoenca>');
          Writeln(arquivo,'<ans:tempoReferidoEvolucaoDoenca>');
            if FTissReq.UsarEvolucaoValor then
              Writeln(arquivo,'<ans:valor>'+CurrToStr(FEvolucaoValor)+'</ans:valor>');
            if FTissReq.UsarUnidTemp then
              Writeln(arquivo,'<ans:unidadeTempo>'+FUnidTemp+'</ans:unidadeTempo>');
          Writeln(arquivo,'</ans:tempoReferidoEvolucaoDoenca>');
          if FTissReq.UsarIndicAcid then
            Writeln(arquivo,'<ans:indicadorAcidente>'+FIndicAcid+'</ans:indicadorAcidente>');
          Writeln(arquivo,'</ans:hipoteseDiagnostica>');
        end;

      Writeln(arquivo,'<ans:dadosAtendimento>');
      if FTissReq.UsardataAtendimento then
        begin
          case FAnsVersaoxsd of
            v2_01_03: Writeln(arquivo,'<ans:dataAtendimento>'+FormatDateTime('DD/MM/YYYY',fdataAtendimento)+'</ans:dataAtendimento>');
            v2_02_01: Writeln(arquivo,'<ans:dataAtendimento>'+FormatDateTime('YYYY-MM-DD',fdataAtendimento)+'</ans:dataAtendimento>');
          end;

        end;

      Writeln(arquivo,'<ans:procedimento>');
      if FTissReq.UsarCodigoTabela then
        Writeln(arquivo,'<ans:codigoTabela>'+FormatFloat('00',fCodigoTabela)+'</ans:codigoTabela>');
      if FTissReq.UsarCodProc then
        Writeln(arquivo,'<ans:codigoProcedimento>'+TiraMascara(FCodProc)+'</ans:codigoProcedimento>');

      Writeln(arquivo,'</ans:procedimento>');
      if FTissReq.UsarTipoConsulta then
        Writeln(arquivo,'<ans:tipoConsulta>'+FTipoConsulta+'</ans:tipoConsulta>');
      if FTissReq.UsarTipoSaidaa then
        Writeln(arquivo,'<ans:tipoSaida>'+FTipoSaida+'</ans:tipoSaida>');

      Writeln(arquivo,'</ans:dadosAtendimento>');
      if FTissReq.UsarObs then
        Writeln(arquivo,'<ans:observacao>'+FObs+'</ans:observacao>');
      Writeln(arquivo,'</ans:guiaConsulta>');
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
  FVersaoTISS:='2.02.01';
  FTipo:=Juridico;
  FMensagemTissXml:='xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.ans.gov.br/padroes/tiss/schemas"';
  FTissReq := TTissReq.Create;
  FCompVersao := TCompVersao.create;
  FTissValid := TTissValidacao.create;
  FFontePadora := TTissIdentFontPag.Create;
  FAnsVersaoxsd := v2_02_01;
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
      Writeln(arquivo,'<ans:mensagemTISS '+FMensagemTissXml+'>');
      Writeln(arquivo,'<ans:cabecalho>');
    //TAG IDENTIFICAÇÃO DA TRANSAÇÃO
      Writeln(arquivo,'<ans:identificacaoTransacao>');
      


      Writeln(arquivo,'<ans:tipoTransacao>'+FTipoTrans+'</ans:tipoTransacao>');
      if FTissReq.UsarSequencialTrans then
        Writeln(arquivo,'<ans:sequencialTransacao>'+FSequencialTrans+'</ans:sequencialTransacao>');
      if FTissReq.UsarDataRegistroTrans then
        begin
          case FAnsVersaoxsd of
            v2_01_03: Writeln(arquivo,'<ans:dataRegistroTransacao>'+FormatDateTime('DD/MM/YYYY',FDataRegistroTrans)+'</ans:dataRegistroTransacao>');
            v2_02_01: Writeln(arquivo,'<ans:dataRegistroTransacao>'+FormatDateTime('YYYY-MM-DD',FDataRegistroTrans)+'</ans:dataRegistroTransacao>');
          end;

        end;
      if FTissReq.UsarHoraRegistroTrans then
        begin
          case FAnsVersaoxsd of
            v2_01_03: Writeln(arquivo,'<ans:horaRegistroTransacao>'+FormatDateTime('hh:mm',FHoraRegistroTrans)+'</ans:horaRegistroTransacao>');
            v2_02_01: Writeln(arquivo,'<ans:horaRegistroTransacao>'+FormatDateTime('hh:mm:ss',FHoraRegistroTrans)+'</ans:horaRegistroTransacao>');
          end;

        end;

      Writeln(arquivo,'</ans:identificacaoTransacao>');

      //TAG ORIGEM
      Writeln(arquivo,'<ans:origem>');
      Writeln(arquivo,'<ans:codigoPrestadorNaOperadora>');
      if FTissReq.UsarCNPJCPF then
        begin
          if FTipo = Juridico then
            Writeln(arquivo,'<ans:CNPJ>'+FCNPJCPF+'</ans:CNPJ>');

          if FTipo = Fisico then
            Writeln(arquivo,'<ans:CPF>'+FCNPJCPF+'</ans:CPF>');

          if FTipo = Outro then
            Writeln(arquivo,'<ans:codigoPrestadorNaOperadora>'+FCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
        end;

       // mmCabecalho.Lines.Add('<ans:codigoPrestadorNaOperadora>'+fdsFaturamentoREGPRESTADORA.AsString+'</ans:codigoPrestadorNaOperadora>');
      Writeln(arquivo,'</ans:codigoPrestadorNaOperadora>');
      Writeln(arquivo,'</ans:origem>');
      Writeln(arquivo,'<ans:destino>');
      if FTissReq.UsarRegANS then
        Writeln(arquivo,'<ans:registroANS>'+fRegANS+'</ans:registroANS>');
      Writeln(arquivo,'</ans:destino>');

      Writeln(arquivo,'<ans:versaoPadrao>'+FVersaoTISS+'</ans:versaoPadrao>');

      Writeln(arquivo,'</ans:cabecalho>');

      Writeln(arquivo,'<ans:prestadorParaOperadora>');
      Writeln(arquivo,'<ans:loteGuias>');
      if FTissReq.UsarNumLote then
        Writeln(arquivo,'<ans:numeroLote>'+FNumLote+'</ans:numeroLote>');
      Writeln(arquivo,'<ans:guias>');
      Writeln(arquivo,'<ans:guiaFaturamento>');
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
begin
    try
      Fvalidado := True;
      AssignFile(arquivo,FArquivo);
      Append(arquivo);
      Writeln(arquivo,'</ans:guiaFaturamento>');
      Writeln(arquivo,'</ans:guias>');
      Writeln(arquivo,'</ans:loteGuias>');
      Writeln(arquivo,'</ans:prestadorParaOperadora>');  

      Writeln(arquivo,'</ans:mensagemTISS>');


      CloseFile(arquivo);
      AssignFile(arquivoTemp,'temp.xml');
      Rewrite(arquivoTemp);

      numhash := hash(FArquivo);
      
      AssignFile(arquivo,FArquivo);
      Reset(arquivo);
      while not Eof(arquivo) do
        begin
          Readln(arquivo,linha);
          if linha <> '</ans:mensagemTISS>' then
            Writeln(arquivotemp,linha);
        end;  
      CloseFile(arquivo);
              //TAG EPILOGO
      Writeln(arquivotemp,'<ans:epilogo>');
      Writeln(arquivotemp,'<ans:hash>'+numhash+'</ans:hash>');
      Writeln(arquivotemp,'</ans:epilogo>');
      Writeln(arquivotemp,'</ans:mensagemTISS>');
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

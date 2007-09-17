unit untTissComp;
                  
interface
uses
  SysUtils, Classes;
type
  TTissTipoGeral = (JuridicoGeral,FisicGeral,Outros);

  TTissTabela = class(TPersistent)
  private
    fCodigo: String;
    fDescricao: String;
    fTipTab: String;
    procedure setCodigo(const Value: String);
    procedure setDescricao(const Value: String);
    procedure setTipTab(const Value: String);
  public

  published
    property TissCodigo:String read fCodigo write setCodigo;
    property TissTipTab:String read fTipTab write setTipTab;
    property TissDescricao:String read fDescricao write setDescricao;
  end;

  TTissOpm = class(TPersistent)
  private
    fOpm: TTissTabela;
    fVlrTot: Currency;
    fVlrUn: Currency;
    fqtde: Currency;
    fCodBar: String;
    procedure setCodBar(const Value: String);
    procedure setqtde(const Value: Currency);
    procedure setVlrTot(const Value: Currency);
    procedure setVlrUn(const Value: Currency);
  public
    constructor create;
  published
    property TissTabOpm:TTissTabela read fOpm write fOpm;
    property Tissqtde:Currency read fqtde write setqtde;
    property TissCodBar:String read fCodBar write setCodBar;
    property TissVlrUn:Currency read fVlrUn write setVlrUn;
    property TissVlrTot:Currency read fVlrTot write setVlrTot;
  end;

  TTissOpmUti = class(TPersistent)
  private
    fOpm: TTissOpm;
    fVlrTotOPM: Currency;
    procedure setVlrTotOPM(const Value: Currency);
  public
    constructor create;
  published
    property TissOpm:TTissOpm read fOpm write fOpm;
    property TissVlrTotOPM:Currency read fVlrTotOPM write setVlrTotOPM;
  end;

  TTissDespesas = class(TPersistent)
  private
    fIdentCodigo: String;
    fIdentTipoTab: String;
    fIdentDesc: String;
    fredAcres: Currency;
    fVlrTot: Currency;
    fQtde: Currency;
    fVlrUn: Currency;
    fTipDespesa: integer;
    fHoraFinal: TDateTime;
    fDataReal: TDateTime;
    fHoraInicial: TDateTime;
    procedure setIdentCodigo(const Value: String);
    procedure setIdentDesc(const Value: String);
    procedure setIdentTipoTab(const Value: String);
    procedure setDataReal(const Value: TDateTime);
    procedure setHoraFinal(const Value: TDateTime);
    procedure setHoraInicial(const Value: TDateTime);
    procedure setQtde(const Value: Currency);
    procedure setredAcres(const Value: Currency);
    procedure setTipDespesa(const Value: integer);
    procedure setVlrTot(const Value: Currency);
    procedure setVlrUn(const Value: Currency);

  public
    constructor create;
  published
    //identificador despesa
    property TissIdentCodigo:String read fIdentCodigo write setIdentCodigo;
    property TissIdentTipoTab:String read fIdentTipoTab write setIdentTipoTab;
    property TissIdentDesc:String read fIdentDesc write setIdentDesc;
    property TissTipDespesa:integer read fTipDespesa write setTipDespesa;
    property TissDataReal:TDateTime read fDataReal write setDataReal;
    property TissHoraInicial:TDateTime read fHoraInicial write setHoraInicial;
    property TissHoraFinal:TDateTime read fHoraFinal write setHoraFinal;
    property TissredAcres:Currency read fredAcres write setredAcres;
    property TissQtde:Currency read fQtde write setQtde;
    property TissVlrUn:Currency read fVlrUn write setVlrUn;
    property TissVlrTot:Currency read fVlrTot write setVlrTot;
  end;

  TTissOutrasDesp = class(TPersistent)
  private
    fTotalGeral: Currency;
    fTissDespesas: TTissDespesas;
    procedure setTotalGeral(const Value: Currency);
  public
    constructor create;
  published
    property TissTotalGeral:Currency read fTotalGeral write setTotalGeral;
    property TissDespesa:TTissDespesas read fTissDespesas write fTissDespesas;

  end;

  TTissDiagGuia = class(TPersistent)
  private
    fCIDNomeTab: String;
    fCIDDescDiag: String;
    fCIDCodDiag: String;
    procedure setCIDCodDiag(const Value: String);
    procedure setCIDDescDiag(const Value: String);
    procedure setCIDNomeTab(const Value: String);

  public
    constructor create;
  published
    property TissCIDNomeTab:String read fCIDNomeTab write setCIDNomeTab;
    property TissCIDCodDiag:String read fCIDCodDiag write setCIDCodDiag;
    property TissCIDDescDiag:String read fCIDDescDiag write setCIDDescDiag;
  end;

  TTissObitoInt = class(TPersistent)
  private
    fCID: TTissDiagGuia;
    fnumeracaoDe: String;
    procedure setnumeracaoDe(const Value: String);

  public
    constructor create;
  published
    property TissCID:TTissDiagGuia read fCID write fCID;
    property TissnumeracaoDe: String read fnumeracaoDe write setnumeracaoDe; 
  end;

  TDiagSaidInt = class(TPersistent)
  private
    fIndicAcid: Integer;
    fMotSaidInt: String;
    fTissDiagGuia: TTissDiagGuia;
    fTissDiagSec: TTissDiagGuia;
    fObito: TTissObitoInt;
    procedure setIndicAcid(const Value: Integer);
    procedure setMotSaidInt(const Value: String);

  public
    constructor create;
  published
    property TissIndicAcid: Integer read fIndicAcid write setIndicAcid;
    property TissDiagPrinc:TTissDiagGuia read fTissDiagGuia write fTissDiagGuia;
    property TissDiagSec:TTissDiagGuia read fTissDiagSec write fTissDiagSec;
    property TissMotSaidInt:String read fMotSaidInt write setMotSaidInt;
    property TissObito:TTissObitoInt read fObito write fObito;
  end;



  TCompVersao = class(TPersistent)
  private
    Fversao: String;
    procedure setVersao(const Value: String);
  public
    constructor create;
  published
    property Versao:String read Fversao write setVersao;
  
  end;

  TTissValidacao = class(TPersistent)
  private
    FUsarValidacao: Boolean;
    Fxsd: String;
    procedure setUsarValidacao(const Value: Boolean);
    procedure setXsd(const Value: String);
  public
    constructor create;
  published
    property UsarValidacao:Boolean read FUsarValidacao write setUsarValidacao;
    property TissXSD:String read Fxsd write setXsd;  
  end;

  TTissProc = class(TPersistent)
  private
    fCodigo: String;
    fDescricao: String;
    fTipTabela: Integer;
    procedure setCodig(const Value: String);
    procedure setDescricao(const Value: String);
    procedure setTipTabela(const Value: Integer);

  public
    constructor create;
  published
    property TissCodigo:String read fCodigo write setCodig;
    property TissTipTabela:Integer read fTipTabela write setTipTabela;
    property TissDescricao:String read fDescricao write setDescricao;
  end;

  TTissDiagnostico = class(TPersistent)
  private
    fValor: integer;
    fIndicAcid: integer;
    fCIDNomeTab: String;
    fTipDoenc: String;
    fCIDDescDiag: String;
    fUnTemp: String;
    fCIDCodDiag: String;
    procedure setCIDCodDiag(const Value: String);
    procedure setCIDDescDiag(const Value: String);
    procedure setCIDNomeTab(const Value: String);
    procedure setIndicAcid(const Value: integer);
    procedure setTipDoenc(const Value: String);
    procedure setUnTemp(const Value: String);
    procedure setValor(const Value: integer); 
  public
    constructor create;
  published
    property TissCIDNomeTab:String read fCIDNomeTab write setCIDNomeTab;
    property TissCIDCodDiag:String read fCIDCodDiag write setCIDCodDiag;
    property TissCIDDescDiag:String read fCIDDescDiag write setCIDDescDiag;
    property TissValor:integer read fValor write setValor;
    property TissUnTemp:String read fUnTemp write setUnTemp; //A,M OU D
    property TissTipDoenc:String read fTipDoenc write setTipDoenc; //A,C
    property TissIndicAcid:integer read fIndicAcid write setIndicAcid; //0,1,2
  end;

  TTissProfissional = class(TPersistent)
  private
    fCBOS: Currency;
    fNumConselho: String;
    FProf: String;
    fUFConselho: String;
    fSiglaConselho: String;
    FPosicProf: Integer;
    procedure setCBOS(const Value: Currency);
    procedure setNumConselho(const Value: String);
    procedure setProf(const Value: String);
    procedure setSiglaConselho(const Value: String);
    procedure setUFConselho(const Value: String);
    procedure setPosicProf(const Value: Integer);

  public
    constructor create;
  published
    property TissProf:String read FProf write setProf;
    property TissSiglaConselho:String read fSiglaConselho write setSiglaConselho;
    property TissNumConselho:String read fNumConselho write setNumConselho;
    property TissUFConselho:String read fUFConselho write setUFConselho;
    property TissfCBOS:Currency read fCBOS write setCBOS;
    property TissPosicProf:Integer read FPosicProf write setPosicProf;

  end;

  TTissBenific = class(TPersistent)
  private
    FNumCNS: String;
    FNomePlano: String;
    FBenific: String;
    FNumCarteira: String;
    FValidadeCart: TDateTime;
    procedure setBenific(const Value: String);
    procedure setNomePlano(const Value: String);
    procedure setNumCarteira(const Value: String);
    procedure setNumCNS(const Value: String);
    procedure setValidadeCart(const Value: TDateTime);
  public
    constructor create;
  published
    property TissNumCarteira:String read FNumCarteira write setNumCarteira;
    property TissBenific:String read FBenific write setBenific;
    property TissNomePlano:String read FNomePlano write setNomePlano;
    property TissValidadeCart:TDateTime read FValidadeCart write setValidadeCart;
    property TissNumCNS:String read FNumCNS write setNumCNS;
  end;

  TTissCabecalho = class(TPersistent)
  private
    FEncoding: String;
    FVersaoXml: String;
    FMensagemTissXml: String;
    FArquivo: String;
    FArqNomeHash: boolean;
    FCNPJCPF: String;
    FRegANS: String;
    FSequencialTrans: String;
    FNumLote: String;
    FTipoTrans: String;
    FVersaoTISS: String;
    FDataRegistroTrans: TDateTime;
    FHoraRegistroTrans: TDateTime;
    FTipoGeral: TTissTipoGeral;
    FTissTipoGeral: TTissTipoGeral;
    FZerosArq: integer;
    procedure setArquivo(const Value: String);
    procedure setEncoding(const Value: String);
    procedure setMensagemTissXml(const Value: String);
    procedure setVersaoXml(const Value: String);
    procedure setCNPJCPF(const Value: String);
    procedure setDataRegistroTrans(const Value: TDateTime);
    procedure setHoraRegistroTrans(const Value: TDateTime);
    procedure setNumLote(const Value: String);
    procedure setRegANS(const Value: String);
    procedure setSequencialTrans(const Value: String);
    procedure setTipoTrans(const Value: String);
    procedure setVersaoTISS(const Value: String);
    procedure setTissTipoGeral(const Value: TTissTipoGeral);
    procedure setFArqNomeHash(const Value: Boolean);
    procedure SetZerosArq(const Value: integer);

  public
    constructor create;
  published
    property TissVersaoXml: String read FVersaoXml write setVersaoXml;  
    property TissEncoding:String read FEncoding write setEncoding;
    property TissMensagemTissXml:String read FMensagemTissXml write setMensagemTissXml;
    property TissArquivo:String read FArquivo write setArquivo;
    property TissTipoTrans:String read FTipoTrans write setTipoTrans;
    property TissDataRegistroTrans:TDateTime read FDataRegistroTrans write setDataRegistroTrans;
    property TissHoraRegistroTrans:TDateTime read FHoraRegistroTrans write setHoraRegistroTrans;
    property TissSequencialTrans:String read FSequencialTrans write setSequencialTrans;
    property TissCNPJCPF:String read FCNPJCPF write setCNPJCPF;
    property TissRegANS:String read FRegANS write setRegANS;
    property TissVersaoTISS: String read FVersaoTISS write setVersaoTISS;
    property TissNumLote:String read FNumLote write setNumLote;
    property TissTipoGeral:TTissTipoGeral read FTissTipoGeral write setTissTipoGeral;

    property TissZerosArq: integer read FZerosArq write SetZerosArq;



  end;

  TTissReq = class(TPersistent)
  private
    FUsarCBOS: Boolean;
    FComplemento: Boolean;
    FNomeContradado: Boolean;
    FHoraRegistroTrans: Boolean;
    fCNES: Boolean;
    FTissReq: Boolean;
    FMedico: Boolean;
    FValidadeCart: Boolean;
    fCEP: Boolean;
    FCNPJCPF: Boolean;
    FTipo: Boolean;
    FNumLote: Boolean;
    FCodProc: Boolean;
    fCIDCodDiag: Boolean;
    fCodigoTabela: Boolean;
    FTipoSaida: Boolean;
    FMunicipio: Boolean;
    FtipoLogradouro: Boolean;
    fCIDNomeTab: Boolean;
    FSequencialTrans: Boolean;
    fSIGLACONSELHO: Boolean;
    FNomePlano: Boolean;
    FDataRegistroTrans: Boolean;
    FRegANS: Boolean;
    FTipoConsulta: Boolean;
    FEndNum: Boolean;
    FNumCNS: Boolean;
    FNumGuia: Boolean;
    FUF: Boolean;
    FPaciente: Boolean;
    fUFCONSELHO: Boolean;
    fCIDDescDiag: Boolean;
    FNumCarteira: Boolean;
    FcodigoIBGE: Boolean;
    FLogradouro: Boolean;
    fNUMEROCONSELHO: Boolean;
    fdataAtendimento: Boolean;
    FTipoTrans: Boolean;
    FHipoteseDiag: Boolean;
    FTipDoenca: Boolean;
    FUnidTemp: Boolean;
    FIndicAcid: Boolean;
    FEvolucaoValor: Boolean;
    FObs: Boolean;
    FUsarEndContratado: Boolean;
    FNomeArqu: Boolean;
    FArqNomeHash: Boolean;
    procedure setFArqNomeHash(const Value: Boolean);    
    procedure SetUsarCBOS(const Value: Boolean);
    procedure setCEP(const Value: Boolean);
    procedure setCIDCodDiag(const Value: Boolean);
    procedure setCIDDescDiag(const Value: Boolean);
    procedure setCIDNomeTab(const Value: Boolean);
    procedure setCNES(const Value: Boolean);
    procedure setCNPJCPF(const Value: Boolean);
    procedure setcodigoIBGE(const Value: Boolean);
    procedure setCodigoTabela(const Value: Boolean);
    procedure setCodProc(const Value: Boolean);
    procedure setComplemento(const Value: Boolean);
    procedure setdataAtendimento(const Value: Boolean);
    procedure setDataRegistroTrans(const Value: Boolean);
    procedure setEndNum(const Value: Boolean);
    procedure setHoraRegistroTrans(const Value: Boolean);
    procedure setLogradouro(const Value: Boolean);
    procedure setMEDICO(const Value: Boolean);
    procedure setMunicipio(const Value: Boolean);
    procedure setNomeContradado(const Value: Boolean);
    procedure setNomePlano(const Value: Boolean);
    procedure setNumCarteira(const Value: Boolean);
    procedure setNumCNS(const Value: Boolean);
    procedure setNUMEROCONSELHO(const Value: Boolean);
    procedure setNumGuia(const Value: Boolean);
    procedure setNumLote(const Value: Boolean);
    procedure setPaciente(const Value: Boolean);
    procedure setRegANS(const Value: Boolean);
    procedure setSequencialTrans(const Value: Boolean);
    procedure setSIGLACONSELHO(const Value: Boolean);
    procedure setTipo(const Value: Boolean);
    procedure setTipoConsulta(const Value: Boolean);
    procedure settipoLogradouro(const Value: Boolean);
    procedure setTipoSaida(const Value: Boolean);

    procedure setUF(const Value: Boolean);
    procedure setUFCONSELHO(const Value: Boolean);
    procedure setValidadeCart(const Value: Boolean);
    procedure setTipoTrans(const Value: Boolean);
    procedure setHipoteseDiag(const Value: Boolean);
    procedure setEvolucaoValor(const Value: Boolean);
    procedure setIndicAcid(const Value: Boolean);
    procedure setTipDoenca(const Value: Boolean);
    procedure setUnidTemp(const Value: Boolean);
    procedure setObs(const Value: Boolean);
    procedure setUsarEndContratado(const Value: Boolean);
    procedure setNomeArq(const Value: Boolean);


  public
    constructor create;

  published
    property UsarCBOS: Boolean read FUsarCBOS write SetUsarCBOS;

    property UsarTipoTrans:Boolean read FTipoTrans write setTipoTrans;

    property UsarDataRegistroTrans:Boolean read FDataRegistroTrans write setDataRegistroTrans;
    property UsarHoraRegistroTrans:Boolean read FHoraRegistroTrans write setHoraRegistroTrans;
    property UsarSequencialTrans:Boolean read FSequencialTrans write setSequencialTrans;
    property UsarTipo:Boolean read FTipo write setTipo;
    property UsarCNPJCPF:Boolean read FCNPJCPF write setCNPJCPF;
    property UsarRegANS:Boolean read FRegANS write setRegANS;
    property UsarNumLote:Boolean read FNumLote write setNumLote;
    property UsarNumGuia:Boolean read FNumGuia write setNumGuia;
    property UsarNumCarteira:Boolean read FNumCarteira write setNumCarteira;
    property UsarPaciente:Boolean read FPaciente write setPaciente;
    property UsarNomePlano:Boolean read FNomePlano write setNomePlano;
    property UsarValidadeCart:Boolean read FValidadeCart write setValidadeCart;
    property UsarNumCNS:Boolean read FNumCNS write setNumCNS;
    property UsarNomeContradado:Boolean read FNomeContradado write setNomeContradado;
    property UsartipoLogradouro:Boolean read FtipoLogradouro write settipoLogradouro;
    property UsarLogradouro:Boolean read FLogradouro write setLogradouro;
    property UsarEndNum:Boolean read FEndNum write setEndNum;
    property UsarComplemento:Boolean read FComplemento write setComplemento;
    property UsarcodigoIBGE:Boolean read FcodigoIBGE write setcodigoIBGE;
    property UsarMunicipio:Boolean read FMunicipio write setMunicipio;
    property UsarUF:Boolean read FUF write setUF;
    property UsarCEP:Boolean read fCEP write setCEP;
    property UsarCNES:Boolean read fCNES write setCNES;
    property UsarMEDICO:Boolean read FMedico write setMEDICO;
    property UsarSIGLACONSELHO:Boolean read fSIGLACONSELHO write setSIGLACONSELHO;
    property UsarNUMEROCONSELHO:Boolean read fNUMEROCONSELHO write setNUMEROCONSELHO;
    property UsarUFCONSELHO:Boolean read fUFCONSELHO write setUFCONSELHO;

    property UsarCIDNomeTab:Boolean read fCIDNomeTab write setCIDNomeTab;
    property UsarCIDCodDiag:Boolean read fCIDCodDiag write setCIDCodDiag;
    property UsarCIDDescDiag:Boolean read fCIDDescDiag write setCIDDescDiag;
    property UsardataAtendimento:Boolean read fdataAtendimento write setdataAtendimento;
    property UsarCodigoTabela:Boolean read fCodigoTabela write setCodigoTabela;
    property UsarCodProc:Boolean read FCodProc write setCodProc;
    property UsarTipoConsulta:Boolean read FTipoConsulta write setTipoConsulta;
    property UsarTipoSaidaa:Boolean read FTipoSaida write setTipoSaida;
    property UsarPadroes: Boolean read FTissReq write FTissReq;
    property UsarHipoteseDiag: Boolean read FHipoteseDiag write setHipoteseDiag;

    property UsarEvolucaoValor:Boolean read FEvolucaoValor write setEvolucaoValor;
    property UsarIndicAcid:Boolean read FIndicAcid write setIndicAcid;
    property UsarUnidTemp:Boolean read FUnidTemp write setUnidTemp;
    property UsarTipDoenca:Boolean read FTipDoenca write setTipDoenca;
    property UsarObs:Boolean read FObs write setObs;
    property UsarEndContratado:Boolean read FUsarEndContratado write setUsarEndContratado;

    property UsarNomeArq:Boolean read FNomeArqu write setNomeArq;
    
    property UsarArqNomeHash:Boolean read FArqNomeHash write setFArqNomeHash;


  end;

  TTissContratado = class(TPersistent)
  private
    FcodigoIBGE: Currency;
    fCNES: Currency;
    FLogradouro: String;
    FComplemento: String;
    FNomeContradado: String;
    FtipoLogradouro: String;
    FEndNum: String;
    FCNPJCPF: String;
    FUF: String;
    fCEP: String;
    FMunicipio: String;
    FTissTipoGeral: TTissTipoGeral;
    procedure setCEP(const Value: String);
    procedure setCNES(const Value: Currency);
    procedure setCNPJCPF(const Value: String);
    procedure setcodigoIBGE(const Value: Currency);
    procedure setComplemento(const Value: String);
    procedure setEndNum(const Value: String);
    procedure setLogradouro(const Value: String);
    procedure setMunicipio(const Value: String);
    procedure setNomeContradado(const Value: String);
    procedure settipoLogradouro(const Value: String);
    procedure setTissTipoGeral(const Value: TTissTipoGeral);
    procedure setUF(const Value: String);

  public
    constructor create;
  published
    property TissTipoGeral:TTissTipoGeral read FTissTipoGeral write setTissTipoGeral;
    property TissCNPJCPF:String read FCNPJCPF write setCNPJCPF;
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
  end;


  TTissPrestExec = class(TPersistent)
  private
    FcodigoIBGE: Currency;
    fCNES: Currency;
    FLogradouro: String;
    FComplemento: String;
    FNomeContradado: String;
    FtipoLogradouro: String;
    FEndNum: String;
    FCNPJCPF: String;
    FUF: String;
    fCEP: String;
    FMunicipio: String;
    FTissTipoGeral: TTissTipoGeral;
    procedure setCEP(const Value: String);
    procedure setCNES(const Value: Currency);
    procedure setCNPJCPF(const Value: String);
    procedure setcodigoIBGE(const Value: Currency);
    procedure setComplemento(const Value: String);
    procedure setEndNum(const Value: String);
    procedure setLogradouro(const Value: String);
    procedure setMunicipio(const Value: String);
    procedure setNomeContradado(const Value: String);
    procedure settipoLogradouro(const Value: String);
    procedure setTissTipoGeral(const Value: TTissTipoGeral);
    procedure setUF(const Value: String);

  public
    constructor create;
  published
    property TissTipoGeral:TTissTipoGeral read FTissTipoGeral write setTissTipoGeral;
    property TissCNPJCPF:String read FCNPJCPF write setCNPJCPF;
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
  end;

  TTissEquipe = class(TPersistent)
  private
    FCodProf: String;
    FProfissional: TTissProfissional;
    FTipoMemb: TTissTipoGeral;
    procedure setCodProf(const Value: String);

  public
    constructor create;
  published
    property TissCodProf:String read FCodProf write setCodProf;
    property TissTipoMemb:TTissTipoGeral read FTipoMemb write FTipoMemb;
    property TissProfiss:TTissProfissional read FProfissional write FProfissional;
  end;

  TTissSPProcedimentos = class(TPersistent)
  private
    FEquipe: TTissEquipe;
    FProcs: TTissProc;
    FTissReducAcres: Currency;
    FTissQtde: Currency;
    FValorTotal: Currency;
    FTissValor: Currency;
    FTissTecUtil: string;
    FTissVdeAcesso: string;
    FTissData: TDateTime;
    FTissHsInicio: TDateTime;
    FTissHsFim: TDateTime;
    procedure SetTissData(const Value: TDateTime);
    procedure SetTissHsFim(const Value: TDateTime);
    procedure SetTissHsInicio(const Value: TDateTime);
    procedure setTissQtde(const Value: Currency);
    procedure setTissReducAcres(const Value: Currency);
    procedure setTissTecUtil(const Value: string);
    procedure setTissValor(const Value: Currency);
    procedure setTissVdeAcesso(const Value: string);
    procedure setValorTotal(const Value: Currency);

  public
    constructor create;
  published
    property TissEquipe:TTissEquipe read FEquipe write FEquipe;
    property TissProcs:TTissProc read FProcs write FProcs;
    property TissData:TDateTime read FTissData write SetTissData;
    property TissHsInicio:TDateTime read FTissHsInicio write SetTissHsInicio;
    property TissHsFim:TDateTime read FTissHsFim write SetTissHsFim;
    property TissQtde:Currency read FTissQtde write setTissQtde;
    property TissVdeAcesso:string read FTissVdeAcesso write setTissVdeAcesso;
    property TissTecUtil:string read FTissTecUtil write setTissTecUtil;
    property TissReducAcres:Currency read FTissReducAcres write setTissReducAcres;
    property TissValor:Currency read FTissValor write setTissValor;
    property TissValorTotal:Currency read FValorTotal write setValorTotal;
  end;

  function RetZero(ZEROS: string;QUANT:integer): string;

implementation

  function RetZero(ZEROS: string;QUANT:integer): string;
  var
    I,Tamanho:integer;
    aux: string;
  begin
    aux:=zeros;
    Tamanho:=length(ZEROS);
    ZEROS:='';
    for I:=1 to quant-tamanho do
    ZEROS:=ZEROS+'0';
    aux:=zeros+aux;
    RetZero:=aux;
  end;


{ TTissReq }

constructor TTissReq.create;
begin
  inherited;
  FArqNomeHash := true;
  FNomeArqu := false;
  FUsarCBOS := True;
  FComplemento:= True;
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
  FTipoTrans:= True;
  FHipoteseDiag := True;
  FEvolucaoValor := True;
  FIndicAcid := True;
  FUnidTemp := True;
  FTipDoenca := True;
  FObs := True;
  FUsarEndContratado := True;
end;

procedure TTissReq.setCEP(const Value: Boolean);
begin
  fCEP := Value;
end;

procedure TTissReq.setCIDCodDiag(const Value: Boolean);
begin
  fCIDCodDiag := Value;
end;

procedure TTissReq.setCIDDescDiag(const Value: Boolean);
begin
  fCIDDescDiag := Value;
end;

procedure TTissReq.setCIDNomeTab(const Value: Boolean);
begin
  fCIDNomeTab := Value;
end;

procedure TTissReq.setCNES(const Value: Boolean);
begin
  fCNES := Value;
end;

procedure TTissReq.setCNPJCPF(const Value: Boolean);
begin
  FCNPJCPF := Value;
end;

procedure TTissReq.setcodigoIBGE(const Value: Boolean);
begin
  FcodigoIBGE := Value;
end;

procedure TTissReq.setCodigoTabela(const Value: Boolean);
begin
  fCodigoTabela := Value;
end;

procedure TTissReq.setCodProc(const Value: Boolean);
begin
  FCodProc := Value;
end;

procedure TTissReq.setComplemento(const Value: Boolean);
begin
  FComplemento := Value;
end;

procedure TTissReq.setdataAtendimento(const Value: Boolean);
begin
  fdataAtendimento := Value;
end;

procedure TTissReq.setDataRegistroTrans(const Value: Boolean);
begin
  FDataRegistroTrans := Value;
end;

procedure TTissReq.setEndNum(const Value: Boolean);
begin
  FEndNum := Value;
end;

procedure TTissReq.setEvolucaoValor(const Value: Boolean);
begin
  FEvolucaoValor := Value;
end;

procedure TTissReq.setFArqNomeHash(const Value: Boolean);
begin
  FArqNomeHash := Value;
end;

procedure TTissReq.setHipoteseDiag(const Value: Boolean);
begin
  FHipoteseDiag := Value;
end;

procedure TTissReq.setHoraRegistroTrans(const Value: Boolean);
begin
  FHoraRegistroTrans := Value;
end;

procedure TTissReq.setIndicAcid(const Value: Boolean);
begin
  FIndicAcid := Value;
end;

procedure TTissReq.setLogradouro(const Value: Boolean);
begin
  FLogradouro := Value;
end;

procedure TTissReq.setMEDICO(const Value: Boolean);
begin
  FMedico := Value;
end;

procedure TTissReq.setMunicipio(const Value: Boolean);
begin
  FMunicipio := Value;
end;

procedure TTissReq.setNomeArq(const Value: Boolean);
begin
  FNomeArqu := Value;
end;

procedure TTissReq.setNomeContradado(const Value: Boolean);
begin
  FNomeContradado := Value;
end;

procedure TTissReq.setNomePlano(const Value: Boolean);
begin
  FNomePlano := Value;
end;

procedure TTissReq.setNumCarteira(const Value: Boolean);
begin
  FNumCarteira := Value;
end;

procedure TTissReq.setNumCNS(const Value: Boolean);
begin
  FNumCNS := Value;
end;

procedure TTissReq.setNUMEROCONSELHO(const Value: Boolean);
begin
  fNUMEROCONSELHO := Value;
end;

procedure TTissReq.setNumGuia(const Value: Boolean);
begin
  FNumGuia := Value;
end;

procedure TTissReq.setNumLote(const Value: Boolean);
begin
  FNumLote := Value;
end;

procedure TTissReq.setObs(const Value: Boolean);
begin
  FObs := Value;
end;

procedure TTissReq.setPaciente(const Value: Boolean);
begin
  FPaciente := Value;
end;

procedure TTissReq.setRegANS(const Value: Boolean);
begin
  FRegANS := Value;
end;

procedure TTissReq.setSequencialTrans(const Value: Boolean);
begin
  FSequencialTrans := Value;
end;

procedure TTissReq.setSIGLACONSELHO(const Value: Boolean);
begin
  fSIGLACONSELHO := Value;
end;

procedure TTissReq.setTipDoenca(const Value: Boolean);
begin
  FTipDoenca := Value;
end;

procedure TTissReq.setTipo(const Value: Boolean);
begin
  FTipo := Value;
end;

procedure TTissReq.setTipoConsulta(const Value: Boolean);
begin
  FTipoConsulta := Value;
end;

procedure TTissReq.settipoLogradouro(const Value: Boolean);
begin
  FtipoLogradouro := Value;
end;

procedure TTissReq.setTipoSaida(const Value: Boolean);
begin
  FTipoSaida := Value;
end;



procedure TTissReq.setTipoTrans(const Value: Boolean);
begin
  FTipoTrans := Value
end;

procedure TTissReq.setUF(const Value: Boolean);
begin
  FUF := Value;
end;

procedure TTissReq.setUFCONSELHO(const Value: Boolean);
begin
  fUFCONSELHO := Value;
end;

procedure TTissReq.setUnidTemp(const Value: Boolean);
begin
  FUnidTemp := Value;
end;

procedure TTissReq.SetUsarCBOS(const Value: Boolean);
begin
  FUsarCBOS := Value;
end;

procedure TTissReq.setUsarEndContratado(const Value: Boolean);
begin
  FUsarEndContratado := Value;
end;

procedure TTissReq.setValidadeCart(const Value: Boolean);
begin
  FValidadeCart := Value;
end;




{ TTissCabecalho }

constructor TTissCabecalho.create;
begin
  FZerosArq := 20;
  FEncoding:='ISO-8859-1';
  FVersaoXml:='1.0';
  FVersaoTISS:='2.01.02';
  FTipoGeral := JuridicoGeral;
  FMensagemTissXml:='xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.ans.gov.br/padroes/tiss/schemas"';
end;

procedure TTissCabecalho.setArquivo(const Value: String);
begin
  FArquivo := Value;
end;

procedure TTissCabecalho.setCNPJCPF(const Value: String);
begin
  FCNPJCPF := Value;
end;

procedure TTissCabecalho.setDataRegistroTrans(const Value: TDateTime);
begin
  FDataRegistroTrans := Value;
end;

procedure TTissCabecalho.setEncoding(const Value: String);
begin
  FEncoding := Value;
end;

procedure TTissCabecalho.setFArqNomeHash(const Value: Boolean);
begin
  FArqNomeHash := Value;
end;

procedure TTissCabecalho.setHoraRegistroTrans(const Value: TDateTime);
begin
  FHoraRegistroTrans := Value;
end;

procedure TTissCabecalho.setMensagemTissXml(const Value: String);
begin
  FMensagemTissXml := Value;
end;

procedure TTissCabecalho.setNumLote(const Value: String);
begin
  FNumLote := Value;
end;

procedure TTissCabecalho.setRegANS(const Value: String);
begin
  FRegANS := Value;
end;

procedure TTissCabecalho.setSequencialTrans(const Value: String);
begin
  FSequencialTrans := Value;
end;



procedure TTissCabecalho.setTipoTrans(const Value: String);
begin
  FTipoTrans := Value;
end;

procedure TTissCabecalho.setTissTipoGeral(const Value: TTissTipoGeral);
begin
  FTissTipoGeral := Value;
end;

procedure TTissCabecalho.setVersaoTISS(const Value: String);
begin
  FVersaoTISS := Value;
end;

procedure TTissCabecalho.setVersaoXml(const Value: String);
begin
  FVersaoXml := Value;
end;

procedure TTissCabecalho.SetZerosArq(const Value: integer);
begin
  FZerosArq := Value;
end;

{ TTissBenific }

constructor TTissBenific.create;
begin

end;

procedure TTissBenific.setBenific(const Value: String);
begin
  FBenific := Value;
end;

procedure TTissBenific.setNomePlano(const Value: String);
begin
  FNomePlano := Value;
end;

procedure TTissBenific.setNumCarteira(const Value: String);
begin
  FNumCarteira := Value;
end;

procedure TTissBenific.setNumCNS(const Value: String);
begin
  FNumCNS := Value;
end;

procedure TTissBenific.setValidadeCart(const Value: TDateTime);
begin
  FValidadeCart := Value;
end;

{ TTissContratado }

constructor TTissContratado.create;
begin
  
end;

procedure TTissContratado.setCEP(const Value: String);
begin
  fCEP := Value;
end;

procedure TTissContratado.setCNES(const Value: Currency);
begin
  fCNES := Value;
end;

procedure TTissContratado.setCNPJCPF(const Value: String);
begin
  FCNPJCPF := Value;
end;

procedure TTissContratado.setcodigoIBGE(const Value: Currency);
begin
  FcodigoIBGE := Value;
end;

procedure TTissContratado.setComplemento(const Value: String);
begin
  FComplemento := Value;
end;

procedure TTissContratado.setEndNum(const Value: String);
begin
  FEndNum := Value;
end;

procedure TTissContratado.setLogradouro(const Value: String);
begin
  FLogradouro := Value;
end;

procedure TTissContratado.setMunicipio(const Value: String);
begin
  FMunicipio := Value;
end;

procedure TTissContratado.setNomeContradado(const Value: String);
begin
  FNomeContradado := Value;
end;

procedure TTissContratado.settipoLogradouro(const Value: String);
begin
  FtipoLogradouro := Value;
end;

procedure TTissContratado.setTissTipoGeral(const Value: TTissTipoGeral);
begin
  FTissTipoGeral := Value;
end;

procedure TTissContratado.setUF(const Value: String);
begin
  FUF := Value;
end;


{ TTissPrestExec }

constructor TTissPrestExec.create;
begin

end;

procedure TTissPrestExec.setCEP(const Value: String);
begin
  fCEP := Value;
end;

procedure TTissPrestExec.setCNES(const Value: Currency);
begin

end;

procedure TTissPrestExec.setCNPJCPF(const Value: String);
begin

end;

procedure TTissPrestExec.setcodigoIBGE(const Value: Currency);
begin

end;

procedure TTissPrestExec.setComplemento(const Value: String);
begin

end;

procedure TTissPrestExec.setEndNum(const Value: String);
begin

end;

procedure TTissPrestExec.setLogradouro(const Value: String);
begin

end;

procedure TTissPrestExec.setMunicipio(const Value: String);
begin

end;

procedure TTissPrestExec.setNomeContradado(const Value: String);
begin

end;

procedure TTissPrestExec.settipoLogradouro(const Value: String);
begin

end;

procedure TTissPrestExec.setTissTipoGeral(const Value: TTissTipoGeral);
begin

end;

procedure TTissPrestExec.setUF(const Value: String);
begin

end;

{ TTissProfissional }

constructor TTissProfissional.create;
begin

end;

procedure TTissProfissional.setCBOS(const Value: Currency);
begin
  fCBOS := Value;
end;

procedure TTissProfissional.setNumConselho(const Value: String);
begin
  fNumConselho := Value;
end;

procedure TTissProfissional.setPosicProf(const Value: Integer);
begin
  FPosicProf := Value;
end;

procedure TTissProfissional.setProf(const Value: String);
begin
  FProf := Value;
end;

procedure TTissProfissional.setSiglaConselho(const Value: String);
begin
  fSiglaConselho := Value;
end;

procedure TTissProfissional.setUFConselho(const Value: String);
begin
  fUFConselho := Value;
end;

{ TTissDiagnostico }

constructor TTissDiagnostico.create;
begin

end;

procedure TTissDiagnostico.setCIDCodDiag(const Value: String);
begin
  fCIDCodDiag := Value;
end;

procedure TTissDiagnostico.setCIDDescDiag(const Value: String);
begin
  fCIDDescDiag := Value;
end;

procedure TTissDiagnostico.setCIDNomeTab(const Value: String);
begin
  fCIDNomeTab := Value;
end;

procedure TTissDiagnostico.setIndicAcid(const Value: integer);
begin
  fIndicAcid := Value;
end;

procedure TTissDiagnostico.setTipDoenc(const Value: String);
begin
  fTipDoenc := Value;
end;

procedure TTissDiagnostico.setUnTemp(const Value: String);
begin
  fUnTemp := Value;
end;

procedure TTissDiagnostico.setValor(const Value: integer);
begin
  fValor := Value;
end;

{ TTissProc }

constructor TTissProc.create;
begin

end;

procedure TTissProc.setCodig(const Value: String);
begin
  fCodigo := Value;
end;

procedure TTissProc.setDescricao(const Value: String);
begin
  fDescricao := Value;
end;

procedure TTissProc.setTipTabela(const Value: integer);
begin
  fTipTabela := Value;
end;

{ TTissEquipe }

constructor TTissEquipe.create;
begin
  FProfissional:= TTissProfissional.create;
  FTipoMemb := FisicGeral;
end;

procedure TTissEquipe.setCodProf(const Value: String);
begin
  FCodProf := Value;
end;

{ TTissSPProcedimentos }

constructor TTissSPProcedimentos.create;
begin
  FEquipe := TTissEquipe.create;
  FProcs := TTissProc.create;
end;

procedure TTissSPProcedimentos.SetTissData(const Value: TDateTime);
begin
  FTissData := Value;
end;

procedure TTissSPProcedimentos.SetTissHsFim(const Value: TDateTime);
begin
  FTissHsFim := Value;
end;

procedure TTissSPProcedimentos.SetTissHsInicio(const Value: TDateTime);
begin
  FTissHsInicio := Value;
end;

procedure TTissSPProcedimentos.setTissQtde(const Value: Currency);
begin
  FTissQtde := Value;
end;

procedure TTissSPProcedimentos.setTissReducAcres(const Value: Currency);
begin
  FTissReducAcres := Value;
end;

procedure TTissSPProcedimentos.setTissTecUtil(const Value: string);
begin
  FTissTecUtil := Value;
end;

procedure TTissSPProcedimentos.setTissValor(const Value: Currency);
begin
  FTissValor := Value;
end;

procedure TTissSPProcedimentos.setTissVdeAcesso(const Value: string);
begin
  FTissVdeAcesso := Value;
end;

procedure TTissSPProcedimentos.setValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

{ TTissVersao }

constructor TCompVersao.create;
begin
 Fversao := '0.9.11';
end;

procedure TCompVersao.setVersao(const Value: String);
begin
  Fversao := '0.9.11';
end;

{ TTissValidacao }

constructor TTissValidacao.create;
begin
  FUsarValidacao := True;
end;

procedure TTissValidacao.setUsarValidacao(const Value: Boolean);
begin
  FUsarValidacao := Value;
end;

procedure TTissValidacao.setXsd(const Value: String);
begin
  Fxsd := Value;
end;



{ TTissDiagGuia }

constructor TTissDiagGuia.create;
begin

end;

procedure TTissDiagGuia.setCIDCodDiag(const Value: String);
begin
  fCIDCodDiag := Value;
end;

procedure TTissDiagGuia.setCIDDescDiag(const Value: String);
begin
  fCIDDescDiag := Value;
end;

procedure TTissDiagGuia.setCIDNomeTab(const Value: String);
begin
  fCIDNomeTab := Value;
end;

{ TDiagSaidInt }

constructor TDiagSaidInt.create;
begin
  fTissDiagGuia := TTissDiagGuia.create;
  fTissDiagSec := TTissDiagGuia.create;
  fObito := TTissObitoInt.create;
end;

procedure TDiagSaidInt.setIndicAcid(const Value: Integer);
begin
  fIndicAcid := Value;
end;

procedure TDiagSaidInt.setMotSaidInt(const Value: String);
begin
  fMotSaidInt := Value;
end;

{ TTissObitoInt }

constructor TTissObitoInt.create;
begin
  TissCID := TTissDiagGuia.create;
end;


procedure TTissObitoInt.setnumeracaoDe(const Value: String);
begin
  fnumeracaoDe := Value;
end;

{ TTissOutrasDesp }

constructor TTissOutrasDesp.create;
begin
  fTissDespesas := TTissDespesas.create;
end;



procedure TTissOutrasDesp.setTotalGeral(const Value: Currency);
begin
  fTotalGeral := Value;
end;

{ TTissDespesas }

constructor TTissDespesas.create;
begin

end;

procedure TTissDespesas.setDataReal(const Value: TDateTime);
begin
  fDataReal := Value;
end;

procedure TTissDespesas.setHoraFinal(const Value: TDateTime);
begin
  fHoraFinal := Value;
end;

procedure TTissDespesas.setHoraInicial(const Value: TDateTime);
begin
  fHoraInicial := Value;
end;

procedure TTissDespesas.setIdentCodigo(const Value: String);
begin
  fIdentCodigo := Value;
end;

procedure TTissDespesas.setIdentDesc(const Value: String);
begin
  fIdentDesc := Value;
end;

procedure TTissDespesas.setIdentTipoTab(const Value: String);
begin
  fIdentTipoTab := Value;
end;

procedure TTissDespesas.setQtde(const Value: Currency);
begin
  fQtde := Value;
end;

procedure TTissDespesas.setredAcres(const Value: Currency);
begin
  fredAcres := Value;
end;

procedure TTissDespesas.setTipDespesa(const Value: integer);
begin
  fTipDespesa := Value;
end;

procedure TTissDespesas.setVlrTot(const Value: Currency);
begin
  fVlrTot := Value;
end;

procedure TTissDespesas.setVlrUn(const Value: Currency);
begin
  fVlrUn := Value;
end;



procedure TTissTabela.setCodigo(const Value: String);
begin
  fCodigo := Value;
end;

procedure TTissTabela.setDescricao(const Value: String);
begin
  fDescricao := Value;
end;

procedure TTissTabela.setTipTab(const Value: String);
begin
  fTipTab := Value;
end;

{ TTissOpmUti }

constructor TTissOpmUti.create;
begin
  fOpm := TTissOpm.create;
end;

procedure TTissOpmUti.setVlrTotOPM(const Value: Currency);
begin
  fVlrTotOPM := Value;
end;

{ TTissOpm }

constructor TTissOpm.create;
begin
  fOpm := TTissTabela.Create;
end;

procedure TTissOpm.setCodBar(const Value: String);
begin
  fCodBar := Value;
end;

procedure TTissOpm.setqtde(const Value: Currency);
begin
  fqtde := Value;
end;

procedure TTissOpm.setVlrTot(const Value: Currency);
begin
  fVlrTot := Value;
end;

procedure TTissOpm.setVlrUn(const Value: Currency);
begin
  fVlrUn := Value;
end;

end.


unit untConfInt;
interface
uses
  SysUtils, Classes,untTissComp;
type
  TTissConfOPM = class(TPersistent)
  private
    FCodigo    : Boolean;
    FTipTab    : Boolean;
    FDescricao : Boolean;
    FQtde      : Boolean;
    FCodBar    : Boolean;
    FVlrUnt    : Boolean;
    FVlrTot    : Boolean;
    procedure setCodigo(const Value: Boolean);
    procedure setTipTab(const Value: Boolean);
    procedure setDescricao(const Value: Boolean);
    procedure setQtde(const Value: Boolean);
    procedure setCodBar(const Value: Boolean);
    procedure setVlrUnt(const Value: Boolean);
    procedure setVlrTot(const Value: Boolean);

  public
    constructor create;
  published
    property TissCodigo:Boolean    read FCodigo    write setCodigo;
    property TissTipTab:Boolean    read FTipTab    write setTipTab;
    property TissDescricao:Boolean read FDescricao write setDescricao;
    property TissQtde:Boolean      read FQtde      write setQtde;
    property TissCodBar:Boolean    read FCodBar    write setCodBar;
    property TissVlrUnt:Boolean    read FVlrUnt    write setVlrUnt;
    property TissVlrTot:Boolean    read FVlrTot    write setVlrTot;
  end;


  TTissConfOutrasDesp = class(TPersistent)
  private
    FIdentDesc: Boolean;
    FTipoDesp: Boolean;
    FHSFinal: Boolean;
    FHSInicial: Boolean;
    FIdentCodTab: Boolean;
    FTipTab: Boolean;
    FReducAcres: Boolean;
    FVlrUnt: Boolean;
    FDTRealizacao: Boolean;
    FTotalGeral: Boolean;
    FQtde: Boolean;
    procedure setDTRealizacao(const Value: Boolean);
    procedure setHSFinal(const Value: Boolean);
    procedure setHSInicial(const Value: Boolean);
    procedure setIdentCodTab(const Value: Boolean);
    procedure setIdentDesc(const Value: Boolean);
    procedure setQtde(const Value: Boolean);
    procedure setReducAcres(const Value: Boolean);
    procedure setTipoDesp(const Value: Boolean);
    procedure setTipTab(const Value: Boolean);
    procedure setTotalGeral(const Value: Boolean);
    procedure setVlrUnt(const Value: Boolean);

  public
    constructor create;
  published
    //Identificador Despesa
    property TissIdentCodTab:Boolean read FIdentCodTab write setIdentCodTab;
    property TissIdentTipTab:Boolean read FTipTab write setTipTab;
    property TissIdentDesc:Boolean read FIdentDesc write setIdentDesc;

    //Campos do corpo
    property TissTipoDesp:Boolean read FTipoDesp write setTipoDesp;
    property TissDTRealizacao:Boolean read FDTRealizacao write setDTRealizacao;
    property TissHSInicial:Boolean read FHSInicial write setHSInicial;
    property TissHSFinal:Boolean read FHSFinal write setHSFinal;
    property TissReducAcres:Boolean read FReducAcres write setReducAcres;
    property TissQtde:Boolean read FQtde write setQtde;
    property TissVlrUnt:Boolean read FVlrUnt write setVlrUnt;

    //TOTAL GERAL
    property TissTotalGeral:Boolean read FTotalGeral write setTotalGeral;
  end;


  TconfDiagSaidInt = class(TPersistent)
  private
    fMotSaidInt: boolean;
    fIndicAcid: boolean;
    fTissDiagGuia: boolean;
    fTissDiagSec: boolean;
    fObito: boolean;
    procedure setIndicAcid(const Value: boolean);
    procedure setMotSaidInt(const Value: boolean);
    procedure setObito(const Value: boolean);
    procedure setTissDiagGuia(const Value: boolean);
    procedure setTissDiagSec(const Value: boolean);


  public
    constructor create;
  published
    property TissIndicAcid: boolean read fIndicAcid write setIndicAcid;
    property TissDiagPrinc:boolean read fTissDiagGuia write setTissDiagGuia;
    property TissDiagSec:boolean read fTissDiagSec write setTissDiagSec;
    property TissMotSaidInt:boolean read fMotSaidInt write setMotSaidInt;
    property TissObito:boolean read fObito write setObito;
  end;

  TTissConfProfissional = class(TPersistent)
  private
    FProf: Boolean;
    FPosicProf: Boolean;
    fNumConselho: Boolean;
    fUFConselho: Boolean;
    fCBOS: Boolean;
    fSiglaConselho: Boolean;
    procedure setCBOS(const Value: Boolean);
    procedure setNumConselho(const Value: Boolean);
    procedure setPosicProf(const Value: Boolean);
    procedure setProf(const Value: Boolean);
    procedure setSiglaConselho(const Value: Boolean);
    procedure setUFConselho(const Value: Boolean);


  public
    constructor create;
  published
    property TissProf:Boolean read FProf write setProf;
    property TissSiglaConselho:Boolean read fSiglaConselho write setSiglaConselho;
    property TissNumConselho:Boolean read fNumConselho write setNumConselho;
    property TissUFConselho:Boolean read fUFConselho write setUFConselho;
    property TissfCBOS:Boolean read fCBOS write setCBOS;
    property TissPosicProf:Boolean read FPosicProf write setPosicProf;

  end;

  TTissConfProc = class(TPersistent)
  private
    fCodigo: Boolean;
    fDescricao: Boolean;
    fTipTabela: Boolean;
    procedure setCodig(const Value: Boolean);
    procedure setDescricao(const Value: Boolean);
    procedure setTipTabela(const Value: Boolean);


  public
    constructor create;
  published
    property TissCodigo:Boolean read fCodigo write setCodig;
    property TissTipTabela:Boolean read fTipTabela write setTipTabela;
    property TissDescricao:Boolean read fDescricao write setDescricao;
  end;

  TTissConfEquipe = class(TPersistent)
  private
    FTipoMemb: Boolean;
    FCodProf: Boolean;
    FProfissional: Boolean;
    FTissConfProfissional: TTissConfProfissional;
    procedure setCodProf(const Value: Boolean);
    procedure setTipoMemb(const Value: Boolean);
  public
    constructor create;
  published
    property TissCodProf:Boolean read FCodProf write setCodProf;
    property TissTipoMemb:Boolean read FTipoMemb write setTipoMemb;
    property TissProfiss:TTissConfProfissional read FTissConfProfissional write FTissConfProfissional;
  end;

  TTissConfSPProcedimentos = class(TPersistent)
  private
    FTissData: Boolean;
    FTissHsFim: Boolean;
    FTissTecUtil: Boolean;
    FTissReducAcres: Boolean;
    FTissValor: Boolean;
    FTissVdeAcesso: Boolean;
    FTissQtde: Boolean;
    FTissHsInicio: Boolean;
    FValorTotal: Boolean;
    FEquipe: TTissConfEquipe;
    FProcs: TTissConfProc;
    FTissConfProfissional: TTissConfProfissional;
    FUsarEquipe: Boolean;
    procedure SetTissData(const Value: Boolean);
    procedure SetTissHsFim(const Value: Boolean);
    procedure SetTissHsInicio(const Value: Boolean);
    procedure setTissQtde(const Value: Boolean);
    procedure setTissReducAcres(const Value: Boolean);
    procedure setTissTecUtil(const Value: Boolean);
    procedure setTissValor(const Value: Boolean);
    procedure setTissVdeAcesso(const Value: Boolean);
    procedure setValorTotal(const Value: Boolean);
    procedure setUsarEquipe(const Value: Boolean);
  public
    constructor create;
  published
    property TissUsarEquipe:Boolean read FUsarEquipe write setUsarEquipe;
    property TissEquipe:TTissConfEquipe read FEquipe write FEquipe;
    property TissProcs:TTissConfProc read FProcs write FProcs;
    property TissData:Boolean read FTissData write SetTissData;
    property TissHsInicio:Boolean read FTissHsInicio write SetTissHsInicio;
    property TissHsFim:Boolean read FTissHsFim write SetTissHsFim;
    property TissQtde:Boolean read FTissQtde write setTissQtde;
    property TissVdeAcesso:Boolean read FTissVdeAcesso write setTissVdeAcesso;
    property TissTecUtil:Boolean read FTissTecUtil write setTissTecUtil;
    property TissReducAcres:Boolean read FTissReducAcres write setTissReducAcres;
    property TissValor:Boolean read FTissValor write setTissValor;
    property TissValorTotal:Boolean read FValorTotal write setValorTotal;
  end;


  TTissConfDiagnostico = class(TPersistent)
  private
    fTipDoenc: boolean;
    fCIDDescDiag: boolean;
    fCIDNomeTab: boolean;
    fIndicAcid: boolean;
    fUnTemp: boolean;
    fCIDCodDiag: boolean;
    fValor: boolean;
    procedure setCIDCodDiag(const Value: boolean);
    procedure setCIDDescDiag(const Value: boolean);
    procedure setCIDNomeTab(const Value: boolean);
    procedure setIndicAcid(const Value: boolean);
    procedure setTipDoenc(const Value: boolean);
    procedure setUnTemp(const Value: boolean);
    procedure setValor(const Value: boolean);

  public
    constructor create;
  published
    property TissCIDNomeTab:boolean read fCIDNomeTab write setCIDNomeTab;
    property TissCIDCodDiag:boolean read fCIDCodDiag write setCIDCodDiag;
    property TissCIDDescDiag:boolean read fCIDDescDiag write setCIDDescDiag;
    property TissValor:boolean read fValor write setValor;
    property TissUnTemp:boolean read fUnTemp write setUnTemp; //A,M OU D
    property TissTipDoenc:boolean read fTipDoenc write setTipDoenc; //A,C
    property TissIndicAcid:boolean read fIndicAcid write setIndicAcid; //0,1,2
  end;

  TTissConfContratado = class(TPersistent)
  private
    FNomeContradado: Boolean;
    FLogradouro: Boolean;
    FtipoLogradouro: Boolean;
    FTissTipoGeral: Boolean;
    FEndNum: Boolean;
    fCEP: Boolean;
    FCNPJCPF: Boolean;
    FUF: Boolean;
    FcodigoIBGE: Boolean;
    FComplemento: Boolean;
    FMunicipio: Boolean;
    fCNES: Boolean;
    FUsarEnd: Boolean;
    procedure setCEP(const Value: Boolean);
    procedure setCNES(const Value: Boolean);
    procedure setCNPJCPF(const Value: Boolean);
    procedure setcodigoIBGE(const Value: Boolean);
    procedure setComplemento(const Value: Boolean);
    procedure setEndNum(const Value: Boolean);
    procedure setLogradouro(const Value: Boolean);
    procedure setMunicipio(const Value: Boolean);
    procedure setNomeContradado(const Value: Boolean);
    procedure settipoLogradouro(const Value: Boolean);
    procedure setTissTipoGeral(const Value: Boolean);
    procedure setUF(const Value: Boolean);
    procedure setUsarEnd(const Value: Boolean);


  public
    constructor create;
  published
    property TissTipoGeral:Boolean read FTissTipoGeral write setTissTipoGeral;
    property TissCNPJCPF:Boolean read FCNPJCPF write setCNPJCPF;
    property TissNomeContradado:Boolean read FNomeContradado write setNomeContradado;
    property TisstipoLogradouro:Boolean read FtipoLogradouro write settipoLogradouro;
    property TissLogradouro:Boolean read FLogradouro write setLogradouro;
    property TissEndNum:Boolean read FEndNum write setEndNum;
    property TissComplemento:Boolean read FComplemento write setComplemento;
    property TisscodigoIBGE:Boolean read FcodigoIBGE write setcodigoIBGE;
    property TissMunicipio:Boolean read FMunicipio write setMunicipio;
    property TissUF:Boolean read FUF write setUF;
    property TissCEP:Boolean read fCEP write setCEP;
    property TissCNES:Boolean read fCNES write setCNES;
    property TissUsarEnd:Boolean read FUsarEnd write setUsarEnd;
  end;

  TTissConfBenific = class(TPersistent)
  private
    FValidadeCart: Boolean;
    FNomePlano: Boolean;
    FNumCNS: Boolean;
    FBenific: Boolean;
    FNumCarteira: Boolean;
    procedure setBenific(const Value: Boolean);
    procedure setNomePlano(const Value: Boolean);
    procedure setNumCarteira(const Value: Boolean);
    procedure setNumCNS(const Value: Boolean);
    procedure setValidadeCart(const Value: Boolean);

  public
    constructor create;
  published
    property TissNumCarteira:Boolean read FNumCarteira write setNumCarteira;
    property TissBenific:Boolean read FBenific write setBenific;
    property TissNomePlano:Boolean read FNomePlano write setNomePlano;
    property TissValidadeCart:Boolean read FValidadeCart write setValidadeCart;
    property TissNumCNS:Boolean read FNumCNS write setNumCNS;
  end;

  TTissConfCabecalho = class(TPersistent)
  private
    FTissTipoGeral: boolean;
    FSequencialTrans: boolean;
    FRegANS: boolean;
    FDataRegistroTrans: boolean;
    FNumLote: boolean;
    FCNPJCPF: boolean;
    FHoraRegistroTrans: boolean;
    FTipoTrans: boolean;
    FUsarNomeArqu: boolean;
    FArqNomeHash: Boolean;

    procedure setCNPJCPF(const Value: boolean);
    procedure setDataRegistroTrans(const Value: boolean);
    procedure setHoraRegistroTrans(const Value: boolean);
    procedure setNumLote(const Value: boolean);
    procedure setRegANS(const Value: boolean);
    procedure setSequencialTrans(const Value: boolean);
    procedure setTipoTrans(const Value: boolean);
    procedure setTissTipoGeral(const Value: boolean);
    procedure setUsarNomeArqu(const Value: boolean);
    procedure setFArqNomeHash(const Value: Boolean);

  public
    constructor create;
  published
    property TissTipoTrans:boolean read FTipoTrans write setTipoTrans;
    property TissDataRegistroTrans:boolean read FDataRegistroTrans write setDataRegistroTrans;
    property TissHoraRegistroTrans:boolean read FHoraRegistroTrans write setHoraRegistroTrans;
    property TissSequencialTrans:boolean read FSequencialTrans write setSequencialTrans;
    property TissCNPJCPF:boolean read FCNPJCPF write setCNPJCPF;
    property TissRegANS:boolean read FRegANS write setRegANS;
    property TissNumLote:boolean read FNumLote write setNumLote;
    property TissTipoGeral:boolean read FTissTipoGeral write setTissTipoGeral;
    property TissUsarNomeArqu: boolean read FUsarNomeArqu write setUsarNomeArqu;
    property TissArqNomeHash:Boolean read FArqNomeHash write setFArqNomeHash;

  end;

  TTissConfInt = class(TPersistent)
  private
    FTissCabecalho: TTissConfCabecalho;
    FTissConfBenific: TTissConfBenific;
    FTipoAtend: boolean;
    FHoraAtend: boolean;
    FDataAut: boolean;
    FDataAtend: boolean;
    FTipoSP: boolean;
    FNumGuiaPrest: boolean;
    FCNPJCPF: boolean;
    FSenhaValid: boolean;
    FindicClinica: boolean;
    FSenhaAut: boolean;
    FTipoSaida: boolean;
    FRegANS: boolean;
    FcaraAtend: boolean;
    FNumGuiaOper: boolean;
    FNumLote: boolean;
    FNumGuiaPrinc: boolean;
    FTissConfContratado: TTissConfContratado;
    FTissConfDiagnostico: TTissConfDiagnostico;
    FTissPrestadorExec: TTissConfContratado;
    FTissSPProcedimentos: TTissConfSPProcedimentos;
    FTissConfProfissional: TTissConfProfissional;
    FCompVersao: TCompVersao;
    FUsarBenefic: boolean;
    FUsarDiagnostico: boolean;
    FUsarContratado: boolean;
    FUsarPrestadorExec: boolean;
    FUsarProfissional: boolean;
    FUsarUsarProc: boolean;
    FAcomod: boolean;
    FHoraSaidInt: boolean;
    FDataSaidInt: boolean;
    FRegInt: boolean;
    FUsarDiagSaidInt: boolean;
    FconfDiagSaidInt: TconfDiagSaidInt;
    FTipoFat: boolean;
    //FUsarUsarOPMS: boolean;  tirei...
    FUsarOPM: boolean;
    FUsarOutDespesas: boolean;
    FUsarDadAut: boolean;
    FTissConfOPM: TTissConfOPM;
    FTissConfOutrasDesp: TTissConfOutrasDesp;

    procedure setcaraAtend(const Value: boolean);
    procedure setCNPJCPF(const Value: boolean);
    procedure setDataAtend(const Value: boolean);
    procedure setDataAut(const Value: boolean);
    procedure setHoraAtend(const Value: boolean);
    procedure setindicClinica(const Value: boolean);
    procedure setNumGuiaOper(const Value: boolean);
    procedure setNumGuiaPrest(const Value: boolean);
    procedure setNumGuiaPrinc(const Value: boolean);
    procedure setNumLote(const Value: boolean);
    procedure setRegANS(const Value: boolean);
    procedure setSenhaAut(const Value: boolean);
    procedure setSenhaValid(const Value: boolean);
    procedure setTipoAtend(const Value: boolean);
    procedure setTipoSaida(const Value: boolean);
    procedure setTipoSP(const Value: boolean);
    procedure setUsarBenefic(const Value: boolean);
    procedure setUsarContratado(const Value: boolean);
    procedure setUsarDiagnostico(const Value: boolean);
    procedure setUsarPrestadorExec(const Value: boolean);
    procedure setUsarProfissional(const Value: boolean);
    procedure setUsarUsarProc(const Value: boolean);
    procedure setAcomod(const Value: boolean);
    procedure setDataSaidInt(const Value: boolean);
    procedure setHoraSaidInt(const Value: boolean);
    procedure setRegInt(const Value: boolean);
    procedure setUsarDiagSaidInt(const Value: boolean);
    procedure setTipoFat(const Value: boolean);
    //procedure setUsarOPMS(const Value: boolean);  tirei...
    procedure setUsarOPM(const Value: boolean);
    procedure setUsarOutDespesas(const Value: boolean);
    procedure setUsarDadAut(const Value: boolean);
    procedure setTissConfOPM(const Value: TTissConfOPM);
    procedure setTissConfOutrasDesp(const Value: TTissConfOutrasDesp);

  public
    constructor create;
  published
    property TissUsarBenefic:boolean read FUsarBenefic write setUsarBenefic;
    property TissUsarContratado:boolean read FUsarContratado write setUsarContratado;
    property TissUsarIdentExec:boolean read FUsarPrestadorExec write setUsarPrestadorExec;
    property TissUsarDiagnostico:boolean read FUsarDiagnostico write setUsarDiagnostico;
    property TissUsarProc:boolean read FUsarUsarProc write setUsarUsarProc;
    property TissUsarDiagSaidInt:boolean read FUsarDiagSaidInt write setUsarDiagSaidInt;
    property TissUsarProfissional:boolean read FUsarProfissional write setUsarProfissional;
    //property TissUsarOPMS:boolean read FUsarUsarOPMS write setUsarOPMS;  tirei...
    property TissUsarOPM:boolean read FUsarOPM write setUsarOPM;
    property TissUsarOutDespesas:boolean read FUsarOutDespesas write setUsarOutDespesas;

    property TissCabecalho:TTissConfCabecalho read FTissCabecalho write FTissCabecalho;
    property TissBenefic:TTissConfBenific read FTissConfBenific write FTissConfBenific;
    property TissContratado:TTissConfContratado read FTissConfContratado write FTissConfContratado;
    property TissIdentExec:TTissConfContratado read FTissPrestadorExec write FTissPrestadorExec;
    property TissDiagnostico:TTissConfDiagnostico read FTissConfDiagnostico  write FTissConfDiagnostico;
    property TissProc:TTissConfSPProcedimentos read FTissSPProcedimentos  write FTissSPProcedimentos;
    property TissProfissional:TTissConfProfissional read FTissConfProfissional write FTissConfProfissional;
    // OPM
    property TissOPM: TTissConfOPM read FTissConfOPM write setTissConfOPM;
    // Outras Despesas
    property TissOutDesp: TTissConfOutrasDesp read FTissConfOutrasDesp write setTissConfOutrasDesp;


    property TissNumGuiaPrest:boolean read FNumGuiaPrest write setNumGuiaPrest;
    property TissNumGuiaOper:boolean read FNumGuiaOper write setNumGuiaOper;
    property TissNumGuiaSolic:boolean read FNumGuiaPrinc write setNumGuiaPrinc;
    property TissDataAut:boolean read FDataAut write setDataAut;
    property TissSenhaAut:boolean read FSenhaAut write setSenhaAut;
    property TissSenhaValid:boolean read FSenhaValid write setSenhaValid;

    property TissTipoSP:boolean read FTipoSP write setTipoSP;
    property TissindicClinica:boolean read FindicClinica write setindicClinica;
    property TisscaraterInt:boolean read FcaraAtend write setcaraAtend;
    property TissDataInt:boolean read FDataAtend write setDataAtend;
    property TissHoraInt:boolean read FHoraAtend write setHoraAtend;
    property TissHoraSaidInt:boolean read FHoraSaidInt write setHoraSaidInt;
    property TissDataSaidInt:boolean read FDataSaidInt write setDataSaidInt;

    property TissTipoSaida:boolean read FTipoSaida write setTipoSaida; //1,2,3,4,5,6
    property TissTipoInt:boolean read FTipoAtend write setTipoAtend;
    property TissCNPJCPF:boolean read FCNPJCPF write setCNPJCPF;
    property TissRegANS:boolean read FRegANS write setRegANS;
    property TissTipoFat:boolean read FTipoFat write setTipoFat;

    property TissNumLote:boolean read FNumLote write setNumLote;
    property TissRegInt:boolean read FRegInt write setRegInt;

    property TissAcomod:boolean read FAcomod write setAcomod;
    
    property TissUsarDadAut:boolean read FUsarDadAut write setUsarDadAut;

    //Diagnostico saida internacao
    property TissDiagSaidaInt: TconfDiagSaidInt read FconfDiagSaidInt write FconfDiagSaidInt;

  end;


implementation


{ TTissConfBenific }

constructor TTissConfBenific.create;
begin
    FValidadeCart:= true;
    FNomePlano:= true;
    FNumCNS:= true;
    FBenific:= true;
    FNumCarteira:= true;

end;

procedure TTissConfBenific.setBenific(const Value: Boolean);
begin
  FBenific := Value;
end;

procedure TTissConfBenific.setNomePlano(const Value: Boolean);
begin
  FNomePlano := Value;
end;

procedure TTissConfBenific.setNumCarteira(const Value: Boolean);
begin
  FNumCarteira := Value;
end;

procedure TTissConfBenific.setNumCNS(const Value: Boolean);
begin
  FNumCNS := Value;
end;

procedure TTissConfBenific.setValidadeCart(const Value: Boolean);
begin
  FValidadeCart := Value;
end;

{ TTissConfCabecalho }

constructor TTissConfCabecalho.create;
begin
    FUsarNomeArqu := false;
    FTissTipoGeral:= true;
    FSequencialTrans:= true;
    FRegANS:= true;
    FDataRegistroTrans:= true;
    FNumLote:= true;
    FCNPJCPF:= true;
    FHoraRegistroTrans:= true;
    FTipoTrans:= true;
    FArqNomeHash := true;
end;


procedure TTissConfCabecalho.setCNPJCPF(const Value: boolean);
begin
  FCNPJCPF := Value;
end;

procedure TTissConfCabecalho.setDataRegistroTrans(const Value: boolean);
begin
  FDataRegistroTrans := Value;
end;


procedure TTissConfCabecalho.setFArqNomeHash(const Value: Boolean);
begin
  FArqNomeHash := Value;
end;

procedure TTissConfCabecalho.setHoraRegistroTrans(const Value: boolean);
begin
  FHoraRegistroTrans := Value;
end;

procedure TTissConfCabecalho.setNumLote(const Value: boolean);
begin
  FNumLote := Value;
end;

procedure TTissConfCabecalho.setRegANS(const Value: boolean);
begin
  FRegANS := Value;
end;

procedure TTissConfCabecalho.setSequencialTrans(const Value: boolean);
begin
  FSequencialTrans := Value;
end;

procedure TTissConfCabecalho.setTipoTrans(const Value: boolean);
begin
  FTipoTrans := Value;
end;

procedure TTissConfCabecalho.setTissTipoGeral(const Value: boolean);
begin
  FTissTipoGeral := Value;
end;


procedure TTissConfCabecalho.setUsarNomeArqu(const Value: boolean);
begin
  FUsarNomeArqu := Value;
end;

{ TTissConfInt }

constructor TTissConfInt.create;
begin
  FTissCabecalho := TTissConfCabecalho.create;
  FTissConfBenific := TTissConfBenific.create;
  FTissConfContratado := TTissConfContratado.create;
  FTissConfDiagnostico := TTissConfDiagnostico.create;
  FTissPrestadorExec := TTissConfContratado.create;
  FTissSPProcedimentos := TTissConfSPProcedimentos.create;
  FTissConfProfissional := TTissConfProfissional.create;
  FTissConfOPM := TTissConfOPM.create;
  FTissConfOutrasDesp := TTissConfOutrasDesp.create;
  FTipoAtend:= true;
  FHoraAtend:= true;
  FDataAut:= true;
  FDataAtend:= true;
  FTipoSP:= true;
  FNumGuiaPrest:= true;
  FCNPJCPF:= true;
  FSenhaValid:= true;
  FindicClinica:= true;
  FSenhaAut:= true;
  FTipoSaida:= true;
  FRegANS:= true;
  FcaraAtend:= true;
  FNumGuiaOper:= true;
  FNumLote:= true;
  FNumGuiaPrinc:= true;
  FUsarBenefic:= true;
  FUsarDiagnostico:= true;
  FUsarContratado:= true;
  FUsarPrestadorExec:= true;
  FUsarProfissional := true;
  FUsarUsarProc := true;
  FAcomod := True;
  FHoraSaidInt := True;
  FDataSaidInt := True;
  FconfDiagSaidInt := TconfDiagSaidInt.create;
  FTipoFat := True; 
  //FUsarUsarOPMS := true;  tirei...
  FUsarOPM := false;
  FUsarOutDespesas := false;
  FUsarDiagSaidInt := True;
  FRegInt := True;
  FUsarDadAut := True;

end;



procedure TTissConfInt.setAcomod(const Value: boolean);
begin
  FAcomod := Value;
end;

procedure TTissConfInt.setcaraAtend(const Value: boolean);
begin
  FcaraAtend := Value;
end;

procedure TTissConfInt.setCNPJCPF(const Value: boolean);
begin
  FCNPJCPF := Value;
end;

procedure TTissConfInt.setDataAtend(const Value: boolean);
begin
  FDataAtend := Value;
end;

procedure TTissConfInt.setDataAut(const Value: boolean);
begin
  FDataAut := Value;
end;

procedure TTissConfInt.setDataSaidInt(const Value: boolean);
begin
  FDataSaidInt := Value;
end;

procedure TTissConfInt.setHoraAtend(const Value: boolean);
begin
  FHoraAtend := Value;
end;

procedure TTissConfInt.setHoraSaidInt(const Value: boolean);
begin
  FHoraSaidInt := Value;
end;

procedure TTissConfInt.setindicClinica(const Value: boolean);
begin
  FindicClinica := Value;
end;

procedure TTissConfInt.setNumGuiaOper(const Value: boolean);
begin
  FNumGuiaOper := Value;
end;

procedure TTissConfInt.setNumGuiaPrest(const Value: boolean);
begin
  FNumGuiaPrest := Value;
end;

procedure TTissConfInt.setNumGuiaPrinc(const Value: boolean);
begin
  FNumGuiaPrinc := Value;
end;

procedure TTissConfInt.setNumLote(const Value: boolean);
begin
  FNumLote := Value;
end;

procedure TTissConfInt.setRegANS(const Value: boolean);
begin
  FRegANS := Value;
end;

procedure TTissConfInt.setRegInt(const Value: boolean);
begin
  FRegInt := Value;
end;

procedure TTissConfInt.setSenhaAut(const Value: boolean);
begin
  FSenhaAut := Value;
end;

procedure TTissConfInt.setSenhaValid(const Value: boolean);
begin
  FSenhaValid := Value;
end;

procedure TTissConfInt.setTipoAtend(const Value: boolean);
begin
  FTipoAtend := Value;
end;

procedure TTissConfInt.setTipoFat(const Value: boolean);
begin
  FTipoFat := Value;
end;

procedure TTissConfInt.setTipoSaida(const Value: boolean);
begin
  FTipoSaida := Value;
end;

procedure TTissConfInt.setTipoSP(const Value: boolean);
begin
  FTipoSP := Value;
end;

procedure TTissConfInt.setTissConfOPM(const Value: TTissConfOPM);
begin
  FTissConfOPM := Value;
end;

procedure TTissConfInt.setTissConfOutrasDesp(const Value: TTissConfOutrasDesp);
begin
  FTissConfOutrasDesp := Value;
end;

procedure TTissConfInt.setUsarBenefic(const Value: boolean);
begin
  FUsarBenefic := Value;
end;

procedure TTissConfInt.setUsarContratado(const Value: boolean);
begin
  FUsarContratado := Value;
end;

procedure TTissConfInt.setUsarDadAut(const Value: boolean);
begin
  FUsarDadAut := Value;
end;

procedure TTissConfInt.setUsarDiagnostico(const Value: boolean);
begin
  FUsarDiagnostico := Value;
end;

procedure TTissConfInt.setUsarDiagSaidInt(const Value: boolean);
begin
  FUsarDiagSaidInt := Value;
end;

{
procedure TTissConfInt.setUsarOPMS(const Value: boolean);
begin
  FUsarUsarOPMS := Value;
end;  }

procedure TTissConfInt.setUsarOPM(const Value: boolean);
begin
  FUsarOPM := Value;
end;

procedure TTissConfInt.setUsarOutDespesas(const Value: boolean);
begin
  FUsarOutDespesas := Value;
end;

procedure TTissConfInt.setUsarPrestadorExec(const Value: boolean);
begin
  FUsarPrestadorExec := Value;
end;

procedure TTissConfInt.setUsarProfissional(const Value: boolean);
begin
  FUsarProfissional := Value;
end;

procedure TTissConfInt.setUsarUsarProc(const Value: boolean);
begin
  FUsarUsarProc := Value;
end;

{ TTissConfContratado }

constructor TTissConfContratado.create;
begin
  FNomeContradado:= True;
  FLogradouro:= True;
  FtipoLogradouro:= True;
  FTissTipoGeral:= True;
  FEndNum:= True;
  fCEP:= True;
  FCNPJCPF:= True;
  FUF:= True;
  FcodigoIBGE:= True;
  FComplemento:= True;
  FMunicipio:= True;
  fCNES:= True;
  FUsarEnd := True;
end;

procedure TTissConfContratado.setCEP(const Value: Boolean);
begin
  fCEP := Value;
end;

procedure TTissConfContratado.setCNES(const Value: Boolean);
begin
  fCNES := Value;
end;

procedure TTissConfContratado.setCNPJCPF(const Value: Boolean);
begin
  FCNPJCPF := Value;
end;

procedure TTissConfContratado.setcodigoIBGE(const Value: Boolean);
begin
  FcodigoIBGE := Value;
end;

procedure TTissConfContratado.setComplemento(const Value: Boolean);
begin
  FComplemento := Value;
end;

procedure TTissConfContratado.setEndNum(const Value: Boolean);
begin
  FEndNum := Value;
end;

procedure TTissConfContratado.setLogradouro(const Value: Boolean);
begin
  FLogradouro := Value;
end;

procedure TTissConfContratado.setMunicipio(const Value: Boolean);
begin
  FMunicipio := Value;
end;

procedure TTissConfContratado.setNomeContradado(const Value: Boolean);
begin
  FNomeContradado := Value;
end;

procedure TTissConfContratado.settipoLogradouro(const Value: Boolean);
begin
  FtipoLogradouro := Value;
end;

procedure TTissConfContratado.setTissTipoGeral(const Value: Boolean);
begin
  FTissTipoGeral := Value;
end;

procedure TTissConfContratado.setUF(const Value: Boolean);
begin
  FUF := Value;
end;

procedure TTissConfContratado.setUsarEnd(const Value: Boolean);
begin
  FUsarEnd := Value;
end;

{ TTissConfDiagnostico }

constructor TTissConfDiagnostico.create;
begin
    fTipDoenc:= True;
    fCIDDescDiag:= True;
    fCIDNomeTab:= True;
    fIndicAcid:= True;
    fUnTemp:= True;
    fCIDCodDiag:= True;
    fValor:= True;
end;

procedure TTissConfDiagnostico.setCIDCodDiag(const Value: boolean);
begin
  fCIDCodDiag := Value;
end;

procedure TTissConfDiagnostico.setCIDDescDiag(const Value: boolean);
begin
  fCIDDescDiag := Value;
end;

procedure TTissConfDiagnostico.setCIDNomeTab(const Value: boolean);
begin
  fCIDNomeTab := Value;
end;

procedure TTissConfDiagnostico.setIndicAcid(const Value: boolean);
begin
  fIndicAcid := Value;
end;

procedure TTissConfDiagnostico.setTipDoenc(const Value: boolean);
begin
  fTipDoenc := Value;
end;

procedure TTissConfDiagnostico.setUnTemp(const Value: boolean);
begin
  fUnTemp := Value;
end;

procedure TTissConfDiagnostico.setValor(const Value: boolean);
begin
  fValor := Value;
end;

{ TTissConfEquipe }

constructor TTissConfEquipe.create;
begin
    FTipoMemb:= True;
    FCodProf:= True;
    FProfissional:= True;
    FTissConfProfissional := TTissConfProfissional.create;
end;

procedure TTissConfEquipe.setCodProf(const Value: Boolean);
begin
  FCodProf := Value;
end;

procedure TTissConfEquipe.setTipoMemb(const Value: Boolean);
begin
  FProfissional := Value;
end;

{ TTissConfProc }

constructor TTissConfProc.create;
begin
  fCodigo:= True;
  fDescricao:= True;
  fTipTabela:= True;
end;

procedure TTissConfProc.setCodig(const Value: Boolean);
begin
  fCodigo := Value;
end;

procedure TTissConfProc.setDescricao(const Value: Boolean);
begin
  fDescricao := Value;
end;

procedure TTissConfProc.setTipTabela(const Value: Boolean);
begin
  fTipTabela := Value;
end;

{ TTissSPProcedimentos }

constructor TTissConfSPProcedimentos.create;
begin
    FTissData:= True;
    FTissHsFim:= True;
    FTissTecUtil:= True;
    FTissReducAcres:= True;
    FTissValor:= True;
    FTissVdeAcesso:= True;
    FTissQtde:= True;
    FTissHsInicio:= True;
    FValorTotal:= True;
    FEquipe:= TTissConfEquipe.create;
    FProcs:= TTissConfProc.create;
    FUsarEquipe := True;

end;

procedure TTissConfSPProcedimentos.SetTissData(const Value: Boolean);
begin
  FTissData := Value;
end;

procedure TTissConfSPProcedimentos.SetTissHsFim(const Value: Boolean);
begin
  FTissHsFim := Value;
end;

procedure TTissConfSPProcedimentos.SetTissHsInicio(const Value: Boolean);
begin
  FTissHsInicio := Value;
end;

procedure TTissConfSPProcedimentos.setTissQtde(const Value: Boolean);
begin
  FTissQtde := Value;
end;

procedure TTissConfSPProcedimentos.setTissReducAcres(const Value: Boolean);
begin
  FTissReducAcres := Value;
end;

procedure TTissConfSPProcedimentos.setTissTecUtil(const Value: Boolean);
begin
  FTissTecUtil := Value;
end;

procedure TTissConfSPProcedimentos.setTissValor(const Value: Boolean);
begin
  FTissValor := Value;
end;

procedure TTissConfSPProcedimentos.setTissVdeAcesso(const Value: Boolean);
begin
  FTissVdeAcesso := Value;
end;

procedure TTissConfSPProcedimentos.setUsarEquipe(const Value: Boolean);
begin
  FUsarEquipe := Value;
end;

procedure TTissConfSPProcedimentos.setValorTotal(const Value: Boolean);
begin
  FValorTotal := Value;
end;

{ TTissConfProfissional }

constructor TTissConfProfissional.create;
begin
  FProf:= True;
  FPosicProf:= True;
  fNumConselho:= True;
  fUFConselho:= True;
  fCBOS:= True;
  fSiglaConselho:= True;
end;

procedure TTissConfProfissional.setCBOS(const Value: Boolean);
begin
  fCBOS := Value;
end;

procedure TTissConfProfissional.setNumConselho(const Value: Boolean);
begin
  fNumConselho := Value;
end;

procedure TTissConfProfissional.setPosicProf(const Value: Boolean);
begin
  FPosicProf := Value;
end;

procedure TTissConfProfissional.setProf(const Value: Boolean);
begin
  FProf := Value;
end;

procedure TTissConfProfissional.setSiglaConselho(const Value: Boolean);
begin
  fSiglaConselho := Value;
end;

procedure TTissConfProfissional.setUFConselho(const Value: Boolean);
begin
  fUFConselho := Value;
end;

{ TDiagSaidInt }

constructor TConfDiagSaidInt.create;
begin
  fIndicAcid := True;
  fTissDiagGuia := True;
  fTissDiagSec := True;
  fMotSaidInt := True;
  fObito := True;
end;

procedure TConfDiagSaidInt.setIndicAcid(const Value: boolean);
begin
  fIndicAcid := Value;
end;

procedure TConfDiagSaidInt.setMotSaidInt(const Value: boolean);
begin
  fMotSaidInt := Value;
end;

procedure TConfDiagSaidInt.setObito(const Value: boolean);
begin
  fObito := Value;
end;

procedure TConfDiagSaidInt.setTissDiagGuia(const Value: boolean);
begin
  fTissDiagGuia := Value;
end;

procedure TConfDiagSaidInt.setTissDiagSec(const Value: boolean);
begin
  fTissDiagSec := Value;
end;


{ TTissConfOPM }

constructor TTissConfOPM.create;
begin
  FCodigo    := True;
  FTipTab    := True;
  FDescricao := False;
  FQtde      := True;
  FCodBar    := True;
  FVlrUnt    := False;
  FVlrTot    := False;
end;

procedure TTissConfOPM.setCodigo(const Value: Boolean);
begin
  FCodigo := Value;
end;

procedure TTissConfOPM.setTipTab(const Value: Boolean);
begin
  FTipTab := Value;
end;

procedure TTissConfOPM.setDescricao(const Value: Boolean);
begin
  FDescricao := Value;
end;

procedure TTissConfOPM.setQtde(const Value: Boolean);
begin
  FQtde := Value;
end;

procedure TTissConfOPM.setCodBar(const Value: Boolean);
begin
  FCodBar := Value;
end;

procedure TTissConfOPM.setVlrUnt(const Value: Boolean);
begin
  FVlrUnt := Value;
end;

procedure TTissConfOPM.setVlrTot(const Value: Boolean);
begin
  FVlrTot := Value;
end;


{ TTissConfOutrasDesp }

constructor TTissConfOutrasDesp.create;
begin
  //Identificador Despesa
  FIdentCodTab := True;
  FTipTab := True;
  FIdentDesc := False;
  //Campos do corpo
  FTipoDesp := True;
  FDTRealizacao := True;
  FHSInicial := False;
  FHSFinal := False;
  FReducAcres := False;
  FQtde := True;
  FVlrUnt := False;

  //TOTAL GERAL
  FTotalGeral := False;
end;

procedure TTissConfOutrasDesp.setDTRealizacao(const Value: Boolean);
begin
  FDTRealizacao := Value;
end;

procedure TTissConfOutrasDesp.setHSFinal(const Value: Boolean);
begin
  FHSFinal := Value;
end;

procedure TTissConfOutrasDesp.setHSInicial(const Value: Boolean);
begin
  FHSInicial := Value;
end;

procedure TTissConfOutrasDesp.setIdentCodTab(const Value: Boolean);
begin
  FIdentCodTab := Value;
end;

procedure TTissConfOutrasDesp.setIdentDesc(const Value: Boolean);
begin
  FIdentDesc := Value;
end;

procedure TTissConfOutrasDesp.setQtde(const Value: Boolean);
begin
  FQtde := Value;
end;

procedure TTissConfOutrasDesp.setReducAcres(const Value: Boolean);
begin
  FReducAcres := Value;
end;

procedure TTissConfOutrasDesp.setTipoDesp(const Value: Boolean);
begin
  FTipoDesp := Value;
end;

procedure TTissConfOutrasDesp.setTipTab(const Value: Boolean);
begin
  FTipTab := Value;
end;

procedure TTissConfOutrasDesp.setTotalGeral(const Value: Boolean);
begin
  FTotalGeral := Value;
end;

procedure TTissConfOutrasDesp.setVlrUnt(const Value: Boolean);
begin
  FVlrUnt := Value;
end;

end.

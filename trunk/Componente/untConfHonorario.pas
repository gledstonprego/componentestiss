unit untConfHonorario;

interface

uses
  SysUtils, Classes, untTissComp;

type
  TTissConfProc = class(TPersistent)
  private
    FCodigo    : Boolean;
    FDescricao : Boolean;
    FTipTabela : Boolean;
    procedure setCodig(const Value: Boolean);
    procedure setDescricao(const Value: Boolean);
    procedure setTipTabela(const Value: Boolean);
  public
    constructor Create;
  published
    property TissCodigo    : Boolean read FCodigo    write setCodig;
    property TissTipTabela : Boolean read FTipTabela write setTipTabela;
    property TissDescricao : Boolean read FDescricao write setDescricao;
  end;

  TTissConfContratado = class(TPersistent)
  private
    FComplemento    : Boolean;
    FEndNum         : Boolean;
    FCEP            : Boolean;
    FLogradouro     : Boolean;
    FUF             : Boolean;
    FTissTipoGeral  : Boolean;
    FcodigoIBGE     : Boolean;
    FtipoLogradouro : Boolean;
    FMunicipio      : Boolean;
    FNomeContradado : Boolean;
    FCNES           : Boolean;
    FUsarEnd        : Boolean;
    FCNPJCPF        : Boolean;
    
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
    constructor Create;
  published
    property TissTipoGeral      : Boolean read FTissTipoGeral  write setTissTipoGeral;
    property TissCNPJCPF        : Boolean read FCNPJCPF        write setCNPJCPF;
    property TissNomeContradado : Boolean read FNomeContradado write setNomeContradado;
    property TisstipoLogradouro : Boolean read FtipoLogradouro write settipoLogradouro;
    property TissLogradouro     : Boolean read FLogradouro     write setLogradouro;
    property TissEndNum         : Boolean read FEndNum         write setEndNum;
    property TissComplemento    : Boolean read FComplemento    write setComplemento;
    property TisscodigoIBGE     : Boolean read FcodigoIBGE     write setcodigoIBGE;
    property TissMunicipio      : Boolean read FMunicipio      write setMunicipio;
    property TissUF             : Boolean read FUF             write setUF;
    property TissCEP            : Boolean read FCEP            write setCEP;
    property TissCNES           : Boolean read FCNES           write setCNES;
    property TissUsarEnd        : Boolean read FUsarEnd        write setUsarEnd;
  end;

  TTissConfSPProcedimentos = class(TPersistent)
  private
    FTissValor      : Boolean;
    FTissData       : Boolean;
    FTissTecUtil    : Boolean;
    FTissReducAcres : Boolean;
    FTissHsInicio   : Boolean;
    FTissHsFim      : Boolean;
    FTissVdeAcesso  : Boolean;
    FValorTotal     : Boolean;
    FTissQtde       : Boolean;
    FProcs          : TTissConfProc;
    
    procedure SetTissData(const Value: Boolean);
    procedure SetTissHsFim(const Value: Boolean);
    procedure SetTissHsInicio(const Value: Boolean);
    procedure setTissQtde(const Value: Boolean);
    procedure setTissReducAcres(const Value: Boolean);
    procedure setTissTecUtil(const Value: Boolean);
    procedure setTissValor(const Value: Boolean);
    procedure setTissVdeAcesso(const Value: Boolean);
    procedure setValorTotal(const Value: Boolean);
  public
    constructor Create;
  published
    property TissProcs      : TTissConfProc read FProcs          write FProcs;
    property TissData       : Boolean       read FTissData       write SetTissData;
    property TissHsInicio   : Boolean       read FTissHsInicio   write SetTissHsInicio;
    property TissHsFim      : Boolean       read FTissHsFim      write SetTissHsFim;
    property TissQtde       : Boolean       read FTissQtde       write setTissQtde;
    property TissVdeAcesso  : Boolean       read FTissVdeAcesso  write setTissVdeAcesso;
    property TissTecUtil    : Boolean       read FTissTecUtil    write setTissTecUtil;
    property TissReducAcres : Boolean       read FTissReducAcres write setTissReducAcres;
    property TissValor      : Boolean       read FTissValor      write setTissValor;
    property TissValorTotal : Boolean       read FValorTotal     write setValorTotal;
  end;

  TTissConfProfissional = class(TPersistent)
  private
    FProf          : Boolean;
    FPosicProf     : Boolean;
    FNumConselho   : Boolean;
    FUFConselho    : Boolean;
    FCBOS          : Boolean;
    FSiglaConselho : Boolean;
    
    procedure setCBOS(const Value: Boolean);
    procedure setNumConselho(const Value: Boolean);
    procedure setPosicProf(const Value: Boolean);
    procedure setProf(const Value: Boolean);
    procedure setSiglaConselho(const Value: Boolean);
    procedure setUFConselho(const Value: Boolean);
  public
    constructor Create;
  published
    property TissProf          : Boolean read FProf          write setProf;
    property TissSiglaConselho : Boolean read FSiglaConselho write setSiglaConselho;
    property TissNumConselho   : Boolean read FNumConselho   write setNumConselho;
    property TissUFConselho    : Boolean read FUFConselho    write setUFConselho;
    property TissfCBOS         : Boolean read FCBOS          write setCBOS;
    property TissPosicProf     : Boolean read FPosicProf     write setPosicProf;
  end;

  TTissConfBenific = class(TPersistent)
  private
    FValidadeCart : Boolean;
    FNomePlano    : Boolean;
    FNumCNS       : Boolean;
    FBenific      : Boolean;
    FNumCarteira  : Boolean;

    procedure setBenific(const Value: Boolean);
    procedure setNomePlano(const Value: Boolean);
    procedure setNumCarteira(const Value: Boolean);
    procedure setNumCNS(const Value: Boolean);
    procedure setValidadeCart(const Value: Boolean);
  public
    constructor Create;
  published
    property TissNumCarteira  : Boolean read FNumCarteira  write setNumCarteira;
    property TissBenific      : Boolean read FBenific      write setBenific;
    property TissNomePlano    : Boolean read FNomePlano    write setNomePlano;
    property TissValidadeCart : Boolean read FValidadeCart write setValidadeCart;
    property TissNumCNS       : Boolean read FNumCNS       write setNumCNS;
  end;

  TTissConfCabecalho = class(TPersistent)
  private
    FArqNomeHash       : Boolean;
    FTissTipoGeral     : Boolean;
    FNumLote           : Boolean;
    FDataRegistroTrans : Boolean;
    FUsarNomeArqu      : Boolean;
    FSequencialTrans   : Boolean;
    FHoraRegistroTrans : Boolean;
    FTipoTrans         : Boolean;
    FRegANS            : Boolean;
    FCNPJCPF           : Boolean;

    procedure setCNPJCPF(const Value: Boolean);
    procedure setDataRegistroTrans(const Value: Boolean);
    procedure setFArqNomeHash(const Value: Boolean);
    procedure setHoraRegistroTrans(const Value: Boolean);
    procedure setNumLote(const Value: Boolean);
    procedure setRegANS(const Value: Boolean);
    procedure setSequencialTrans(const Value: Boolean);
    procedure setTipoTrans(const Value: Boolean);
    procedure setTissTipoGeral(const Value: Boolean);
    procedure setUsarNomeArqu(const Value: Boolean);
  public
    constructor Create;
  published
    property TissTipoTrans         : Boolean read FTipoTrans         write setTipoTrans;
    property TissDataRegistroTrans : Boolean read FDataRegistroTrans write setDataRegistroTrans;
    property TissHoraRegistroTrans : Boolean read FHoraRegistroTrans write setHoraRegistroTrans;
    property TissSequencialTrans   : Boolean read FSequencialTrans   write setSequencialTrans;
    property TissCNPJCPF           : Boolean read FCNPJCPF           write setCNPJCPF;
    property TissRegANS            : Boolean read FRegANS            write setRegANS;
    property TissNumLote           : Boolean read FNumLote           write setNumLote;
    property TissTipoGeral         : Boolean read FTissTipoGeral     write setTissTipoGeral;
    property TissUsarNomeArqu      : Boolean read FUsarNomeArqu      write setUsarNomeArqu;
    property TissArqNomeHash       : Boolean read FArqNomeHash       write setFArqNomeHash;
  end;

  TTissConfHonorario = class(TPersistent)
  private
    FTissConfBenific      : TTissConfBenific;
    FTissCabecalho        : TTissConfCabecalho;
    FTissConfContratado   : TTissConfContratado;
    FTissPrestadorExec    : TTissConfContratado;
    FTissConfProfissional : TTissConfProfissional;
    FTissSPProcedimentos  : TTissConfSPProcedimentos;

    FUsarContratado       : Boolean;
    FNumGuiaOper          : Boolean;
    FNumLote              : Boolean;
    FUsarObs              : Boolean;
    FNumGuiaPrinc         : Boolean;
    FUsarProfissional     : Boolean;
    FCNPJCPF              : Boolean;
    FNumGuiaPrest         : Boolean;
    FTipoFat              : Boolean;
    FUsarPrestadorExec    : Boolean;
    FAcomod               : Boolean;
    FRegANS               : Boolean;
    FUsarUsarProc         : Boolean;
    FRegInt               : Boolean;
    FUsarBenefic          : Boolean;
    FPadraoTipFontPg      : TTissAnsRegCNPJ;

    procedure setAcomod(const Value: Boolean);
    procedure setCNPJCPF(const Value: Boolean);
    procedure setNumGuiaOper(const Value: Boolean);
    procedure setNumGuiaPrest(const Value: Boolean);
    procedure setNumGuiaPrinc(const Value: Boolean);
    procedure setNumLote(const Value: Boolean);
    procedure setRegANS(const Value: Boolean);
    procedure setRegInt(const Value: Boolean);
    procedure setTipoFat(const Value: Boolean);
    procedure setUsarBenefic(const Value: Boolean);
    procedure setUsarContratado(const Value: Boolean);
    procedure setUsarObs(const Value: Boolean);
    procedure setUsarPrestadorExec(const Value: Boolean);
    procedure setUsarProfissional(const Value: Boolean);
    procedure setUsarUsarProc(const Value: Boolean);
    procedure setPadraoTipFontPg(const Value: TTissAnsRegCNPJ);
  public
    constructor Create;
  published
    property TissUsarBenefic      : Boolean                  read FUsarBenefic          write setUsarBenefic;
    property TissUsarContratado   : Boolean                  read FUsarContratado       write setUsarContratado;
    property TissUsarIdentExec    : Boolean                  read FUsarPrestadorExec    write setUsarPrestadorExec;
    property TissUsarProc         : Boolean                  read FUsarUsarProc         write setUsarUsarProc;
    property TissUsarProfissional : Boolean                  read FUsarProfissional     write setUsarProfissional;

    property TissCabecalho        : TTissConfCabecalho       read FTissCabecalho        write FTissCabecalho;
    property TissBenefic          : TTissConfBenific         read FTissConfBenific      write FTissConfBenific;
    property TissContratado       : TTissConfContratado      read FTissConfContratado   write FTissConfContratado;
    property TissIdentExec        : TTissConfContratado      read FTissPrestadorExec    write FTissPrestadorExec;
    property TissProc             : TTissConfSPProcedimentos read FTissSPProcedimentos  write FTissSPProcedimentos;
    property TissProfissional     : TTissConfProfissional    read FTissConfProfissional write FTissConfProfissional;
    property PadraoTipFontPg      : TTissAnsRegCNPJ          read FPadraoTipFontPg      write setPadraoTipFontPg;

    property TissNumGuiaPrest     : Boolean                  read FNumGuiaPrest         write setNumGuiaPrest;
    property TissNumGuiaOper      : Boolean                  read FNumGuiaOper          write setNumGuiaOper;
    property TissNumGuiaPrinc     : Boolean                  read FNumGuiaPrinc         write setNumGuiaPrinc;

    property TissCNPJCPF          : Boolean                  read FCNPJCPF              write setCNPJCPF;
    property TissRegANS           : Boolean                  read FRegANS               write setRegANS;
    property TissTipoFat          : Boolean                  read FTipoFat              write setTipoFat;

    property TissNumLote          : Boolean                  read FNumLote              write setNumLote;
    property TissRegInt           : Boolean                  read FRegInt               write setRegInt;

    property TissAcomod           : Boolean                  read FAcomod               write setAcomod;
    property TissUsarObs          : Boolean                  read FUsarObs              write setUsarObs;
  end;

implementation

{ TTissConfProc }

constructor TTissConfProc.Create;
begin
  FCodigo    := True;
  FDescricao := True;
  FTipTabela := True;
end;

procedure TTissConfProc.setCodig(const Value: Boolean);
begin
  Self.FCodigo := Value;
end;

procedure TTissConfProc.setDescricao(const Value: Boolean);
begin
  Self.FDescricao := Value;
end;

procedure TTissConfProc.setTipTabela(const Value: Boolean);
begin
  Self.FTipTabela := Value;
end;

{ TTissConfSPProcedimentos }

constructor TTissConfSPProcedimentos.Create;
begin
  FProcs := TTissConfProc.Create;

  FTissData       := True;
  FTissHsFim      := True;
  FTissTecUtil    := True;
  FTissReducAcres := True;
  FTissValor      := True;
  FTissVdeAcesso  := True;
  FTissQtde       := True;
  FTissHsInicio   := True;
  FValorTotal     := True;
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

procedure TTissConfSPProcedimentos.setValorTotal(const Value: Boolean);
begin
  FValorTotal := Value;
end;

{ TTissConfHonorario }

constructor TTissConfHonorario.Create;
begin
  FTissCabecalho        := TTissConfCabecalho.Create;
  FTissConfBenific      := TTissConfBenific.Create;
  FTissConfContratado   := TTissConfContratado.Create;
  FTissPrestadorExec    := TTissConfContratado.Create;
  FTissSPProcedimentos  := TTissConfSPProcedimentos.Create;
  FTissConfProfissional := TTissConfProfissional.Create;

  FNumGuiaPrest      := True;
  FCNPJCPF           := True;
  FRegANS            := True;
  FNumGuiaOper       := True;
  FNumLote           := True;
  FNumGuiaPrinc      := True;
  FUsarBenefic       := True;
  FUsarContratado    := True;
  FUsarPrestadorExec := True;
  FUsarProfissional  := True;
  FUsarUsarProc      := True;
  FAcomod            := True;
  FTipoFat           := True;
end;

procedure TTissConfHonorario.setAcomod(const Value: Boolean);
begin
  FAcomod := Value;
end;

procedure TTissConfHonorario.setCNPJCPF(const Value: Boolean);
begin
  FCNPJCPF := Value;
end;

procedure TTissConfHonorario.setNumGuiaOper(const Value: Boolean);
begin
  FNumGuiaOper := Value;
end;

procedure TTissConfHonorario.setNumGuiaPrest(const Value: Boolean);
begin
  FNumGuiaPrest := Value;
end;

procedure TTissConfHonorario.setNumGuiaPrinc(const Value: Boolean);
begin
  FNumGuiaPrinc := Value;
end;

procedure TTissConfHonorario.setNumLote(const Value: Boolean);
begin
  FNumLote := Value;
end;

procedure TTissConfHonorario.setPadraoTipFontPg(
  const Value: TTissAnsRegCNPJ);
begin
  FPadraoTipFontPg := Value;
end;

procedure TTissConfHonorario.setRegANS(const Value: Boolean);
begin
  FRegANS := Value;
end;

procedure TTissConfHonorario.setRegInt(const Value: Boolean);
begin
  FRegInt := Value;
end;

procedure TTissConfHonorario.setTipoFat(const Value: Boolean);
begin
  FTipoFat := Value;
end;

procedure TTissConfHonorario.setUsarBenefic(const Value: Boolean);
begin
  FUsarBenefic := Value;
end;

procedure TTissConfHonorario.setUsarContratado(const Value: Boolean);
begin
  FUsarContratado := Value;
end;

procedure TTissConfHonorario.setUsarObs(const Value: Boolean);
begin
  FUsarObs := Value;
end;

procedure TTissConfHonorario.setUsarPrestadorExec(const Value: Boolean);
begin
  FUsarPrestadorExec := Value;
end;

procedure TTissConfHonorario.setUsarProfissional(const Value: Boolean);
begin
  FUsarProfissional := Value;
end;

procedure TTissConfHonorario.setUsarUsarProc(const Value: Boolean);
begin
  FUsarUsarProc := Value;
end;

{ TTissConfBenific }

constructor TTissConfBenific.Create;
begin
  FValidadeCart := True;
  FNomePlano    := True;
  FNumCNS       := True;
  FBenific      := True;
  FNumCarteira  := True;
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

constructor TTissConfCabecalho.Create;
begin
  FUsarNomeArqu      := False;
  FTissTipoGeral     := True;
  FSequencialTrans   := True;
  FRegANS            := True;
  FDataRegistroTrans := True;
  FNumLote           := True;
  FCNPJCPF           := True;
  FHoraRegistroTrans := True;
  FTipoTrans         := True;
  FArqNomeHash       := True;
end;

procedure TTissConfCabecalho.setCNPJCPF(const Value: Boolean);
begin
  FCNPJCPF := Value;
end;

procedure TTissConfCabecalho.setDataRegistroTrans(const Value: Boolean);
begin
  FDataRegistroTrans := Value;
end;

procedure TTissConfCabecalho.setFArqNomeHash(const Value: Boolean);
begin
  FArqNomeHash := Value;
end;

procedure TTissConfCabecalho.setHoraRegistroTrans(const Value: Boolean);
begin
  FHoraRegistroTrans := Value;
end;

procedure TTissConfCabecalho.setNumLote(const Value: Boolean);
begin
  FNumLote := Value;
end;

procedure TTissConfCabecalho.setRegANS(const Value: Boolean);
begin
  FRegANS := Value;
end;

procedure TTissConfCabecalho.setSequencialTrans(const Value: Boolean);
begin
  FSequencialTrans := Value;
end;

procedure TTissConfCabecalho.setTipoTrans(const Value: Boolean);
begin
  FTipoTrans := Value;
end;

procedure TTissConfCabecalho.setTissTipoGeral(const Value: Boolean);
begin
  FTissTipoGeral := Value;
end;

procedure TTissConfCabecalho.setUsarNomeArqu(const Value: Boolean);
begin
  FUsarNomeArqu := Value;
end;

{ TTissConfContratado }

constructor TTissConfContratado.Create;
begin
  FNomeContradado := True;
  FLogradouro     := True;
  FtipoLogradouro := True;
  FTissTipoGeral  := True;
  FEndNum         := True;
  FCEP            := True;
  FCNPJCPF        := True;
  FUF             := True;
  FcodigoIBGE     := True;
  FComplemento    := True;
  FMunicipio      := True;
  FCNES           := True;
  FUsarEnd        := True;
end;

procedure TTissConfContratado.setCEP(const Value: Boolean);
begin
  FCEP := Value;
end;

procedure TTissConfContratado.setCNES(const Value: Boolean);
begin
  FCNES := Value;
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

{ TTissConfProfissional }

constructor TTissConfProfissional.Create;
begin
  FProf          := True;
  FPosicProf     := True;
  FNumConselho   := True;
  FUFConselho    := True;
  FCBOS          := True;
  FSiglaConselho := True;
end;

procedure TTissConfProfissional.setCBOS(const Value: Boolean);
begin
  FCBOS := Value;
end;

procedure TTissConfProfissional.setNumConselho(const Value: Boolean);
begin
  FNumConselho := Value;
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
  FSiglaConselho := Value;
end;

procedure TTissConfProfissional.setUFConselho(const Value: Boolean);
begin
  FUFConselho := Value;
end;

end.

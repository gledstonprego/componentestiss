{**
  * Guia de Honorários Individual
  * @author: Wender L. Ferreira
  * @date  : 29-jul-2009
*}

unit TissHonorario;

interface

uses
  SysUtils, Classes, Windows, Dialogs, Messages, forms, xmldom, XMLIntf, msxmldom,
  XMLDoc, untTissComp, Graphics, untConfHonorario;

const
  MSG_TOVALIDATE_PTBR = 'A SER VALIDADO';
  MSG_ISVALID_PTBR    = 'VÁLIDO';
  MSG_ISNTVALID_PTBR  = 'INVÁLIDO';

type
  TTissProcedimento = class(TPersistent)
  private
    FTissQtde       : Currency;
    FTissValor      : Currency;
    FTissReducAcres : Currency;
    FValorTotal     : Currency;
    FTissVdeAcesso  : String;
    FTissTecUtil    : String;
    FTissHsFim      : TDateTime;
    FTissData       : TDateTime;
    FTissHsInicio   : TDateTime;
    FProcs          : TTissProc;

    procedure SetTissData(const Value: TDateTime);
    procedure SetTissHsFim(const Value: TDateTime);
    procedure SetTissHsInicio(const Value: TDateTime);
    procedure setTissQtde(const Value: Currency);
    procedure setTissReducAcres(const Value: Currency);
    procedure setTissTecUtil(const Value: String);
    procedure setTissValor(const Value: Currency);
    procedure setTissVdeAcesso(const Value: String);
    procedure setValorTotal(const Value: Currency);
  public
    constructor Create;
  published
    property TissProcs       : TTissProc read FProcs          write FProcs;
    property TissData        : TDateTime read FTissData       write SetTissData;
    property TissHsInicio    : TDateTime read FTissHsInicio   write SetTissHsInicio;
    property TissHsFim       : TDateTime read FTissHsFim      write SetTissHsFim;
    property TissQtde        : Currency  read FTissQtde       write setTissQtde;
    property TissVdeAcesso   : String    read FTissVdeAcesso  write setTissVdeAcesso;
    property TissTecUtil     : String    read FTissTecUtil    write setTissTecUtil;
    property TissReducAcres  : Currency  read FTissReducAcres write setTissReducAcres;
    property TissValor       : Currency  read FTissValor      write setTissValor;
    property TissValorTotal  : Currency  read FValorTotal     write setValorTotal;
  end;


  TTissHonorario = class(TComponent)
  private
    FTissConf            : TTissConfHonorario;

    FTissHonorario       : TStringList;
    FCabecalho           : TStringList;
    FGuia                : TStringList;
    FProc                : TStringList;

    FTissCabecalho       : TTissCabecalho;
    FFontePagadora       : TTissIdentFontPag;
    FTissBenific         : TTissBenific;
    FTissContratado      : TTissContratado;
    FTissPrestExec       : TTissContratado;
    FInfProfissional     : TTissProfissional;
    FTissProc            : TTissProcedimento;
    FTipoAcomodacao      : String;
    FCompVersao          : TCompVersao;
    FAnsVersaoxsd        : TTissAnsVersao;
    FNumeroGuiaPrincipal : String;
    FDataEmis            : TDateTime;
    FNumGuiaPrest        : String;
    FNumGuiaOper         : String;
    FTotalGeralHonorario : Currency;
    FObservacao          : String;
    FTissValid           : TTissValidacao;

    procedure setAnsVersaoxsd(const Value: TTissAnsVersao);
    procedure setCompVersao(const Value: TCompVersao);
    procedure setFontePagadora(const Value: TTissIdentFontPag);
    procedure setInfProfissional(const Value: TTissProfissional);
    procedure setTipoAcomodacao(const Value: String);
    procedure setTissBenific(const Value: TTissBenific);
    procedure setTissCabecalho(const Value: TTissCabecalho);
    procedure setTissContratado(const Value: TTissContratado);
    procedure setTissPrestExec(const Value: TTissContratado);
    procedure setDataEmis(const Value: TDateTime);
    procedure setNumGuiaOper(const Value: String);
    procedure setNumGuiaPrest(const Value: String);
    procedure setNumeroGuiaPrincipal(const Value: String);
    procedure setTissConf(const Value: TTissConfHonorario);
    procedure setTissProc(const Value: TTissProcedimento);
    procedure setObservacao(const Value: String);
    procedure setTotalGeralHonorario(const Value: Currency);
  protected
    function hash(arquivohash:string): String;
    function zeroEsquerda(value: String; count: Integer): String;
  public
    constructor Create(AOwner: TComponent); override;

    procedure iniciaHonorario;
    procedure criaCabecalho;
    procedure adicionarGuia;
    procedure adicionaProc;
    procedure finalizaGuia;
    procedure GerarXml;
  published
    property TissConf                : TTissConfHonorario read FTissConf            write setTissConf;
    property TissValid               : TTissValidacao     read FTissValid           write FTissValid;

    property TissCabecalho           : TTissCabecalho     read FTissCabecalho       write setTissCabecalho;
    property TissFontePagadora       : TTissIdentFontPag  read FFontePagadora       write setFontePagadora;
    property TissBenific             : TTissBenific       read FTissBenific         write setTissBenific;
    property TissContratado          : TTissContratado    read FTissContratado      write setTissContratado;
    property TissPrestExec           : TTissContratado    read FTissPrestExec       write setTissPrestExec;
    property TissInfProfissional     : TTissProfissional  read FInfProfissional     write setInfProfissional;
    property TissProc                : TTissProcedimento  read FTissProc            write setTissProc;
    property TissTipoAcomodacao      : String             read FTipoAcomodacao      write setTipoAcomodacao;
    property TissCompVersao          : TCompVersao        read FCompVersao          write setCompVersao;
    property ansVersaoXSD            : TTissAnsVersao     read FAnsVersaoxsd        write setAnsVersaoxsd;
    property TissNumeroGuiaPrincipal : String             read FNumeroGuiaPrincipal write setNumeroGuiaPrincipal;
    property TissDataEmis            : TDateTime          read FDataEmis            write setDataEmis;
    property TissNumGuiaPrest        : String             read FNumGuiaPrest        write setNumGuiaPrest;
    property TissNumGuiaOper         : String             read FNumGuiaOper         write setNumGuiaOper;
    property TissTotalGeralHonorario : Currency           read FTotalGeralHonorario write setTotalGeralHonorario;         
    property TissObservacao          : String             read FObservacao          write setObservacao;
  end;

procedure Register;

implementation

uses md52, Md5Tiss, untValida, untFunc, StrUtils;

procedure Register;
begin
  RegisterComponents('Tiss', [TTissHonorario]);
end;

{ TTissHonorario }

procedure TTissHonorario.adicionaProc;
begin
  try
    FProc.Add('<ans:procedimentoRealizado>');

      if FTissConf.TissProc.TissData then
      begin
        case ansVersaoXSD of
          v2_01_03: FProc.add('<ans:data>'+FormatDateTime('DD/MM/YYYY',FTissProc.TissData)+'</ans:data>');
          v2_02_01: FProc.add('<ans:data>'+FormatDateTime('YYYY-MM-DD',FTissProc.TissData)+'</ans:data>');
        end;
      end;

      if FTissConf.TissProc.TissHsInicio then
      begin
        case ansVersaoXSD of
          v2_01_03: FProc.add('<ans:horaInicio>'+FormatDateTime('hh:mm',FTissProc.TissHsInicio)+'</ans:horaInicio>');
          v2_02_01: FProc.add('<ans:horaInicio>'+FormatDateTime('hh:mm:ss',FTissProc.TissHsInicio)+'</ans:horaInicio>');
        end;
      end;

      if FTissConf.TissProc.TissHsFim then
      begin
        case ansVersaoXSD of
          v2_01_03: FProc.add('<ans:horaFim>'+FormatDateTime('hh:mm',FTissProc.TissHsFim)+'</ans:horaFim>');
          v2_02_01: FProc.add('<ans:horaFim>'+FormatDateTime('hh:mm:ss',FTissProc.TissHsFim)+'</ans:horaFim>');
        end;
      end;

      FProc.Add('<ans:procedimento>');
        if FTissConf.TissProc.TissProcs.TissCodigo then
          FProc.Add('<ans:codigo>'+FTissProc.TissProcs.TissCodigo+'</ans:codigo>');

        if FTissConf.TissProc.TissProcs.TissTipTabela then
          FProc.Add('<ans:tipoTabela>'+FormatFloat('00', FTissProc.TissProcs.TissTipTabela)+'</ans:tipoTabela>');

        if FTissConf.TissProc.TissProcs.TissDescricao then
          FProc.Add('<ans:descricao>'+FTissProc.TissProcs.TissDescricao+'</ans:descricao>');
      FProc.Add('</ans:procedimento>');

      if FTissConf.TissProc.TissQtde then
        FProc.add('<ans:quantidadeRealizada>'+CurrToStr(FTissProc.TissQtde)+'</ans:quantidadeRealizada>');

      if FTissConf.TissProc.TissVdeAcesso then
        FProc.Add('<ans:viaAcesso>'+FTissProc.TissVdeAcesso+'</ans:viaAcesso>');

      if FTissConf.TissProc.TissTecUtil then
        FProc.Add('<ans:tecnicaUtilizada>'+FTissProc.TissTecUtil+'</ans:tecnicaUtilizada>');

      if FTissConf.TissProc.TissReducAcres then
        FProc.Add('<ans:reducaoAcrescimo>'+CurrToStr(FTissProc.TissReducAcres)+'</ans:reducaoAcrescimo>');

      if FTissConf.TissProc.TissValor then
        FProc.Add('<ans:valor>'+CurrToStr(FTissProc.TissValor)+'</ans:valor>');

      if FTissConf.TissProc.TissValorTotal then
        FProc.Add('<ans:valorTotal>'+CurrToStr(FTissProc.TissValorTotal)+'</ans:valorTotal>');

    FProc.Add('</ans:procedimentoRealizado>');
  except
    on e: Exception do
    begin
      Application.MessageBox(PChar('Erro ao adicionar procedimento:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
    end;
  end;
end;

procedure TTissHonorario.adicionarGuia;
var
  i : Integer;
begin
  try
    FGuia.add('<ans:guiaHonorarioIndividual>');

      FGuia.add('<ans:identificacaoGuiaHonorarioIndividual>');
      if FAnsVersaoxsd = v2_02_01 then
      begin
        FGuia.Add('<ans:identificacaoFontePagadora>');
        case FTissConf.PadraoTipFontPg of
          RegistroANS: FGuia.add('<ans:registroANS>'+FFontePagadora.TissRegAns+'</ans:registroANS>');
          CNPJ: FGuia.add('<ans:cnpjFontePagadora>'+FFontePagadora.TissCnpj+'</ans:cnpjFontePagadora>');
        end;
        FGuia.add('</ans:identificacaoFontePagadora>');
      end
      else
      if FAnsVersaoxsd = v2_01_03 then
        if FTissConf.TissRegANS then
          FGuia.add('<ans:registroANS>'+FFontePagadora.TissRegAns+'</ans:registroANS>');

      case ansVersaoXSD of
        v2_01_03: FGuia.add('<ans:dataEmissaoGuia>'+FormatDateTime('DD/MM/YYYY', FDataEmis)+'</ans:dataEmissaoGuia>');
        v2_02_01: FGuia.add('<ans:dataEmissaoGuia>'+FormatDateTime('YYYY-MM-DD', FDataEmis)+'</ans:dataEmissaoGuia>');
      end;


      if FTissConf.TissNumGuiaPrest then
        FGuia.add('<ans:numeroGuiaPrestador>'+FNumGuiaPrest+'</ans:numeroGuiaPrestador>');

      if FTissConf.TissNumGuiaOper then
        FGuia.add('<ans:numeroGuiaOperadora>'+FNumGuiaOper+'</ans:numeroGuiaOperadora>');

      FGuia.add('</ans:identificacaoGuiaHonorarioIndividual>');

      if FTissConf.TissNumGuiaPrinc then
        FGuia.add('<ans:numeroGuiaPrincipal>'+FNumeroGuiaPrincipal+'</ans:numeroGuiaPrincipal>');


      FGuia.add('<ans:dadosBeneficiario>');

        if FTissConf.TissBenefic.TissNumCarteira then
          FGuia.add('<ans:numeroCarteira>'+FTissBenific.TissNumCarteira+'</ans:numeroCarteira>');

        if FTissConf.TissBenefic.TissBenific then
          FGuia.add('<ans:nomeBeneficiario>'+FTissBenific.TissBenific+'</ans:nomeBeneficiario>');

        if FTissConf.TissBenefic.TissNomePlano then
          FGuia.add('<ans:nomePlano>'+FTissBenific.TissNomePlano+'</ans:nomePlano>');

        if FTissConf.TissBenefic.TissValidadeCart then
        begin
          case ansVersaoXSD of
            v2_01_03: FGuia.add('<ans:validadeCarteira>'+FormatDateTime('DD/MM/YYYY',FTissBenific.TissValidadeCart)+'</ans:validadeCarteira>');
            v2_02_01: FGuia.add('<ans:validadeCarteira>'+FormatDateTime('YYYY-MM-DD',FTissBenific.TissValidadeCart)+'</ans:validadeCarteira>');
          end;
        end;

        if FTissConf.TissBenefic.TissNumCNS then
          FGuia.add('<ans:numeroCNS>'+FTissBenific.TissNumCNS+'</ans:numeroCNS>');

      FGuia.add('</ans:dadosBeneficiario>');

      FGuia.add('<ans:contratado>');
        FGuia.add('<ans:identificacao>');
          if FTissConf.TissContratado.TissCNPJCPF then
          begin
            if FTissContratado.TissTipoGeral = JuridicoGeral then
              FGuia.add('<ans:CNPJ>'+FTissContratado.TissCNPJCPF+'</ans:CNPJ>')
            else
            if FTissContratado.TissTipoGeral = FisicGeral then
              FGuia.add('<ans:cpf>'+FTissContratado.TissCNPJCPF+'</ans:cpf>')
            else
            if FTissContratado.TissTipoGeral = Outros then
              FGuia.add('<ans:codigoPrestadorNaOperadora>'+FTissContratado.TissCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
          end;
        FGuia.add('</ans:identificacao>');
        FGuia.add('<ans:nomeContratado>'+FTissContratado.TissNomeContradado+'</ans:nomeContratado>');

        if FTissConf.TissContratado.TissUsarEnd then
        begin
          FGuia.add('<ans:enderecoContratado>');
          if FTissConf.TissContratado.TisstipoLogradouro then
            FGuia.add('<ans:tipoLogradouro>'+FTissContratado.TisstipoLogradouro+'</ans:tipoLogradouro>');

          if FTissConf.TissContratado.TissLogradouro then
            FGuia.add('<ans:logradouro>'+FTissContratado.TissLogradouro+'</ans:logradouro>');

          if FTissConf.TissContratado.TissEndNum then
            FGuia.add('<ans:numero>'+FTissContratado.TissEndNum+'</ans:numero>');

          if FTissConf.TissContratado.TissComplemento then
            FGuia.add('<ans:complemento>'+FTissContratado.TissComplemento+'</ans:complemento>');

          if FTissConf.TissContratado.TisscodigoIBGE then
            FGuia.add('<ans:codigoIBGEMunicipio>'+FormatFloat('0000000',FTissContratado.TisscodigoIBGE)+'</ans:codigoIBGEMunicipio>');

          if FTissConf.TissContratado.TissMunicipio then
            FGuia.add('<ans:municipio>'+FTissContratado.TissMunicipio+'</ans:municipio>');

          if FTissConf.TissContratado.TissUF then
            FGuia.add('<ans:codigoUF>'+FTissContratado.TissUF+'</ans:codigoUF>');

          if FTissConf.TissContratado.TissCEP then
            FGuia.add('<ans:cep>'+FTissContratado.TissCEP+'</ans:cep>');

          FGuia.add('</ans:enderecoContratado>');
        end;

        FGuia.add('<ans:numeroCNES>'+FormatFloat('0000000', TissContratado.TissCNES)+'</ans:numeroCNES>');
      FGuia.add('</ans:contratado>');

      FGuia.add('<ans:contratadoExecutante>');
          FGuia.add('<ans:identificacao>');
            if FTissConf.TissIdentExec.TissCNPJCPF then
            begin
              if FTissPrestExec.TissTipoGeral = JuridicoGeral then
                FGuia.add('<ans:CNPJ>'+FTissPrestExec.TissCNPJCPF+'</ans:CNPJ>')
              else
              if FTissPrestExec.TissTipoGeral = FisicGeral then
                FGuia.add('<ans:cpf>'+FTissPrestExec.TissCNPJCPF+'</ans:cpf>')
              else
              if FTissPrestExec.TissTipoGeral = Outros then
                FGuia.add('<ans:codigoPrestadorNaOperadora>'+FTissPrestExec.TissCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
            end;
          FGuia.add('</ans:identificacao>');
          FGuia.add('<ans:nomeContratado>'+FTissPrestExec.TissNomeContradado+'</ans:nomeContratado>');

          if FTissConf.TissIdentExec.TissUsarEnd then
          begin
            FGuia.add('<ans:enderecoContratado>');
            if FTissConf.TissIdentExec.TisstipoLogradouro then
              FGuia.add('<ans:tipoLogradouro>'+FTissPrestExec.TisstipoLogradouro+'</ans:tipoLogradouro>');

            if FTissConf.TissIdentExec.TissLogradouro then
              FGuia.add('<ans:logradouro>'+FTissPrestExec.TissLogradouro+'</ans:logradouro>');

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

          FGuia.add('<ans:numeroCNES>'+FormatFloat('0000000', TissPrestExec.TissCNES)+'</ans:numeroCNES>');

        FGuia.add('<ans:identificacaoProfissional>');
          FGuia.add('<ans:nomeExecutante>'+FInfProfissional.TissProf+'</ans:nomeExecutante>');

          FGuia.add('<ans:conselhoProfissional>');
            FGuia.add('<ans:siglaConselho>'+FInfProfissional.TissSiglaConselho+'</ans:siglaConselho>');
            FGuia.add('<ans:numeroConselho>'+FInfProfissional.TissNumConselho+'</ans:numeroConselho>');
            FGuia.add('<ans:ufConselho>'+FInfProfissional.TissUFConselho+'</ans:ufConselho>');
          FGuia.add('</ans:conselhoProfissional>');

          FGuia.add('<ans:codigoCBOS>'+FInfProfissional.TissfCBOS+'</ans:codigoCBOS>');
        FGuia.add('</ans:identificacaoProfissional>');

        FGuia.add('<ans:posicaoProfissional>'+zeroEsquerda(IntToStr(FInfProfissional.TissPosicProf),2)+'</ans:posicaoProfissional>');
        FGuia.add('<ans:tipoAcomodacao>'+FTipoAcomodacao+'</ans:tipoAcomodacao>');

      FGuia.add('</ans:contratadoExecutante>');
  except
    on e: Exception do
      begin
        Application.MessageBox(PChar('Erro ao criar Guia;'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
      end;
  end;
end;

constructor TTissHonorario.Create(AOwner: TComponent);
begin
  inherited;
  FTissConf      := TTissConfHonorario.Create;
  FTissValid     := TTissValidacao.Create;

  FTissHonorario := TStringList.Create;
  FCabecalho     := TStringList.Create;

  FTissCabecalho := TTissCabecalho.Create;
  FCompVersao    := TCompVersao.Create;
  FTissProc      := TTissProcedimento.Create;

  FAnsVersaoxsd  := v2_01_03;
  iniciaHonorario;
end;

procedure TTissHonorario.criaCabecalho;
begin
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

    case FAnsVersaoXSD of
      v2_01_03: FCabecalho.Add('<ans:dataRegistroTransacao>'+FormatDateTime('DD/MM/YYYY',FTissCabecalho.TissDataRegistroTrans)+'</ans:dataRegistroTransacao>');
      v2_02_01: FCabecalho.Add('<ans:dataRegistroTransacao>'+FormatDateTime('YYYY-MM-DD',FTissCabecalho.TissDataRegistroTrans)+'</ans:dataRegistroTransacao>');
    end;

    case FAnsVersaoXSD of
      v2_01_03: FCabecalho.Add('<ans:horaRegistroTransacao>'+FormatDateTime('hh:mm',FTissCabecalho.TissHoraRegistroTrans)+'</ans:horaRegistroTransacao>');
      v2_02_01: FCabecalho.Add('<ans:horaRegistroTransacao>'+FormatDateTime('hh:mm:ss',FTissCabecalho.TissHoraRegistroTrans)+'</ans:horaRegistroTransacao>');
    end;

    FCabecalho.Add('</ans:identificacaoTransacao>');

    //TAG ORIGEM
    FCabecalho.Add('<ans:origem>');
    FCabecalho.Add('<ans:codigoPrestadorNaOperadora>');

    if FTissCabecalho.TissTipoGeral = JuridicoGeral then
      FCabecalho.Add('<ans:CNPJ>'+FTissCabecalho.TissCNPJCPF+'</ans:CNPJ>')
    else
    if FTissCabecalho.TissTipoGeral = FisicGeral then
      FCabecalho.Add('<ans:CPF>'+FTissCabecalho.TissCNPJCPF+'</ans:CPF>')
    else
    if FTissCabecalho.TissTipoGeral = Outros then
      FCabecalho.add('<ans:codigoPrestadorNaOperadora>'+FTissCabecalho.TissCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
      
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

procedure TTissHonorario.finalizaGuia;
begin
  try
//    FTissHonorario.AddStrings(FCabecalho);
    FTissHonorario.AddStrings(FGuia);

    if TissConf.TissUsarProc then
    begin
      FTissHonorario.add('<ans:procedimentosExamesRealizados>');
        FTissHonorario.AddStrings(FProc);
        FTissHonorario.add('<ans:totalGeralHonorario>'+CurrToStr(FTotalGeralHonorario)+'</ans:totalGeralHonorario>');
      FTissHonorario.add('</ans:procedimentosExamesRealizados>');
    end;
    
    if FTissConf.TissUsarObs  then
      FTissHonorario.Add('<ans:observacao>'+FObservacao+'</ans:observacao>');

    FTissHonorario.Add('</ans:guiaHonorarioIndividual>');

    FGuia.Clear;
    FProc.Clear;
  except
    on e: Exception do
    begin
      DecimalSeparator := '.';
      Application.MessageBox(PChar('Erro ao acessar arquivo:'+#13+e.Message),'ATENÇÃO',MB_OK+MB_ICONERROR);
    end;
  end;
end;

procedure TTissHonorario.GerarXml;
var
  arquivo,
  arquivoTemp : TextFile;
  numhash,
  linha,
  nomearq     : String;
  i           : Integer;
begin
  try
    AssignFile(arquivo, FTissCabecalho.TissArquivo);
    Rewrite(arquivo);

    for i:= 0 to FCabecalho.Count - 1 do
    begin
      Writeln(arquivo, FCabecalho.Strings[i]);
    end;

    for i:= 0 to FTissHonorario.Count - 1 do
    begin
      Writeln(arquivo, FTissHonorario.Strings[i]);
    end;

    Writeln(arquivo,'</ans:guiaFaturamento>');
    Writeln(arquivo,'</ans:guias>');
    Writeln(arquivo,'</ans:loteGuias>');
    Writeln(arquivo,'</ans:prestadorParaOperadora>');

    Writeln(arquivo,'</ans:mensagemTISS>');

    CloseFile(arquivo);

    numhash := hash(FTissCabecalho.TissArquivo);

    AssignFile(arquivo,FTissCabecalho.TissArquivo);
    Rewrite(arquivo);

    FTissHonorario.Add('</ans:guiaFaturamento>');
    FTissHonorario.Add('</ans:guias>');
    FTissHonorario.Add('</ans:loteGuias>');
    FTissHonorario.Add('</ans:prestadorParaOperadora>');
    FTissHonorario.Add('<ans:epilogo>');
    FTissHonorario.Add('<ans:hash>'+numhash+'</ans:hash>');
    FTissHonorario.Add('</ans:epilogo>');
    FTissHonorario.Add('</ans:mensagemTISS>');
            
    for i:= 0 to FCabecalho.Count - 1 do
    begin
      Writeln(arquivo, FCabecalho.Strings[i]);
    end;

    for i:= 0 to FTissHonorario.Count - 1 do
    begin
      Writeln(arquivo, FTissHonorario.Strings[i]);
    end;
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
        Application.CreateForm(TfrmValida, frmValida);
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

  if TissConf.TissCabecalho.TissArqNomeHash then
  begin
    try
      if not TissConf.TissCabecalho.TissUsarNomeArqu then
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

function TTissHonorario.hash(arquivohash: string): String;
var
  arquivo : TextFile;
  MD5     : TMD5;
  xml     : TXMLDocument;
begin
  try
    MD5 := TMD5.Create;
    xml := TXMLDocument.Create(self);
    xml.FileName := arquivohash;
    xml.Active   := True;
    Result       := LowerCase(md5.GeraHash(xml));
    xml.Active   := False;
  finally
    FreeAndNil(MD5);
    FreeAndNil(xml);
  end;
end;

procedure TTissHonorario.iniciaHonorario;
begin
  DecimalSeparator     := '.';
  FCompVersao          := TCompVersao.Create;
  FGuia                := TStringList.Create;
  FProc                := TStringList.Create;

  FFontePagadora       := TTissIdentFontPag.Create;
  FTissBenific         := TTissBenific.Create;
  FTissContratado      := TTissContratado.Create;
  FTissPrestExec       := TTissContratado.Create;
  FInfProfissional     := TTissProfissional.Create;
  FTissProc            := TTissProcedimento.Create;

  FTipoAcomodacao      := '';
  FNumeroGuiaPrincipal := '';
  FDataEmis            := 0;
  FNumGuiaPrest        := '';
  FNumGuiaOper         := '';
  FTotalGeralHonorario := 0;
  FObservacao          := '';
end;

procedure TTissHonorario.setAnsVersaoxsd(const Value: TTissAnsVersao);
begin
  FAnsVersaoxsd := Value;
end;

procedure TTissHonorario.setCompVersao(const Value: TCompVersao);
begin
  FCompVersao := Value;
end;

procedure TTissHonorario.setDataEmis(const Value: TDateTime);
begin
  FDataEmis := Value;
end;

procedure TTissHonorario.setFontePagadora(const Value: TTissIdentFontPag);
begin
  FFontePagadora := Value;
end;

procedure TTissHonorario.setInfProfissional(
  const Value: TTissProfissional);
begin
  FInfProfissional := Value;
end;

procedure TTissHonorario.setNumeroGuiaPrincipal(const Value: String);
begin
  FNumeroGuiaPrincipal := Value;
end;

procedure TTissHonorario.setNumGuiaOper(const Value: String);
begin
  FNumGuiaOper := Value;
end;

procedure TTissHonorario.setNumGuiaPrest(const Value: String);
begin
  FNumGuiaPrest := Value;
end;

procedure TTissHonorario.setObservacao(const Value: String);
begin
  FObservacao := Value;
end;

procedure TTissHonorario.setTipoAcomodacao(const Value: String);
begin
  FTipoAcomodacao := Value;
end;

procedure TTissHonorario.setTissBenific(const Value: TTissBenific);
begin
  FTissBenific := Value;
end;

procedure TTissHonorario.setTissCabecalho(const Value: TTissCabecalho);
begin
  FTissCabecalho := Value;
end;

procedure TTissHonorario.setTissConf(const Value: TTissConfHonorario);
begin
  FTissConf := Value;
end;

procedure TTissHonorario.setTissContratado(const Value: TTissContratado);
begin
  FTissContratado := Value;
end;

procedure TTissHonorario.setTissPrestExec(const Value: TTissContratado);
begin
  FTissPrestExec := Value;
end;

procedure TTissHonorario.setTissProc(const Value: TTissProcedimento);
begin
  FTissProc := Value;
end;

procedure TTissHonorario.setTotalGeralHonorario(const Value: Currency);
begin
  FTotalGeralHonorario := Value;
end;

function TTissHonorario.zeroEsquerda(value: String; count: Integer): String;
begin
  Result := DupeString('0',count-Length(Trim(Value)))+Trim(Value);
end;

{ TTissProcedimento }

constructor TTissProcedimento.Create;
begin
  FProcs := TTissProc.Create;
end;

procedure TTissProcedimento.SetTissData(const Value: TDateTime);
begin
  FTissData := Value;
end;

procedure TTissProcedimento.SetTissHsFim(const Value: TDateTime);
begin
  FTissHsFim := Value;
end;

procedure TTissProcedimento.SetTissHsInicio(const Value: TDateTime);
begin
  FTissHsInicio := Value;
end;

procedure TTissProcedimento.setTissQtde(const Value: Currency);
begin
  FTissQtde := Value;
end;

procedure TTissProcedimento.setTissReducAcres(const Value: Currency);
begin
  FTissReducAcres := Value;
end;

procedure TTissProcedimento.setTissTecUtil(const Value: String);
begin
  FTissTecUtil := Value;
end;

procedure TTissProcedimento.setTissValor(const Value: Currency);
begin
  FTissValor := Value;
end;

procedure TTissProcedimento.setTissVdeAcesso(const Value: String);
begin
  FTissVdeAcesso := Value;
end;

procedure TTissProcedimento.setValorTotal(const Value: Currency);
begin
  FValorTotal := Value;
end;

end.

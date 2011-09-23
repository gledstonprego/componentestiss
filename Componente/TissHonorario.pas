{**
  * Guia de Honorários Individual
  * @author: Wender L. Ferreira
  * @date  : 29-jul-2009
*}

unit TissHonorario;

interface

uses
  SysUtils, Classes, Windows, Dialogs, Messages, forms, xmldom, XMLIntf, msxmldom,
  XMLDoc, untTissComp, Graphics, untConfSPSADT, untConfHonorario;

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
    procedure setTissVdeAcesso(const Value: String);
    procedure setTissTecUtil(const Value: String);
    procedure setTissReducAcres(const Value: Currency);
    procedure setTissValor(const Value: Currency);
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

uses md52, Md5Tiss, untValida, untFunc;

procedure Register;
begin
  RegisterComponents('Tiss', [TTissHonorario]);
end;

{ TTissHonorario }

procedure TTissHonorario.adicionaProc;
begin
  try
    FProc.Add('<ansTISS:procedimentoRealizado>');

      if FTissConf.TissProc.TissData then
      begin
        if ansVersaoXSD = v2_01_03 then
          FProc.add('<ansTISS:data>'+FormatDateTime('DD/MM/YYYY',FTissProc.TissData)+'</ansTISS:data>')
        else
          FProc.add('<ansTISS:data>'+FormatDateTime('YYYY-MM-DD',FTissProc.TissData)+'</ansTISS:data>');
      end;
      if FTissConf.TissProc.TissHsInicio then
      begin
        if ansVersaoXSD = v2_01_03 then
          FProc.add('<ansTISS:horaInicio>'+FormatDateTime('hh:mm',FTissProc.TissHsInicio)+'</ansTISS:horaInicio>')
        else
          FProc.add('<ansTISS:horaInicio>'+FormatDateTime('hh:mm:ss',FTissProc.TissHsInicio)+'</ansTISS:horaInicio>');
      end;

      if FTissConf.TissProc.TissHsFim then
      begin
        if ansVersaoXSD = v2_01_03 then
          FProc.add('<ansTISS:horaFim>'+FormatDateTime('hh:mm',FTissProc.TissHsFim)+'</ansTISS:horaFim>')
        else
          FProc.add('<ansTISS:horaFim>'+FormatDateTime('hh:mm:ss',FTissProc.TissHsFim)+'</ansTISS:horaFim>');
      end;

      FProc.Add('<ansTISS:procedimento>');
        if FTissConf.TissProc.TissProcs.TissCodigo then
          FProc.Add('<ansTISS:codigo>'+FTissProc.TissProcs.TissCodigo+'</ansTISS:codigo>');

        if FTissConf.TissProc.TissProcs.TissTipTabela then
          FProc.Add('<ansTISS:tipoTabela>'+FormatFloat('00', FTissProc.TissProcs.TissTipTabela)+'</ansTISS:tipoTabela>');

        if FTissConf.TissProc.TissProcs.TissDescricao then
          FProc.Add('<ansTISS:descricao>'+FTissProc.TissProcs.TissDescricao+'</ansTISS:descricao>');
      FProc.Add('</ansTISS:procedimento>');

      if FTissConf.TissProc.TissQtde then
        FProc.add('<ansTISS:quantidadeRealizada>'+CurrToStr(FTissProc.TissQtde)+'</ansTISS:quantidadeRealizada>');

      if FTissConf.TissProc.TissVdeAcesso then
        FProc.Add('<ansTISS:viaAcesso>'+FTissProc.TissVdeAcesso+'</ansTISS:viaAcesso>');

      if FTissConf.TissProc.TissTecUtil then
        FProc.Add('<ansTISS:tecnicaUtilizada>'+FTissProc.TissTecUtil+'</ansTISS:tecnicaUtilizada>');

      if FTissConf.TissProc.TissReducAcres then
        FProc.Add('<ansTISS:reducaoAcrescimo>'+CurrToStr(FTissProc.TissReducAcres)+'</ansTISS:reducaoAcrescimo>');

      if FTissConf.TissProc.TissValor then
        FProc.Add('<ansTISS:valor>'+CurrToStr(FTissProc.TissValor)+'</ansTISS:valor>');

      if FTissConf.TissProc.TissValorTotal then
        FProc.Add('<ansTISS:valorTotal>'+CurrToStr(FTissProc.TissValorTotal)+'</ansTISS:valorTotal>');

    FProc.Add('</ansTISS:procedimentoRealizado>');
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
    FGuia.add('<ansTISS:guiaHonorarioIndividual>');

      FGuia.add('<ansTISS:identificacaoGuiaHonorarioIndividual>');
      if (FAnsVersaoxsd <> v2_01_03) then
      begin
        FGuia.Add('<ansTISS:identificacaoFontePagadora>');
        case FTissConf.PadraoTipFontPg of
          RegistroANS: FGuia.add('<ansTISS:registroANS>'+FFontePagadora.TissRegAns+'</ansTISS:registroANS>');
          CNPJ: FGuia.add('<ansTISS:cnpjFontePagadora>'+FFontePagadora.TissCnpj+'</ansTISS:cnpjFontePagadora>');
        end;
        FGuia.add('</ansTISS:identificacaoFontePagadora>');
      end
      else
      if FAnsVersaoxsd = v2_01_03 then
        if FTissConf.TissRegANS then
          FGuia.add('<ansTISS:registroANS>'+FFontePagadora.TissRegAns+'</ansTISS:registroANS>');

      if ansVersaoXSD = v2_01_03 then
        FGuia.add('<ansTISS:dataEmissaoGuia>'+FormatDateTime('DD/MM/YYYY', FDataEmis)+'</ansTISS:dataEmissaoGuia>')
      else
        FGuia.add('<ansTISS:dataEmissaoGuia>'+FormatDateTime('YYYY-MM-DD', FDataEmis)+'</ansTISS:dataEmissaoGuia>');

      if FTissConf.TissNumGuiaPrest then
        FGuia.add('<ansTISS:numeroGuiaPrestador>'+FNumGuiaPrest+'</ansTISS:numeroGuiaPrestador>');

      if FTissConf.TissNumGuiaOper then
        FGuia.add('<ansTISS:numeroGuiaOperadora>'+FNumGuiaOper+'</ansTISS:numeroGuiaOperadora>');

      FGuia.add('</ansTISS:identificacaoGuiaHonorarioIndividual>');

      if FTissConf.TissNumGuiaPrinc then
        FGuia.add('<ansTISS:numeroGuiaPrincipal>'+FNumeroGuiaPrincipal+'</ansTISS:numeroGuiaPrincipal>');


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

      FGuia.add('<ansTISS:contratado>');
        FGuia.add('<ansTISS:identificacao>');
          if FTissConf.TissContratado.TissCNPJCPF then
          begin
            if FTissContratado.TissTipoGeral = JuridicoGeral then
              FGuia.add('<ansTISS:CNPJ>'+FTissContratado.TissCNPJCPF+'</ansTISS:CNPJ>')
            else
            if FTissContratado.TissTipoGeral = FisicGeral then
              FGuia.add('<ansTISS:cpf>'+FTissContratado.TissCNPJCPF+'</ansTISS:cpf>')
            else
            if FTissContratado.TissTipoGeral = Outros then
              FGuia.add('<ansTISS:codigoPrestadorNaOperadora>'+FTissContratado.TissCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
          end;
        FGuia.add('</ansTISS:identificacao>');
        FGuia.add('<ansTISS:nomeContratado>'+FTissContratado.TissNomeContradado+'</ansTISS:nomeContratado>');

        if FTissConf.TissContratado.TissUsarEnd then
        begin
          FGuia.add('<ansTISS:enderecoContratado>');
          if FTissConf.TissContratado.TisstipoLogradouro then
            FGuia.add('<ansTISS:tipoLogradouro>'+FTissContratado.TisstipoLogradouro+'</ansTISS:tipoLogradouro>');

          if FTissConf.TissContratado.TissLogradouro then
            FGuia.add('<ansTISS:logradouro>'+FTissContratado.TissLogradouro+'</ansTISS:logradouro>');

          if FTissConf.TissContratado.TissEndNum then
            FGuia.add('<ansTISS:numero>'+FTissContratado.TissEndNum+'</ansTISS:numero>');

          if FTissConf.TissContratado.TissComplemento then
            FGuia.add('<ansTISS:complemento>'+FTissContratado.TissComplemento+'</ansTISS:complemento>');

          if FTissConf.TissContratado.TisscodigoIBGE then
            FGuia.add('<ansTISS:codigoIBGEMunicipio>'+FormatFloat('0000000',FTissContratado.TisscodigoIBGE)+'</ansTISS:codigoIBGEMunicipio>');

          if FTissConf.TissContratado.TissMunicipio then
            FGuia.add('<ansTISS:municipio>'+FTissContratado.TissMunicipio+'</ansTISS:municipio>');

          if FTissConf.TissContratado.TissUF then
            FGuia.add('<ansTISS:codigoUF>'+FTissContratado.TissUF+'</ansTISS:codigoUF>');

          if FTissConf.TissContratado.TissCEP then
            FGuia.add('<ansTISS:cep>'+FTissContratado.TissCEP+'</ansTISS:cep>');

          FGuia.add('</ansTISS:enderecoContratado>');
        end;

        FGuia.add('<ansTISS:numeroCNES>'+FormatFloat('0000000', TissContratado.TissCNES)+'</ansTISS:numeroCNES>');
      FGuia.add('</ansTISS:contratado>');

      FGuia.add('<ansTISS:contratadoExecutante>');
//        FGuia.add('<ansTISS:contratado>');
          FGuia.add('<ansTISS:identificacao>');
            if FTissConf.TissIdentExec.TissCNPJCPF then
            begin
              if FTissPrestExec.TissTipoGeral = JuridicoGeral then
                FGuia.add('<ansTISS:CNPJ>'+FTissPrestExec.TissCNPJCPF+'</ansTISS:CNPJ>')
              else
              if FTissPrestExec.TissTipoGeral = FisicGeral then
                FGuia.add('<ansTISS:cpf>'+FTissPrestExec.TissCNPJCPF+'</ansTISS:cpf>')
              else
              if FTissPrestExec.TissTipoGeral = Outros then
                FGuia.add('<ansTISS:codigoPrestadorNaOperadora>'+FTissPrestExec.TissCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
            end;
          FGuia.add('</ansTISS:identificacao>');
          FGuia.add('<ansTISS:nomeContratado>'+FTissPrestExec.TissNomeContradado+'</ansTISS:nomeContratado>');

          if FTissConf.TissIdentExec.TissUsarEnd then
          begin
            FGuia.add('<ansTISS:enderecoContratado>');
            if FTissConf.TissIdentExec.TisstipoLogradouro then
              FGuia.add('<ansTISS:tipoLogradouro>'+FTissPrestExec.TisstipoLogradouro+'</ansTISS:tipoLogradouro>');

            if FTissConf.TissIdentExec.TissLogradouro then
              FGuia.add('<ansTISS:logradouro>'+FTissPrestExec.TissLogradouro+'</ansTISS:logradouro>');

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

          FGuia.add('<ansTISS:numeroCNES>'+FormatFloat('0000000', TissPrestExec.TissCNES)+'</ansTISS:numeroCNES>');

//        FGuia.add('</ansTISS:contratado>');

        FGuia.add('<ansTISS:identificacaoProfissional>');
          FGuia.add('<ansTISS:nomeExecutante>'+FInfProfissional.TissProf+'</ansTISS:nomeExecutante>');

          FGuia.add('<ansTISS:conselhoProfissional>');
            FGuia.add('<ansTISS:siglaConselho>'+FInfProfissional.TissSiglaConselho+'</ansTISS:siglaConselho>');
            FGuia.add('<ansTISS:numeroConselho>'+FInfProfissional.TissNumConselho+'</ansTISS:numeroConselho>');
            FGuia.add('<ansTISS:ufConselho>'+FInfProfissional.TissUFConselho+'</ansTISS:ufConselho>');
          FGuia.add('</ansTISS:conselhoProfissional>');

          FGuia.add('<ansTISS:codigoCBOS>'+FInfProfissional.TissfCBOS+'</ansTISS:codigoCBOS>');
        FGuia.add('</ansTISS:identificacaoProfissional>');

        FGuia.add('<ansTISS:posicaoProfissional>'+FormatFloat('00',FInfProfissional.TissPosicProf)+'</ansTISS:posicaoProfissional>');
        FGuia.add('<ansTISS:tipoAcomodacao>'+FTipoAcomodacao+'</ansTISS:tipoAcomodacao>');

      FGuia.add('</ansTISS:contratadoExecutante>');
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
  FTissCabecalho := TTissCabecalho.Create;
  FTissConf      := TTissConfHonorario.Create;

  FTissHonorario := TStringList.Create;
  FCabecalho     := TStringList.Create;

  FCompVersao    := TCompVersao.Create;
  FTissProc      := TTissProcedimento.Create;

  FTissValid     := TTissValidacao.Create;
  FAnsVersaoxsd  := v2_02_03;
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
    FCabecalho.Add('<?xml version="'+FTissCabecalho.TissVersaoXml+'" encoding="'+FTissCabecalho.TissEncoding+'" ?>');

    FCabecalho.Add('<ansTISS:mensagemTISS '+FTissCabecalho.TissMensagemTissXml+'>');
    FCabecalho.Add('<ansTISS:cabecalho>');

  //TAG IDENTIFICAÇÃO DA TRANSAÇÃO
    FCabecalho.Add('<ansTISS:identificacaoTransacao>');
    FCabecalho.Add('<ansTISS:tipoTransacao>'+FTissCabecalho.TissTipoTrans+'</ansTISS:tipoTransacao>');

    FCabecalho.Add('<ansTISS:sequencialTransacao>'+FTissCabecalho.TissSequencialTrans+'</ansTISS:sequencialTransacao>');

    if FAnsVersaoXSD = v2_01_03 then
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
      FCabecalho.Add('<ansTISS:CNPJ>'+FTissCabecalho.TissCNPJCPF+'</ansTISS:CNPJ>')
    else
    if FTissCabecalho.TissTipoGeral = FisicGeral then
      FCabecalho.Add('<ansTISS:CPF>'+FTissCabecalho.TissCNPJCPF+'</ansTISS:CPF>')
    else
    if FTissCabecalho.TissTipoGeral = Outros then
      FCabecalho.add('<ansTISS:codigoPrestadorNaOperadora>'+FTissCabecalho.TissCNPJCPF+'</ansTISS:codigoPrestadorNaOperadora>');
      
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

procedure TTissHonorario.finalizaGuia;
begin
  try
//    FTissHonorario.AddStrings(FCabecalho);
    FTissHonorario.AddStrings(FGuia);

    if TissConf.TissUsarProc then
    begin
      FTissHonorario.add('<ansTISS:procedimentosExamesRealizados>');
        FTissHonorario.AddStrings(FProc);
        FTissHonorario.add('<ansTISS:totalGeralHonorario>'+CurrToStr(FTotalGeralHonorario)+'</ansTISS:totalGeralHonorario>');
      FTissHonorario.add('</ansTISS:procedimentosExamesRealizados>');
    end;
    
    if FTissConf.TissUsarObs  then
      FTissHonorario.Add('<ansTISS:observacao>'+FObservacao+'</ansTISS:observacao>');

    FTissHonorario.Add('</ansTISS:guiaHonorarioIndividual>');

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
  TrocaString: TStringList;
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

    Writeln(arquivo,'</ansTISS:guiaFaturamento>');
    Writeln(arquivo,'</ansTISS:guias>');
    Writeln(arquivo,'</ansTISS:loteGuias>');
    Writeln(arquivo,'</ansTISS:prestadorParaOperadora>');
    Writeln(arquivo,'</ansTISS:mensagemTISS>');

    CloseFile(arquivo);
    numhash := hash(FTissCabecalho.TissArquivo);
    AssignFile(arquivo,FTissCabecalho.TissArquivo);
    Rewrite(arquivo);

    FTissHonorario.Add('</ansTISS:guiaFaturamento>');
    FTissHonorario.Add('</ansTISS:guias>');
    FTissHonorario.Add('</ansTISS:loteGuias>');
    FTissHonorario.Add('</ansTISS:prestadorParaOperadora>');
    FTissHonorario.Add('<ansTISS:epilogo>');
    FTissHonorario.Add('<ansTISS:hash>'+numhash+'</ansTISS:hash>');
    FTissHonorario.Add('</ansTISS:epilogo>');
    FTissHonorario.Add('</ansTISS:mensagemTISS>');
            
    for i:= 0 to FCabecalho.Count - 1 do
      begin
        Writeln(arquivo,FCabecalho.Strings[i]);
      end;
    for i:= 0 to FTissHonorario.Count - 1 do
      begin
        Writeln(arquivo,FTissHonorario.Strings[i]);
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
  FCabecalho.Clear;
  FTissHonorario.Clear;       
  FProc.Clear;
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

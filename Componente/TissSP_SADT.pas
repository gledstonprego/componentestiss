unit TissSP_SADT;

interface

uses
  SysUtils, Classes,Windows,Dialogs,Messages,forms,xmldom, XMLIntf, msxmldom,
  XMLDoc,untTissComp,untConfSPSADT,Graphics;

const
  MSG_TOVALIDATE_PTBR = 'A SER VALIDADO';
  MSG_ISVALID_PTBR    = 'VÁLIDO';
  MSG_ISNTVALID_PTBR  = 'INVÁLIDO';

type
  TpessoaSP_SADT = (FisicoSP_SADT,JuridicoSP_SADT);
  TTissSP_SADT = class(TComponent)
  private
    FRegANS: String;  
    FCNPJCPF: String;

    FTissSPSADT: TStringList;
    FCabecalho: TStringList;
    FGuia:TStringList;
    FProc:TStringList;
    FMembEquipe:TStringList;
    FGeral: TStringList;
    FOutDesp: TStringList;

    FTipo: TpessoaSP_SADT;
    FNumLote: String;
    FNumGuiaPrest: String;
    FNumGuiaOper: String;
    FNumGuiaPrinc: String;
    FDataAut: TDateTime;
    FSenhaAut: String;
    FSenhaValid: TDateTime;
    FNomePlano: String;
    FTipoSP: TpessoaSP_SADT;

    FTissCabecalho: TTissCabecalho;
    FTissBenific: TTissBenific;
    FTissContratado: TTissContratado;
    FTissPrestExec: TTissContratado;
    FTissProfissional: TTissProfissional;
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
    FTissOutrasDesp: TTissOutrasDesp;

    procedure setCNPJCPF(const Value: String);
    procedure setRegANS(const Value: String);
    procedure setNumLote(const Value: String);
    function TiraMascara(Texto: String): String;
    function hash(arquivohash:string): String;
    procedure setNumGuiaOper(const Value: String);
    procedure setNumGuiaPrest(const Value: String);
    procedure setNumGuiaPrinc(const Value: String);
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
    procedure adicionaOutDesp;
    procedure finalizaGuia;
    procedure GerarXml;
    constructor Create(Aowner: TComponent);override;    
  published
    { Published declarations }
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
    //Profissional executante
    property TissProfissional:TTissProfissional read FTissProfissional write FTissProfissional;


    property TissCNPJCPF:String read FCNPJCPF write setCNPJCPF;
    property TissRegANS:String read FRegANS write setRegANS; 
    property TissNumLote:String read FNumLote write setNumLote;

    //GUIA
    property TissNumGuiaPrest:String read FNumGuiaPrest write setNumGuiaPrest;
    property TissNumGuiaOper:String read FNumGuiaOper write setNumGuiaOper;
    property TissNumGuiaPrinc:String read FNumGuiaPrinc write setNumGuiaPrinc;
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
    property TissTipoAtend:integer read FTipoAtend write setTipoAtend; //1,2,3,4,5,6,7,8,9,10

    //Procedimentos
    property TissProc:TTissSPProcedimentos read FTissSPProcedimentos write FTissSPProcedimentos;
    //Despesas
    property TissOutDesp:TTissOutrasDesp read FTissOutrasDesp write FTissOutrasDesp;    
    //Validação
    property TissValid: TTissValidacao read FTissValid write FTissValid;

  end;

procedure Register;

implementation

uses md52, TissConsulta, untFunc, untValida, Base64Tiss;


procedure Register;
begin
  RegisterComponents('Tiss', [TTissSP_SADT]);
end;

{ TTissSP_SADT }

procedure TTissSP_SADT.adicionaOutDesp;
begin
    try
      FOutDesp.Add('<ans:despesa>');

      with FTissConfSP_SADT.TissOutDesp do
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

procedure TTissSP_SADT.adicionaProc;
var
  i: Integer;
begin
    try
      FProc.Add('<ans:procedimentos>');
        if Tissconfig.TissProc.TissUsarEquipe then
          begin
            FProc.Add('<ans:equipe>');
              for i:= 0 to FMembEquipe.Count - 1 do
                begin
                  FProc.Add(FMembEquipe.Strings[i]);
                end;
            FProc.Add('</ans:equipe>');
          end;

        with FTissConfSP_SADT.TissProc do
          begin
            FProc.Add('<ans:procedimento>');
              if TissProcs.TissCodigo then
                FProc.Add('<ans:codigo>'+TissProc.TissProcs.TissCodigo+'</ans:codigo>');
              if TissProcs.TissTipTabela then
                FProc.Add('<ans:tipoTabela>'+FormatFloat('00', TissProc.TissProcs.TissTipTabela)+'</ans:tipoTabela>');
              if TissProcs.TissDescricao then
                FProc.Add('<ans:descricao>'+TissProc.TissProcs.TissDescricao+'</ans:descricao>');


            FProc.Add('</ans:procedimento>');
            if TissData then
              FProc.add('<ans:data>'+FormatDateTime('YYYY-MM-DD',TissProc.TissData)+'</ans:data>');
            if TissHsInicio then
              FProc.add('<ans:horaInicio>'+FormatDateTime('hh:mm:ss',TissProc.TissHsInicio)+'</ans:horaInicio>');
            if TissHsFim then
              FProc.add('<ans:horaFim>'+FormatDateTime('hh:mm:ss',TissProc.TissHsFim)+'</ans:horaFim>');
            if TissQtde then
              FProc.add('<ans:quantidadeRealizada>'+CurrToStr(TissProc.TissQtde)+'</ans:quantidadeRealizada>');
            if TissVdeAcesso then
              FProc.Add('<ans:viaAcesso>'+TissProc.TissVdeAcesso+'</ans:viaAcesso>');
            if TissTecUtil then
              FProc.Add('<ans:tecnicaUtilizada>'+TissProc.TissTecUtil+'</ans:tecnicaUtilizada>');
            if TissReducAcres then
              FProc.Add('<ans:reducaoAcrescimo>'+CurrToStr(TissProc.TissReducAcres)+'</ans:reducaoAcrescimo>');
            if TissValor then
              FProc.Add('<ans:valor>'+CurrToStr(TissProc.TissValor)+'</ans:valor>');
            if TissValorTotal then
              FProc.Add('<ans:valorTotal>'+CurrToStr(TissProc.TissValorTotal)+'</ans:valorTotal>');
          end;

      FProc.Add('</ans:procedimentos>');
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
      FMembEquipe.Add('<ans:membroEquipe>');
        FMembEquipe.Add('<ans:codigoProfissional>');
          if FTissConfSP_SADT.TissProc.TissEquipe.TissTipoMemb then
            begin
              if TissProc.TissEquipe.TissTipoMemb = JuridicoGeral then
                FMembEquipe.Add('<ans:CNPJ>'+TissProc.TissEquipe.TissCodProf+'</ans:CNPJ>');
              if TissProc.TissEquipe.TissTipoMemb = FisicGeral then
                FMembEquipe.Add('<ans:cpf>'+TissProc.TissEquipe.TissCodProf+'</ans:cpf>');
              if TissProc.TissEquipe.TissTipoMemb = Outros then
                FMembEquipe.Add('<ans:codigoPrestadorNaOperadora>'+TissProc.TissEquipe.TissCodProf+'</ans:codigoPrestadorNaOperadora>');
            end;
        FMembEquipe.Add('</ans:codigoProfissional>');

        FMembEquipe.Add('<ans:identificacaoProfissional>');
          with FTissConfSP_SADT.TissProc.TissEquipe do
            begin
              if TissProfiss.TissProf then
                FMembEquipe.Add('<ans:nomeExecutante>'+TissProc.TissEquipe.TissProfiss.TissProf+'</ans:nomeExecutante>');
                FMembEquipe.Add('<ans:conselhoProfissional>');
                  if TissProfiss.TissSiglaConselho then
                    FMembEquipe.Add('<ans:siglaConselho>'+TissProc.TissEquipe.TissProfiss.TissSiglaConselho+'</ans:siglaConselho>');
                  if TissProfiss.TissNumConselho then
                    FMembEquipe.Add('<ans:numeroConselho>'+TissProc.TissEquipe.TissProfiss.TissNumConselho+'</ans:numeroConselho>');
                  if TissProfiss.TissUFConselho then
                    FMembEquipe.Add('<ans:ufConselho>'+TissProc.TissEquipe.TissProfiss.TissUFConselho+'</ans:ufConselho>');
                FMembEquipe.Add('</ans:conselhoProfissional>');
                if TissProfiss.TissfCBOS then
                  FMembEquipe.Add('<ans:codigoCBOS>'+FormatFloat('00000',TissProc.TissEquipe.TissProfiss.TissfCBOS)+'</ans:codigoCBOS>');
              FMembEquipe.Add('</ans:identificacaoProfissional>');
              if TissProfiss.TissPosicProf then
                FMembEquipe.Add('<ans:posicaoProfissional>'+IntToStr(TissProc.TissEquipe.TissProfiss.TissPosicProf)+'</ans:posicaoProfissional>');
            end;
      FMembEquipe.Add('</ans:membroEquipe>');
    end;
end;

procedure TTissSP_SADT.adicionarGuia;
begin
    try

      FGuia.add('<ans:guiaSP_SADT>');

        FGuia.add('<ans:identificacaoGuiaSADTSP>');
          if FTissConfSP_SADT.TissRegANS then
            FGuia.add('<ans:registroANS>'+FRegAns+'</ans:registroANS>');
          FGuia.add('<ans:dataEmissaoGuia>'+FormatDateTime('YYYY-MM-DD',Date)+'</ans:dataEmissaoGuia>');
          if FTissConfSP_SADT.TissNumGuiaPrest then
            FGuia.add('<ans:numeroGuiaPrestador>'+FNumGuiaPrest+'</ans:numeroGuiaPrestador>');
          if FTissConfSP_SADT.TissNumGuiaOper then
            FGuia.add('<ans:numeroGuiaOperadora>'+FNumGuiaOper+'</ans:numeroGuiaOperadora>');

        FGuia.add('</ans:identificacaoGuiaSADTSP>');
        if FTissConfSP_SADT.TissNumGuiaPrinc then
          FGuia.add('<ans:numeroGuiaPrincipal>'+FNumGuiaPrinc+'</ans:numeroGuiaPrincipal>');

        if (FTissConfSP_SADT.TissDataAut) or
        (FTissConfSP_SADT.TissSenhaAut) or
        (FTissConfSP_SADT.TissSenhaValid) then
          begin
            FGuia.add('<ans:dadosAutorizacao>');
              if FTissConfSP_SADT.TissDataAut then
                FGuia.add('<ans:dataAutorizacao>'+FormatDateTime('YYYY-MM-DD',FDataAut)+'</ans:dataAutorizacao>');
              if FTissConfSP_SADT.TissSenhaAut then
                FGuia.add('<ans:senhaAutorizacao>'+FSenhaAut+'</ans:senhaAutorizacao>');
              if FTissConfSP_SADT.TissSenhaValid then
                FGuia.add('<ans:validadeSenha>'+FormatDateTime('YYYY-MM-DD',FSenhaValid)+'</ans:validadeSenha>');
            FGuia.add('</ans:dadosAutorizacao>');
          end;

        if Tissconfig.TissUsarBenefic then
          begin
            FGuia.add('<ans:dadosBeneficiario>');
              if FTissConfSP_SADT.TissBenefic.TissNumCarteira then
                FGuia.add('<ans:numeroCarteira>'+FTissBenific.TissNumCarteira+'</ans:numeroCarteira>');
              if FTissConfSP_SADT.TissBenefic.TissBenific then
                FGuia.add('<ans:nomeBeneficiario>'+FTissBenific.TissBenific+'</ans:nomeBeneficiario>');
              if FTissConfSP_SADT.TissBenefic.TissNomePlano then
                FGuia.add('<ans:nomePlano>'+FTissBenific.TissNomePlano+'</ans:nomePlano>');
              if FTissConfSP_SADT.TissBenefic.TissValidadeCart then
                FGuia.add('<ans:validadeCarteira>'+FormatDateTime('YYYY-MM-DD',FTissBenific.TissValidadeCart)+'</ans:validadeCarteira>');
              if FTissConfSP_SADT.TissBenefic.TissNumCNS then
                FGuia.add('<ans:numeroCNS>'+FTissBenific.TissNumCNS+'</ans:numeroCNS>');

            FGuia.add('</ans:dadosBeneficiario>');
          end;

        if (Tissconfig.TissUsarProfissional) or
        (Tissconfig.TissUsarContratado) then
          begin
            FGuia.add('<ans:dadosSolicitante>');
            if Tissconfig.TissUsarContratado then
              begin
                FGuia.add('<ans:contratado>');

                  FGuia.add('<ans:identificacao>');
                    if FTissConfSP_SADT.TissContratado.TissCNPJCPF then
                      begin
                        if TissContratado.TissTipoGeral = JuridicoGeral then
                          FGuia.add('<ans:CNPJ>'+TissContratado.TissCNPJCPF+'</ans:CNPJ>');

                        if TissContratado.TissTipoGeral = FisicGeral then
                          FGuia.add('<ans:cpf>'+TissContratado.TissCNPJCPF+'</ans:cpf>');

                        if TissContratado.TissTipoGeral = Outros then
                          FGuia.Add('<ans:codigoPrestadorNaOperadora>'+TissContratado.TissCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
                      end;

                  FGuia.add('</ans:identificacao>');
                  if FTissConfSP_SADT.TissContratado.TissNomeContradado then
                    FGuia.add('<ans:nomeContratado>'+TissContratado.TissNomeContradado+'</ans:nomeContratado>');

                  If FTissConfSP_SADT.TissContratado.TissUsarEnd then
                    begin
                      FGuia.add('<ans:enderecoContratado>');
                        if FTissConfSP_SADT.TissContratado.TisstipoLogradouro then
                          FGuia.add('<ans:tipoLogradouro>'+TissContratado.TisstipoLogradouro+'</ans:tipoLogradouro>');
                        if FTissConfSP_SADT.TissContratado.TissLogradouro then
                          FGuia.add('<ans:logradouro>'+TissContratado.TissLogradouro+'</ans:logradouro>');
                        if FTissConfSP_SADT.TissContratado.TissEndNum then
                          FGuia.add('<ans:numero>'+TissContratado.TissEndNum+'</ans:numero>');
                        if FTissConfSP_SADT.TissContratado.TissComplemento then
                          FGuia.add('<ans:complemento>'+TissContratado.TissComplemento+'</ans:complemento>');
                        if FTissConfSP_SADT.TissContratado.TisscodigoIBGE then
                          FGuia.add('<ans:codigoIBGEMunicipio>'+FormatFloat('0000000',TissContratado.TisscodigoIBGE)+'</ans:codigoIBGEMunicipio>');
                        if FTissConfSP_SADT.TissContratado.TissMunicipio then
                          FGuia.add('<ans:municipio>'+TissContratado.TissMunicipio+'</ans:municipio>');
                        if FTissConfSP_SADT.TissContratado.TissUF then
                          FGuia.add('<ans:codigoUF>'+TissContratado.TissUF+'</ans:codigoUF>');
                        if FTissConfSP_SADT.TissContratado.TissCEP then
                          FGuia.add('<ans:cep>'+TissContratado.TissCEP+'</ans:cep>');

                      FGuia.add('</ans:enderecoContratado>');
                    end;
                  if FTissConfSP_SADT.TissContratado.TissCNES then
                    FGuia.add('<ans:numeroCNES>'+FormatFloat('0000000', TissContratado.TissCNES)+'</ans:numeroCNES>');

                FGuia.add('</ans:contratado>');
              end;
              if Tissconfig.TissUsarProfissional then
                begin
                  FGuia.add('<ans:profissional>');
                    if FTissConfSP_SADT.TissProfissional.TissProf then
                      FGuia.add('<ans:nomeProfissional>'+ FTissProfissional.TissProf+'</ans:nomeProfissional>');
                    FGuia.add('<ans:conselhoProfissional>');
                    if FTissConfSP_SADT.TissProfissional.TissSiglaConselho then
                      FGuia.add('<ans:siglaConselho>'+FTissProfissional.TissSiglaConselho+'</ans:siglaConselho>');
                    if FTissConfSP_SADT.TissProfissional.TissNumConselho then
                      FGuia.add('<ans:numeroConselho>'+FTissProfissional.TissNumConselho+'</ans:numeroConselho>');
                    if FTissConfSP_SADT.TissProfissional.TissUFConselho then
                      FGuia.add('<ans:ufConselho>'+FTissProfissional.TissUFConselho+'</ans:ufConselho>');
                    FGuia.add('</ans:conselhoProfissional>');
                    if FTissConfSP_SADT.TissProfissional.TissfCBOS then
                     FGuia.add('<ans:cbos>'+FormatFloat('00000',FTissProfissional.TissfCBOS)+'</ans:cbos>');
                  FGuia.add('</ans:profissional>');
               end;
            FGuia.add('</ans:dadosSolicitante>');
          end;
        if Tissconfig.TissUsarPrestadorExec then
          begin
            FGuia.add('<ans:prestadorExecutante>');
              FGuia.add('<ans:identificacao>');
                if FTissConfSP_SADT.TissPrestadorExec.TissCNPJCPF then
                  begin
                    if FTissPrestExec.TissTipoGeral = JuridicoGeral then
                      FGuia.add('<ans:CNPJ>'+FTissPrestExec.TissCNPJCPF+'</ans:CNPJ>');
                    if FTissPrestExec.TissTipoGeral = FisicGeral then
                      FGuia.add('<ans:cpf>'+FTissPrestExec.TissCNPJCPF+'</ans:cpf>');

                    if FTissPrestExec.TissTipoGeral = Outros then
                      FGuia.add('<ans:codigoPrestadorNaOperadora>'+FTissPrestExec.TissCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
                  end;
              FGuia.add('</ans:identificacao>');
              if FTissConfSP_SADT.TissPrestadorExec.TissNomeContradado then
                FGuia.add('<ans:nomeContratado>'+FTissPrestExec.TissNomeContradado+'</ans:nomeContratado>');

              FGuia.add('<ans:enderecoContratado>');
                if FTissConfSP_SADT.TissPrestadorExec.TisstipoLogradouro then
                  FGuia.add('<ans:tipoLogradouro>'+FTissPrestExec.TisstipoLogradouro+'</ans:tipoLogradouro>');
                if FTissConfSP_SADT.TissPrestadorExec.TissLogradouro then
                  FGuia.add('<ans:logradouro>'+FTissPrestExec.TissLogradouro+'</ans:logradouro>');
                if FTissConfSP_SADT.TissPrestadorExec.TissEndNum then
                  FGuia.add('<ans:numero>'+FTissPrestExec.TissEndNum+'</ans:numero>');
                if FTissConfSP_SADT.TissPrestadorExec.TissComplemento then
                  FGuia.add('<ans:complemento>'+FTissPrestExec.TissComplemento+'</ans:complemento>');
                if FTissConfSP_SADT.TissPrestadorExec.TisscodigoIBGE then
                  FGuia.add('<ans:codigoIBGEMunicipio>'+FormatFloat('0000000',FTissPrestExec.TisscodigoIBGE)+'</ans:codigoIBGEMunicipio>');
                if FTissConfSP_SADT.TissPrestadorExec.TissMunicipio then
                  FGuia.add('<ans:municipio>'+FTissPrestExec.TissMunicipio+'</ans:municipio>');
                if FTissConfSP_SADT.TissPrestadorExec.TissUF then
                  FGuia.add('<ans:codigoUF>'+FTissPrestExec.TissUF+'</ans:codigoUF>');
                if FTissConfSP_SADT.TissPrestadorExec.TissCEP then
                  FGuia.add('<ans:cep>'+FTissPrestExec.TissCEP+'</ans:cep>');

              FGuia.add('</ans:enderecoContratado>');
              if FTissConfSP_SADT.TissPrestadorExec.TissCNES then
                FGuia.add('<ans:numeroCNES>'+FormatFloat('0000000', FTissPrestExec.TissCNES)+'</ans:numeroCNES>');

            FGuia.add('</ans:prestadorExecutante>');
          end;

        if FTissConfSP_SADT.TissindicClinica then
          FGuia.add('<ans:indicacaoClinica>'+FindicClinica+'</ans:indicacaoClinica>');
        if FTissConfSP_SADT.TisscaraterAtend then
          FGuia.add('<ans:caraterAtendimento>'+FcaraAtend+'</ans:caraterAtendimento>');
        if FTissConfSP_SADT.TissDataAtend then
        FGuia.add('<ans:dataHoraAtendimento>'+FormatDateTime('YYYY-MM-DD',FDataATend)+'T'+FormatDateTime('hh:mm:ss',FHoraAtend)+'</ans:dataHoraAtendimento>');

        if Tissconfig.TissUsarDiagnostico then
          begin
            FGuia.add('<ans:diagnosticoGuia>');
              FGuia.add('<ans:CID>');
                if FTissConfSP_SADT.TissDiagnostico.TissCIDNomeTab then
                  FGuia.add('<ans:nomeTabela>'+FTissDiagnostico.TissCIDNomeTab+'</ans:nomeTabela>');
                if FTissConfSP_SADT.TissDiagnostico.TissCIDCodDiag then
                  FGuia.add('<ans:codigoDiagnostico>'+FTissDiagnostico.TissCIDCodDiag+'</ans:codigoDiagnostico>');
                if FTissConfSP_SADT.TissDiagnostico.TissCIDDescDiag then
                  FGuia.add('<ans:descricaoDiagnostico>'+FTissDiagnostico.TissCIDDescDiag+'</ans:descricaoDiagnostico>');
              FGuia.add('</ans:CID>');
              if FTissConfSP_SADT.TissDiagnostico.TissTipDoenc then
                FGuia.add('<ans:tipoDoenca>'+FTissDiagnostico.TissTipDoenc+'</ans:tipoDoenca>');
              if (FTissConfSP_SADT.TissDiagnostico.TissValor) or
               (FTissConfSP_SADT.TissDiagnostico.TissUnTemp) then
                begin
                  FGuia.add('<ans:tempoReferidoEvolucaoDoenca>');
                    if FTissConfSP_SADT.TissDiagnostico.TissValor then
                      FGuia.add('<ans:valor>'+inttoStr(FTissDiagnostico.TissValor)+'</ans:valor>');
                    if FTissConfSP_SADT.TissDiagnostico.TissUnTemp then
                      FGuia.add('<ans:unidadeTempo>'+FTissDiagnostico.TissUnTemp+'</ans:unidadeTempo>');
                  FGuia.add('</ans:tempoReferidoEvolucaoDoenca>');
                end;
              if FTissConfSP_SADT.TissDiagnostico.TissIndicAcid then
                FGuia.add('<ans:indicadorAcidente>'+inttoStr(FTissDiagnostico.TissIndicAcid)+'</ans:indicadorAcidente>');

            FGuia.add('</ans:diagnosticoGuia>');
          end;
        if FTissConfSP_SADT.TissTipoSaida then
          FGuia.add('<ans:tipoSaida>'+FTipoSaida+'</ans:tipoSaida>');
        if FTissConfSP_SADT.TissTipoAtend then
          FGuia.add('<ans:tipoAtendimento>'+inttostr(FTipoAtend)+'</ans:tipoAtendimento>');
        if Tissconfig.TissUsarProc then
          FGuia.add('<ans:procedimentosRealizados>');
     // FGuia.add('</ans:guiaSP_SADT>');
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
  FTissProfissional := TTissProfissional.create;
  FTissDiagnostico := TTissDiagnostico.create;
  FTissSPProcedimentos := TTissSPProcedimentos.create;
  FTissConfSP_SADT := TTissConfSP_SADT.create;
  FCompVersao := TCompVersao.create;
  FTissValid := TTissValidacao.create;
  FTissOutrasDesp := TTissOutrasDesp.create;

  FTissCabecalho.TissEncoding:='ISO-8859-1';
  FTissCabecalho.TissVersaoXml:='1.0';
  FTissCabecalho.TissVersaoTISS:='2.01.02';
  FTipoSP:=JuridicoSP_SADT;
  FTissCabecalho.TissMensagemTissXml:='xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.ans.gov.br/padroes/tiss/schemas"';

  inherited;

end;

procedure TTissSP_SADT.criaCabecalho;
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
        FCabecalho.Add('<ans:codigoPrestadorNaOperadora>'+FTissCabecalho.TissCNPJCPF+'</ans:codigoPrestadorNaOperadora>');
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

procedure TTissSP_SADT.criaRodape;
var
  arquivo,arquivoTemp: TextFile;
  numhash,linha: string;
begin
    try
      AssignFile(arquivo,FTissCabecalho.TissArquivo);
      Append(arquivo);

      Writeln(arquivo,'</ans:guiaFaturamento>');
      Writeln(arquivo,'</ans:guias>');
      Writeln(arquivo,'</ans:loteGuias>');
      Writeln(arquivo,'</ans:prestadorParaOperadora>');  

      Writeln(arquivo,'</ans:mensagemTISS>');


      CloseFile(arquivo);
      AssignFile(arquivoTemp,'temp.xml');
      Rewrite(arquivoTemp);

      numhash := hash(FTissCabecalho.TissArquivo);
      
      AssignFile(arquivo,FTissCabecalho.TissArquivo);
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
  numhash,linha: string;
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
          FGeral.add('</ans:procedimentosRealizados>');
        end;
      if Tissconfig.TissUsarOutDespesas then
        begin
          FGeral.Add('<ans:outrasDespesas>');
          for i := 0 to FOutDesp.Count - 1 do
            begin
              FGeral.Add(FOutDesp.Strings[i]);
            end;
          FGeral.Add('</ans:outrasDespesas>')
        end;
      FGeral.Add('</ans:guiaSP_SADT>');
      FGuia.Clear;
      FProc.Clear;
      FMembEquipe.Clear;


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
begin
    try 
      AssignFile(arquivo,FTissCabecalho.TissArquivo);
      Rewrite(arquivo);
      {FCabecalho.Add('<ans:guiaSP_SADT>');
      for i:= 0 to FGuia.Count - 1 do
        begin
          FCabecalho.Add(FGuia.Strings[i]);
        end;
      for i:= 0 to FProc.Count - 1 do
        begin
          FCabecalho.Add(FProc.Strings[i]);
        end;
      FCabecalho.add('</ans:procedimentosRealizados>');
      FCabecalho.Add('</ans:guiaSP_SADT>');
      FCabecalho.Add('</ans:guiaFaturamento>');
      FCabecalho.Add('</ans:guias>');
      FCabecalho.Add('</ans:loteGuias>');
      FCabecalho.Add('</ans:prestadorParaOperadora>');

      FCabecalho.Add('</ans:mensagemTISS>');}




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
         // RenameFile(Tisscabecalho.TissArquivo,copy(ExtractFileName(Tisscabecalho.TissArquivo),1,length(ExtractFileName(Tisscabecalho.TissArquivo))-4)+ numhash+'.xml');
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


procedure TTissSP_SADT.iniciaSPSADT;
begin
  FCabecalho := TStringList.Create;
  FTissSPSADT := TStringList.create;
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
  FTissSPSADT.Clear;
 
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



procedure TTissSP_SADT.setRegANS(const Value: String);
begin
  FRegANS := Value;
end;

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

end.

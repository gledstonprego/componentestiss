object Form1: TForm1
  Left = 262
  Top = 66
  BorderStyle = bsDialog
  Caption = 'Form1'
  ClientHeight = 513
  ClientWidth = 536
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 16
    Width = 3
    Height = 13
  end
  object lblVersao: TLabel
    Left = 193
    Top = 147
    Width = 53
    Height = 13
    Caption = 'lblVersao'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 8
    Top = 16
    Width = 129
    Height = 25
    Caption = 'Gerar Consulta    '
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 48
    Width = 129
    Height = 25
    Caption = 'Gerar SP/SADT '
    TabOrder = 1
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 144
    Top = 8
    Width = 392
    Height = 129
    Lines.Strings = (
      
        'Todos os componentes est'#227'o em fase de teste, e n'#227'o foi colocado ' +
        'ainda todos'
      'os campos da Guia somente os obrigat'#243'rios.'
      ''
      'Desenvolvimento'
      'Contato: fopprado@gmail.com'
      ''
      'Ajuda e teste'
      'Contato: paulosilvaaps@gmail.com'
      '')
    TabOrder = 2
  end
  object PageControl1: TPageControl
    Left = 0
    Top = 215
    Width = 536
    Height = 298
    ActivePage = TabSheet5
    Align = alBottom
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Arquivo'
      object RichEdit1: TRichEdit
        Left = 0
        Top = 0
        Width = 528
        Height = 270
        Align = alClient
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'ATEN'#199#195'O'
      ImageIndex = 1
      object RichEdit2: TRichEdit
        Left = 0
        Top = 0
        Width = 528
        Height = 270
        Align = alClient
        Lines.Strings = (
          'Muita Aten'#231#227'o antes de gerar os arquivos:'
          ''
          'Existe em cada componente um propriedade para configurar os '
          'campos que ir'#227'o aparecer nos arquivos, por exemplo:'
          'No componente para SP/SADT tem uma propriedade chamada:'
          
            'TISSCONFIG onde voc'#234' define o que vai ser gerado no arquivo, se ' +
            'por '
          'exemplo voc'#234' colocar a propriedade TISSHORAATEND para FALSE'
          
            'no arquivo gerado n'#227'o ir'#225' aparecer a linha correspondente a Hora' +
            ' do atendimento,'
          
            'ent'#227'o muito cuidado se voc'#234' definir qualquer campo como TRUE, o ' +
            'campo'
          
            'ser'#225' gerado mesmo que n'#227'o for informado nenhum valor podendo ass' +
            'im '
          
            'gerar algum erro na valida'#231#227'o, ent'#227'o s'#243' marque TRUE para as op'#231#245 +
            'es '
          
            'que voc'#234' realmente for usar, e lembre-se tem campos que s'#227'o obri' +
            'gat'#243'rios'
          
            'ent'#227'o marque TRUE para eles e preencha-os, LEIA O MANUAL DO TISS' +
            '.'
          'Atenciosamente,'
          'Fabiano')
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'VALIDA'#199#195'O'
      ImageIndex = 2
      object Memo2: TMemo
        Left = 0
        Top = 0
        Width = 528
        Height = 270
        Align = alClient
        Lines.Strings = (
          'Caso queira que o pr'#243'prio componente Valide as informa'#231#245'es'
          'basta informar na propriedade TissValid a op'#231#227'o '
          'UsarValidacao para TRUE e informar o caminho do XSD'
          'na propriedade TISSXSD, no demo j'#225' tem o arquivo XSD'
          'na pasta DEMO')
        TabOrder = 0
      end
    end
    object TabSheet4: TTabSheet
      Caption = 'SOBRE'
      ImageIndex = 3
      object Memo3: TMemo
        Left = 0
        Top = 0
        Width = 528
        Height = 270
        Align = alClient
        Lines.Strings = (
          'ATEN'#199#195'O TODOS OS COMPONENTES EST'#195'O EM FASE DE TESTE'
          'USE POR CONTA E RISCO.'
          'OS FONTES EST'#195'O DISPON'#205'VEIS, POR SEREM'
          'COMPONENTES OPEN SOURCE, POR FAVOR'
          'SE VOC'#202' MELHORAR ALGUMA COISA NOS '
          'REPORTE A ALTERA'#199#195'O.')
        TabOrder = 0
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'Colocar hash no nome do arquivo'
      ImageIndex = 4
      object Memo4: TMemo
        Left = 0
        Top = 0
        Width = 528
        Height = 270
        Align = alClient
        Lines.Strings = (
          'As vezes existe a necessidade de colocar no'
          
            'nome do arquivo com o numero sequencial +_+  hash (PADRAO ANS), ' +
            'para isso'
          'basta alterar a propriedade'
          'TissArqNomeHash para True assim '
          'o componente vai colocar o nome do arquivo'
          'com esse padr'#227'o, caso queira nomear o arquivo'
          'por contra pr'#243'pria basta colocar esta propriedade '
          'para FALSE que os componentes colocam o nome'
          'que esta na propriedade TissArquivo, UM DETALHE RELEVANTE '#233' que '
          'para que o nome do arquivo apare'#231'a no nome gerado voc'#234' precisa'
          'colocar a propriedade UsarNomeArq para TRUE no componente'
          'TissConsulta que fica dentro de Tissconfig, e para os demais'
          'mude a propriedade TissUsarNomeArq para TRUE fica dentro do'
          'TissConfig e depois dentro de TissCabecalho'
          ''
          'Essa propriedade TissArqNomeHash para os componentes de'
          'SPSADT e INTERNA'#199#195'O est'#227'o dentro da propriedade '
          'TissCabecalho')
        TabOrder = 0
      end
    end
  end
  object Button3: TButton
    Left = 8
    Top = 80
    Width = 129
    Height = 25
    Caption = 'Gerar Interna'#231#227'o'
    TabOrder = 4
    OnClick = Button3Click
  end
  object ckvalidar: TCheckBox
    Left = 8
    Top = 145
    Width = 161
    Height = 17
    Caption = 'Validar arquivos gerados'
    Checked = True
    State = cbChecked
    TabOrder = 5
  end
  object Button4: TButton
    Left = 8
    Top = 112
    Width = 129
    Height = 25
    Caption = 'Gerar Honor'#225'rio'
    TabOrder = 6
    OnClick = Button4Click
  end
  object grp1: TGroupBox
    Left = 10
    Top = 166
    Width = 385
    Height = 44
    Caption = 'Vers'#227'o a ser Gerada'
    TabOrder = 7
    object rb1: TRadioButton
      Left = 16
      Top = 20
      Width = 81
      Height = 17
      Caption = 'V2.01.03'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = rb1Click
    end
    object rb2: TRadioButton
      Left = 101
      Top = 20
      Width = 83
      Height = 17
      Caption = 'V2.02.01'
      Font.Charset = ANSI_CHARSET
      Font.Color = clTeal
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = rb2Click
    end
    object rb3: TRadioButton
      Left = 188
      Top = 20
      Width = 81
      Height = 17
      Caption = 'V2.02.02'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = rb3Click
    end
    object rb4: TRadioButton
      Left = 278
      Top = 20
      Width = 81
      Height = 17
      Caption = 'V2.02.03'
      Font.Charset = ANSI_CHARSET
      Font.Color = clMaroon
      Font.Height = -11
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = rb4Click
    end
  end
  object TissC: TTissConsulta
    ansVersaoXSD = v2_02_03
    Versao.Versao = '1.0.0'
    TissVersaoXml = '1.0'
    TissVersaoTISS = '2.02.02'
    TissEncoding = 'ISO-8859-1'
    TissMensagemTissXml = 
      'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.a' +
      'ns.gov.br/padroes/tiss/schemas"'
    TissTipo = Juridico
    TissCodigoTabela = 0
    TissConfig.UsarCBOS = True
    TissConfig.UsarTipoTrans = True
    TissConfig.UsarDataRegistroTrans = True
    TissConfig.UsarHoraRegistroTrans = True
    TissConfig.UsarSequencialTrans = True
    TissConfig.UsarTipo = True
    TissConfig.UsarCNPJCPF = True
    TissConfig.UsarRegANS = True
    TissConfig.UsarNumLote = True
    TissConfig.UsarNumPres = True
    TissConfig.UsarNumGuia = True
    TissConfig.UsarNumCarteira = True
    TissConfig.UsarPaciente = True
    TissConfig.UsarNomePlano = True
    TissConfig.UsarValidadeCart = True
    TissConfig.UsarNumCNS = True
    TissConfig.UsarNomeContradado = True
    TissConfig.UsartipoLogradouro = True
    TissConfig.UsarLogradouro = True
    TissConfig.UsarEndNum = True
    TissConfig.UsarComplemento = True
    TissConfig.UsarcodigoIBGE = True
    TissConfig.UsarMunicipio = True
    TissConfig.UsarUF = True
    TissConfig.UsarCEP = True
    TissConfig.UsarCNES = True
    TissConfig.UsarMEDICO = True
    TissConfig.UsarSIGLACONSELHO = True
    TissConfig.UsarNUMEROCONSELHO = True
    TissConfig.UsarUFCONSELHO = True
    TissConfig.UsarCIDNomeTab = True
    TissConfig.UsarCIDCodDiag = True
    TissConfig.UsarCIDDescDiag = True
    TissConfig.UsardataAtendimento = True
    TissConfig.UsarCodigoTabela = True
    TissConfig.UsarCodProc = True
    TissConfig.UsarTipoConsulta = True
    TissConfig.UsarTipoSaidaa = True
    TissConfig.UsarPadroes = True
    TissConfig.UsarHipoteseDiag = True
    TissConfig.UsarEvolucaoValor = True
    TissConfig.UsarIndicAcid = True
    TissConfig.UsarUnidTemp = True
    TissConfig.UsarTipDoenca = True
    TissConfig.UsarObs = True
    TissConfig.UsarEndContratado = True
    TissConfig.UsarNomeArq = True
    TissConfig.UsarArqNomeHash = True
    TissConfig.PadraoTipFontPg = CNPJ
    TissConfig.UsarNomeAplica = True
    TissConfig.UsarVersaoAplica = True
    TissConfig.UsarFabricaAplica = True
    TissValid.UsarValidacao = True
    TissValid.TissXSD = 'tissV2_02_03.xsd'
    TissZerosArq = 20
    Left = 408
    Top = 144
  end
  object TissSP: TTissSP_SADT
    ansVersaoXSD = v2_02_03
    Versao.Versao = '1.0.0'
    Tissconfig.TissUsarBenefic = True
    Tissconfig.TissUsarContratado = True
    Tissconfig.TissUsarPrestadorExec = True
    Tissconfig.TissUsarPrestadorExecCompl = False
    Tissconfig.TissUsarDiagnostico = True
    Tissconfig.TissUsarProc = True
    Tissconfig.TissUsarProfissional = True
    Tissconfig.TissUsarProfissionalCompl = False
    Tissconfig.TissUsarOPM = True
    Tissconfig.TissUsarOutDespesas = True
    Tissconfig.TissCabecalho.TissTipoTrans = True
    Tissconfig.TissCabecalho.TissDataRegistroTrans = True
    Tissconfig.TissCabecalho.TissHoraRegistroTrans = True
    Tissconfig.TissCabecalho.TissSequencialTrans = True
    Tissconfig.TissCabecalho.TissCNPJCPF = True
    Tissconfig.TissCabecalho.TissRegANS = True
    Tissconfig.TissCabecalho.TissNumLote = True
    Tissconfig.TissCabecalho.TissTipoGeral = True
    Tissconfig.TissCabecalho.TissUsarNomeArqu = True
    Tissconfig.TissCabecalho.TissArqNomeHash = True
    Tissconfig.TissCabecalho.TissNomeAplica = True
    Tissconfig.TissCabecalho.TissVersaoAplica = True
    Tissconfig.TissCabecalho.TissFabricaAplica = True
    Tissconfig.TissBenefic.TissNumCarteira = True
    Tissconfig.TissBenefic.TissBenific = True
    Tissconfig.TissBenefic.TissNomePlano = True
    Tissconfig.TissBenefic.TissValidadeCart = False
    Tissconfig.TissBenefic.TissNumCNS = False
    Tissconfig.TissContratado.TissTipoGeral = True
    Tissconfig.TissContratado.TissCNPJCPF = True
    Tissconfig.TissContratado.TissNomeContradado = True
    Tissconfig.TissContratado.TisstipoLogradouro = True
    Tissconfig.TissContratado.TissLogradouro = True
    Tissconfig.TissContratado.TissEndNum = True
    Tissconfig.TissContratado.TissComplemento = True
    Tissconfig.TissContratado.TisscodigoIBGE = True
    Tissconfig.TissContratado.TissMunicipio = True
    Tissconfig.TissContratado.TissUF = True
    Tissconfig.TissContratado.TissCEP = True
    Tissconfig.TissContratado.TissCNES = True
    Tissconfig.TissContratado.TissUsarEnd = True
    Tissconfig.TissPrestadorExec.TissTipoGeral = True
    Tissconfig.TissPrestadorExec.TissCNPJCPF = True
    Tissconfig.TissPrestadorExec.TissNomeContradado = True
    Tissconfig.TissPrestadorExec.TisstipoLogradouro = True
    Tissconfig.TissPrestadorExec.TissLogradouro = True
    Tissconfig.TissPrestadorExec.TissEndNum = True
    Tissconfig.TissPrestadorExec.TissComplemento = True
    Tissconfig.TissPrestadorExec.TisscodigoIBGE = True
    Tissconfig.TissPrestadorExec.TissMunicipio = True
    Tissconfig.TissPrestadorExec.TissUF = True
    Tissconfig.TissPrestadorExec.TissCEP = True
    Tissconfig.TissPrestadorExec.TissCNES = True
    Tissconfig.TissPrestadorExec.TissUsarEnd = True
    Tissconfig.TissPrestadorExecCompl.TissTipoGeral = True
    Tissconfig.TissPrestadorExecCompl.TissCNPJCPF = True
    Tissconfig.TissPrestadorExecCompl.TissNomeContradado = True
    Tissconfig.TissPrestadorExecCompl.TisstipoLogradouro = True
    Tissconfig.TissPrestadorExecCompl.TissLogradouro = True
    Tissconfig.TissPrestadorExecCompl.TissEndNum = True
    Tissconfig.TissPrestadorExecCompl.TissComplemento = True
    Tissconfig.TissPrestadorExecCompl.TisscodigoIBGE = True
    Tissconfig.TissPrestadorExecCompl.TissMunicipio = True
    Tissconfig.TissPrestadorExecCompl.TissUF = True
    Tissconfig.TissPrestadorExecCompl.TissCEP = True
    Tissconfig.TissPrestadorExecCompl.TissCNES = True
    Tissconfig.TissPrestadorExecCompl.TissUsarEnd = True
    Tissconfig.TissDiagnostico.TissCIDNomeTab = True
    Tissconfig.TissDiagnostico.TissCIDCodDiag = True
    Tissconfig.TissDiagnostico.TissCIDDescDiag = True
    Tissconfig.TissDiagnostico.TissValor = True
    Tissconfig.TissDiagnostico.TissUnTemp = True
    Tissconfig.TissDiagnostico.TissTipDoenc = True
    Tissconfig.TissDiagnostico.TissIndicAcid = True
    Tissconfig.TissProc.TissUsarEquipe = False
    Tissconfig.TissProc.TissEquipe.TissCodProf = True
    Tissconfig.TissProc.TissEquipe.TissTipoMemb = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissProf = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissUsarConselho = False
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissSiglaConselho = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissNumConselho = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissUFConselho = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissfCBOS = True
    Tissconfig.TissProc.TissEquipe.TissProfiss.TissPosicProf = True
    Tissconfig.TissProc.TissProcs.TissCodigo = True
    Tissconfig.TissProc.TissProcs.TissTipTabela = True
    Tissconfig.TissProc.TissProcs.TissDescricao = True
    Tissconfig.TissProc.TissData = True
    Tissconfig.TissProc.TissHsInicio = True
    Tissconfig.TissProc.TissHsFim = True
    Tissconfig.TissProc.TissQtde = True
    Tissconfig.TissProc.TissVdeAcesso = True
    Tissconfig.TissProc.TissTecUtil = True
    Tissconfig.TissProc.TissReducAcres = True
    Tissconfig.TissProc.TissValor = True
    Tissconfig.TissProc.TissValorTotal = True
    Tissconfig.TissProc.TissValorTotalGeral = True
    Tissconfig.TissProfissional.TissProf = True
    Tissconfig.TissProfissional.TissUsarConselho = False
    Tissconfig.TissProfissional.TissSiglaConselho = True
    Tissconfig.TissProfissional.TissNumConselho = True
    Tissconfig.TissProfissional.TissUFConselho = True
    Tissconfig.TissProfissional.TissfCBOS = True
    Tissconfig.TissProfissional.TissPosicProf = True
    Tissconfig.TissProfissionalCompl.TissProf = True
    Tissconfig.TissProfissionalCompl.TissUsarConselho = False
    Tissconfig.TissProfissionalCompl.TissSiglaConselho = True
    Tissconfig.TissProfissionalCompl.TissNumConselho = True
    Tissconfig.TissProfissionalCompl.TissUFConselho = True
    Tissconfig.TissProfissionalCompl.TissfCBOS = True
    Tissconfig.TissProfissionalCompl.TissPosicProf = True
    Tissconfig.TissOPM.TissCodigo = True
    Tissconfig.TissOPM.TissTipTab = True
    Tissconfig.TissOPM.TissDescricao = True
    Tissconfig.TissOPM.TissQtde = True
    Tissconfig.TissOPM.TissCodBar = True
    Tissconfig.TissOPM.TissVlrUnt = True
    Tissconfig.TissOPM.TissVlrTot = True
    Tissconfig.TissOutDesp.TissIdentCodTab = True
    Tissconfig.TissOutDesp.TissIdentTipTab = True
    Tissconfig.TissOutDesp.TissIdentDesc = True
    Tissconfig.TissOutDesp.TissTipoDesp = True
    Tissconfig.TissOutDesp.TissDTRealizacao = True
    Tissconfig.TissOutDesp.TissHSInicial = True
    Tissconfig.TissOutDesp.TissHSFinal = True
    Tissconfig.TissOutDesp.TissReducAcres = True
    Tissconfig.TissOutDesp.TissQtde = True
    Tissconfig.TissOutDesp.TissVlrUnt = True
    Tissconfig.TissOutDesp.TissTotalGeral = True
    Tissconfig.TissNumGuiaPrest = True
    Tissconfig.TissNumGuiaOper = False
    Tissconfig.TissNumGuiaPrinc = True
    Tissconfig.TissDataEmis = True
    Tissconfig.TissDataAut = True
    Tissconfig.TissSenhaAut = True
    Tissconfig.TissSenhaValid = True
    Tissconfig.TissTipoSP = True
    Tissconfig.TissindicClinica = False
    Tissconfig.TisscaraterAtend = True
    Tissconfig.TissDataAtend = True
    Tissconfig.TissHoraAtend = True
    Tissconfig.TissTipoSaida = True
    Tissconfig.TissTipoAtend = True
    Tissconfig.TissCNPJCPF = True
    Tissconfig.TissRegANS = True
    Tissconfig.TissNumLote = True
    Tissconfig.PadraoTipFontPg = RegistroANS
    Tissconfig.TissUsarObs = False
    Tissconfig.TissNomeAplica = True
    Tissconfig.TissVersaoAplica = True
    Tissconfig.TissFabricaAplica = True
    Tisscabecalho.TissVersaoXml = '1.0'
    Tisscabecalho.TissEncoding = 'ISO-8859-1'
    Tisscabecalho.TissMensagemTissXml = 
      'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.a' +
      'ns.gov.br/padroes/tiss/schemas"'
    Tisscabecalho.TissArquivo = 'tiss.xml'
    Tisscabecalho.TissVersaoTISS = '2.01.02'
    Tisscabecalho.TissTipoGeral = JuridicoGeral
    Tisscabecalho.TissZerosArq = 20
    TissContratado.TissTipoGeral = JuridicoGeral
    TissContratado.TissCEP = '454'
    TissPrestadorExec.TissTipoGeral = JuridicoGeral
    TissPrestadorExecCompl.TissTipoGeral = JuridicoGeral
    TissProfissional.TissPosicProf = 0
    TissProfissionalCompl.TissPosicProf = 0
    TissTipoSP = FisicoSP_SADT
    TissDiagnostico.TissValor = 0
    TissDiagnostico.TissIndicAcid = 0
    TissTipoAtend = 0
    TissProc.TissEquipe.TissTipoMemb = conselhoProfissional
    TissProc.TissEquipe.TissProfiss.TissPosicProf = 0
    TissProc.TissProcs.TissTipTabela = 0
    TissOutDesp.TissDespesa.TissTipDespesa = 0
    TissValid.UsarValidacao = True
    TissValid.TissXSD = 'tissV2_02_03.xsd'
    Left = 440
    Top = 144
  end
  object TissInt: TTissInternacao
    ansVersaoXSD = v2_02_03
    Versao.Versao = '1.0.0'
    TissContratado.TissTipoGeral = JuridicoGeral
    TissProfissional.TissPosicProf = 0
    TissPrestadorExec.TissTipoGeral = JuridicoGeral
    Tisscabecalho.TissVersaoXml = '1.0'
    Tisscabecalho.TissEncoding = 'ISO-8859-1'
    Tisscabecalho.TissMensagemTissXml = 
      'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.a' +
      'ns.gov.br/padroes/tiss/schemas"'
    Tisscabecalho.TissArquivo = 'Internacao'
    Tisscabecalho.TissVersaoTISS = '2.01.02'
    Tisscabecalho.TissTipoGeral = JuridicoGeral
    Tisscabecalho.TissZerosArq = 20
    TissTipoInternacao = 0
    TissInternacaoObstetrica.TissEmGestacao = False
    TissInternacaoObstetrica.TissAborto = False
    TissInternacaoObstetrica.TissTranstornoMaternoRelGravidez = False
    TissInternacaoObstetrica.TissComplicacaoPeriodoPuerperio = False
    TissInternacaoObstetrica.TissAtendimentoRNSalaParto = False
    TissInternacaoObstetrica.TissComplicacaoNeonatal = False
    TissInternacaoObstetrica.TissBaixoPeso = False
    TissInternacaoObstetrica.TissPartoCesareo = False
    TissInternacaoObstetrica.TissPartoNormal = False
    TissInternacaoObstetrica.TissQtdNascidosVivosTermo = 0
    TissInternacaoObstetrica.TissQtdNascidosMortos = 0
    TissInternacaoObstetrica.TissQtdVivosPrematuros = 0
    TissInternacaoObstetrica.TissQtdeobitoPrecoce = 0
    TissInternacaoObstetrica.TissQtdeobitoTardio = 0
    TissDiagSaidInt.TissIndicAcid = 0
    TissProc.TissEquipe.TissTipoMemb = Outros
    TissProc.TissEquipe.TissProfiss.TissPosicProf = 10
    TissProc.TissProcs.TissTipTabela = 0
    TissOutDesp.TissDespesa.TissTipDespesa = 0
    TissConfig.TissUsarBenefic = True
    TissConfig.TissUsarContratado = True
    TissConfig.TissUsarIdentExec = True
    TissConfig.TissUsarDiagnostico = True
    TissConfig.TissUsarProc = True
    TissConfig.TissUsarDiagSaidInt = True
    TissConfig.TissUsarProfissional = True
    TissConfig.TissUsarOPM = True
    TissConfig.TissUsarOutDespesas = True
    TissConfig.TissUsarInternacaoObstetrica = False
    TissConfig.TissCabecalho.TissTipoTrans = True
    TissConfig.TissCabecalho.TissDataRegistroTrans = True
    TissConfig.TissCabecalho.TissHoraRegistroTrans = True
    TissConfig.TissCabecalho.TissSequencialTrans = True
    TissConfig.TissCabecalho.TissCNPJCPF = True
    TissConfig.TissCabecalho.TissRegANS = True
    TissConfig.TissCabecalho.TissNumLote = True
    TissConfig.TissCabecalho.TissTipoGeral = True
    TissConfig.TissCabecalho.TissUsarNomeArqu = True
    TissConfig.TissCabecalho.TissArqNomeHash = True
    TissConfig.TissBenefic.TissNumCarteira = True
    TissConfig.TissBenefic.TissBenific = True
    TissConfig.TissBenefic.TissNomePlano = True
    TissConfig.TissBenefic.TissValidadeCart = True
    TissConfig.TissBenefic.TissNumCNS = True
    TissConfig.TissContratado.TissTipoGeral = True
    TissConfig.TissContratado.TissCNPJCPF = True
    TissConfig.TissContratado.TissNomeContradado = True
    TissConfig.TissContratado.TisstipoLogradouro = True
    TissConfig.TissContratado.TissLogradouro = True
    TissConfig.TissContratado.TissEndNum = True
    TissConfig.TissContratado.TissComplemento = True
    TissConfig.TissContratado.TisscodigoIBGE = True
    TissConfig.TissContratado.TissMunicipio = True
    TissConfig.TissContratado.TissUF = True
    TissConfig.TissContratado.TissCEP = True
    TissConfig.TissContratado.TissCNES = True
    TissConfig.TissContratado.TissUsarEnd = True
    TissConfig.TissIdentExec.TissTipoGeral = True
    TissConfig.TissIdentExec.TissCNPJCPF = True
    TissConfig.TissIdentExec.TissNomeContradado = True
    TissConfig.TissIdentExec.TisstipoLogradouro = True
    TissConfig.TissIdentExec.TissLogradouro = True
    TissConfig.TissIdentExec.TissEndNum = True
    TissConfig.TissIdentExec.TissComplemento = True
    TissConfig.TissIdentExec.TisscodigoIBGE = True
    TissConfig.TissIdentExec.TissMunicipio = True
    TissConfig.TissIdentExec.TissUF = True
    TissConfig.TissIdentExec.TissCEP = True
    TissConfig.TissIdentExec.TissCNES = True
    TissConfig.TissIdentExec.TissUsarEnd = True
    TissConfig.TissDiagnostico.TissCIDNomeTab = True
    TissConfig.TissDiagnostico.TissCIDCodDiag = True
    TissConfig.TissDiagnostico.TissCIDDescDiag = True
    TissConfig.TissDiagnostico.TissValor = True
    TissConfig.TissDiagnostico.TissUnTemp = True
    TissConfig.TissDiagnostico.TissTipDoenc = True
    TissConfig.TissDiagnostico.TissIndicAcid = True
    TissConfig.TissProc.TissUsarEquipe = True
    TissConfig.TissProc.TissEquipe.TissCodProf = True
    TissConfig.TissProc.TissEquipe.TissTipoMemb = True
    TissConfig.TissProc.TissEquipe.TissProfiss.TissProf = True
    TissConfig.TissProc.TissEquipe.TissProfiss.TissSiglaConselho = True
    TissConfig.TissProc.TissEquipe.TissProfiss.TissNumConselho = True
    TissConfig.TissProc.TissEquipe.TissProfiss.TissUFConselho = True
    TissConfig.TissProc.TissEquipe.TissProfiss.TissfCBOS = True
    TissConfig.TissProc.TissEquipe.TissProfiss.TissPosicProf = True
    TissConfig.TissProc.TissProcs.TissCodigo = True
    TissConfig.TissProc.TissProcs.TissTipTabela = True
    TissConfig.TissProc.TissProcs.TissDescricao = True
    TissConfig.TissProc.TissData = True
    TissConfig.TissProc.TissHsInicio = True
    TissConfig.TissProc.TissHsFim = True
    TissConfig.TissProc.TissQtde = True
    TissConfig.TissProc.TissVdeAcesso = True
    TissConfig.TissProc.TissTecUtil = True
    TissConfig.TissProc.TissReducAcres = True
    TissConfig.TissProc.TissValor = True
    TissConfig.TissProc.TissValorTotal = True
    TissConfig.TissProfissional.TissProf = True
    TissConfig.TissProfissional.TissSiglaConselho = True
    TissConfig.TissProfissional.TissNumConselho = True
    TissConfig.TissProfissional.TissUFConselho = True
    TissConfig.TissProfissional.TissfCBOS = True
    TissConfig.TissProfissional.TissPosicProf = True
    TissConfig.TissOPM.TissCodigo = True
    TissConfig.TissOPM.TissTipTab = True
    TissConfig.TissOPM.TissDescricao = True
    TissConfig.TissOPM.TissQtde = True
    TissConfig.TissOPM.TissCodBar = True
    TissConfig.TissOPM.TissVlrUnt = True
    TissConfig.TissOPM.TissVlrTot = True
    TissConfig.TissOutDesp.TissIdentCodTab = True
    TissConfig.TissOutDesp.TissIdentTipTab = True
    TissConfig.TissOutDesp.TissIdentDesc = True
    TissConfig.TissOutDesp.TissTipoDesp = True
    TissConfig.TissOutDesp.TissDTRealizacao = True
    TissConfig.TissOutDesp.TissHSInicial = True
    TissConfig.TissOutDesp.TissHSFinal = True
    TissConfig.TissOutDesp.TissReducAcres = True
    TissConfig.TissOutDesp.TissQtde = True
    TissConfig.TissOutDesp.TissVlrUnt = True
    TissConfig.TissOutDesp.TissTotalGeral = True
    TissConfig.TissNumGuiaPrest = True
    TissConfig.TissNumGuiaOper = True
    TissConfig.TissNumGuiaSolic = True
    TissConfig.TissDataAut = True
    TissConfig.TissSenhaAut = True
    TissConfig.TissSenhaValid = True
    TissConfig.TissTipoSP = True
    TissConfig.TissindicClinica = True
    TissConfig.TisscaraterInt = True
    TissConfig.TissDataInt = True
    TissConfig.TissHoraInt = True
    TissConfig.TissHoraSaidInt = True
    TissConfig.TissDataSaidInt = True
    TissConfig.TissTipoSaida = True
    TissConfig.TissTipoInt = True
    TissConfig.TissCNPJCPF = True
    TissConfig.TissRegANS = True
    TissConfig.TissTipoFat = True
    TissConfig.TissNumLote = True
    TissConfig.TissRegInt = True
    TissConfig.TissAcomod = True
    TissConfig.TissUsarDadAut = True
    TissConfig.TissDiagSaidaInt.TissIndicAcid = True
    TissConfig.TissDiagSaidaInt.TissDiagPrinc = True
    TissConfig.TissDiagSaidaInt.TissDiagSec = True
    TissConfig.TissDiagSaidaInt.TissMotSaidInt = True
    TissConfig.TissDiagSaidaInt.TissObito = True
    TissConfig.PadraoTipFontPg = RegistroANS
    TissConfig.TissUsarObs = False
    TissValid.UsarValidacao = True
    TissValid.TissXSD = 'tissV2_02_03.xsd'
    TissObservacao = 'teste'
    Left = 472
    Top = 144
  end
  object TissHon: TTissHonorario
    TissConf.TissUsarBenefic = True
    TissConf.TissUsarContratado = True
    TissConf.TissUsarIdentExec = True
    TissConf.TissUsarProc = True
    TissConf.TissUsarProfissional = True
    TissConf.TissCabecalho.TissTipoTrans = True
    TissConf.TissCabecalho.TissDataRegistroTrans = True
    TissConf.TissCabecalho.TissHoraRegistroTrans = True
    TissConf.TissCabecalho.TissSequencialTrans = True
    TissConf.TissCabecalho.TissCNPJCPF = True
    TissConf.TissCabecalho.TissRegANS = True
    TissConf.TissCabecalho.TissNumLote = True
    TissConf.TissCabecalho.TissTipoGeral = True
    TissConf.TissCabecalho.TissUsarNomeArqu = False
    TissConf.TissCabecalho.TissArqNomeHash = True
    TissConf.TissBenefic.TissNumCarteira = True
    TissConf.TissBenefic.TissBenific = True
    TissConf.TissBenefic.TissNomePlano = True
    TissConf.TissBenefic.TissValidadeCart = True
    TissConf.TissBenefic.TissNumCNS = True
    TissConf.TissContratado.TissTipoGeral = True
    TissConf.TissContratado.TissCNPJCPF = True
    TissConf.TissContratado.TissNomeContradado = True
    TissConf.TissContratado.TisstipoLogradouro = True
    TissConf.TissContratado.TissLogradouro = True
    TissConf.TissContratado.TissEndNum = True
    TissConf.TissContratado.TissComplemento = True
    TissConf.TissContratado.TisscodigoIBGE = True
    TissConf.TissContratado.TissMunicipio = True
    TissConf.TissContratado.TissUF = True
    TissConf.TissContratado.TissCEP = True
    TissConf.TissContratado.TissCNES = True
    TissConf.TissContratado.TissUsarEnd = True
    TissConf.TissIdentExec.TissTipoGeral = True
    TissConf.TissIdentExec.TissCNPJCPF = True
    TissConf.TissIdentExec.TissNomeContradado = True
    TissConf.TissIdentExec.TisstipoLogradouro = True
    TissConf.TissIdentExec.TissLogradouro = True
    TissConf.TissIdentExec.TissEndNum = True
    TissConf.TissIdentExec.TissComplemento = True
    TissConf.TissIdentExec.TisscodigoIBGE = True
    TissConf.TissIdentExec.TissMunicipio = True
    TissConf.TissIdentExec.TissUF = True
    TissConf.TissIdentExec.TissCEP = True
    TissConf.TissIdentExec.TissCNES = True
    TissConf.TissIdentExec.TissUsarEnd = True
    TissConf.TissProc.TissProcs.TissCodigo = True
    TissConf.TissProc.TissProcs.TissTipTabela = True
    TissConf.TissProc.TissProcs.TissDescricao = True
    TissConf.TissProc.TissData = True
    TissConf.TissProc.TissHsInicio = True
    TissConf.TissProc.TissHsFim = True
    TissConf.TissProc.TissQtde = True
    TissConf.TissProc.TissVdeAcesso = True
    TissConf.TissProc.TissTecUtil = True
    TissConf.TissProc.TissReducAcres = True
    TissConf.TissProc.TissValor = True
    TissConf.TissProc.TissValorTotal = True
    TissConf.TissProfissional.TissProf = True
    TissConf.TissProfissional.TissSiglaConselho = True
    TissConf.TissProfissional.TissNumConselho = True
    TissConf.TissProfissional.TissUFConselho = True
    TissConf.TissProfissional.TissfCBOS = True
    TissConf.TissProfissional.TissPosicProf = True
    TissConf.PadraoTipFontPg = RegistroANS
    TissConf.TissNumGuiaPrest = True
    TissConf.TissNumGuiaOper = True
    TissConf.TissNumGuiaPrinc = True
    TissConf.TissCNPJCPF = True
    TissConf.TissRegANS = True
    TissConf.TissTipoFat = True
    TissConf.TissNumLote = True
    TissConf.TissRegInt = False
    TissConf.TissAcomod = True
    TissConf.TissUsarObs = False
    TissValid.UsarValidacao = True
    TissValid.TissXSD = 'tissV2_02_03.xsd'
    TissCabecalho.TissVersaoXml = '1.0'
    TissCabecalho.TissEncoding = 'ISO-8859-1'
    TissCabecalho.TissMensagemTissXml = 
      'xmlns="http://www.w3.org/2001/XMLSchema" xmlns:ans="http://www.a' +
      'ns.gov.br/padroes/tiss/schemas"'
    TissCabecalho.TissVersaoTISS = '2.01.03'
    TissCabecalho.TissTipoGeral = JuridicoGeral
    TissCabecalho.TissZerosArq = 20
    TissContratado.TissTipoGeral = JuridicoGeral
    TissPrestExec.TissTipoGeral = JuridicoGeral
    TissInfProfissional.TissPosicProf = 0
    TissProc.TissProcs.TissTipTabela = 0
    TissCompVersao.Versao = '1.0.0'
    ansVersaoXSD = v2_02_03
    Left = 504
    Top = 144
  end
end

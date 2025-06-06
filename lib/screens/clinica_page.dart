import 'package:flutter/material.dart';

class ClinicaPage extends StatefulWidget {
  const ClinicaPage({super.key});

  @override
  _ClinicaPageState createState() => _ClinicaPageState();
}

class _ClinicaPageState extends State<ClinicaPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dataHoraAuditoria;
  String? _auditorSelecionado;
  String? _outroAuditorNome;
  String? _setorSelecionado;
  String? _outroSetorNome;
  bool _mostrarCampoOutroAuditor = false;
  bool _mostrarCampoOutroSetor = false;
  final TextEditingController _dataHoraController = TextEditingController();
  final TextEditingController _numeroAtendimentoController =
      TextEditingController();
  final TextEditingController _consideracoes1Controller =
      TextEditingController();
  final TextEditingController _consideracoes2Controller =
      TextEditingController();
  final TextEditingController _consideracoes3Controller =
      TextEditingController();
  final TextEditingController _outroAuditorController = TextEditingController();
  final TextEditingController _outroSetorController = TextEditingController();

  final List<String> _auditores = [
    'Auditor - NGQS',
    'Auditor - Comissão de prontuários',
    'Adelina Roque',
    'Adilon Koury',
    'Adriana Benjamin',
    'Adriana Lira',
    'Ana Celia Pinheiro',
    'Benedita Leida',
    'Carla Haber',
    'Carla Manuela Neves',
    'Carmen Peixoto',
    'Cibele Bordalo',
    'Danielly do Vale',
    'Ederson Joao',
    'Eduardo Amoras',
    'Emmerson Farias',
    'Ezilene Sousa',
    'Flávia Paes',
    'Francielma Pinheiro das Chagas',
    'Francisco Cordeiro',
    'Isabela Figueiredo',
    'Isis Almeida',
    'Karina Silva',
    'Karla Santos',
    'Kathia Gayoso',
    'Kiviane Batista',
    'Laila Dias',
    'Leonardo Silva da Costa',
    'Luciana Ataide',
    'Lucyete Chada',
    'Luiza de Paula',
    'Marcelo Williams',
    'Mary Maia',
    'Monick Calandrine',
    'Lilian Pinheiro',
    'Nelma Machado',
    'Neura Pinto',
    'Rodrigo Maneschy',
    'Rosangela leão',
    'Salma Saraty',
    'Sandra Barbosa',
    'Simone Fernandes',
    'Tatiane Lobato',
    'Virna Portela',
    'Luciana Nascimento',
    'Outros...',
  ];

  final List<String> _setores = [
    "Ala Santa Clara",
    "Ala Santa Ludovina",
    "Ala Santa Maria",
    "Ala Santa Marta",
    "Ala Santa Rita",
    "Ala Santa Terezinha",
    "Ala Santana",
    "Ala São Francisco",
    "Ala São Paulo",
    "Ala São José",
    "AMIU",
    "Casa da gestante",
    "Centro Obstétrico",
    "CPN",
    "Enfermaria Menino Jesus",
    "Enfermaria Maria Goreth",
    "Enfermaria Santo Expedito",
    "Enfermaria Frei Caetano B",
    "Centro cirúrgico pediátrico",
    "Centro cirúrgico adulto",
    "TRS Pediátrica",
    "UCI A1",
    "UCI A2",
    "UCI B",
    "UCINCA",
    "UEO",
    "UTI Adulto - Almir Gabriel",
    "UTI Adulto - Centenário",
    "UTI NEO A1",
    "UTI NEO A2",
    "UTI NEO A3",
    "UTI NEO A4",
    "UTI NEO B1",
    "UTI NEO B2",
    "UTI Pediátrica - São Cosme",
    "UTI Pediátrica - São Damião",
    "UTI Pediátrica - Sidney Barbosa",
    "Ambulatório - Mulher",
    "Ambulatório - Hepático",
    "Ambulatório - Especialidades clínicas",
    "Ambulatório - Pediátrico",
    "Ambulatório - Cirúrgico",
    'Outros...',
  ];

  final List<Map<String, String>> _perguntasProntuarios1 = [
    {'pergunta': 'Está claro o motivo da admissão?'},
    {'pergunta': 'Há registro do plano terapêutico elaborado pelo médico?'},
    {
      'pergunta':
          'O plano terapeutico condiz com o quadro clínico do paciente?',
    },
    {
      'pergunta':
          'Há registro do cumprimento das metas estabelecidas no plano terapêutico multidisciplinar?',
    },
    {
      'pergunta':
          'Há atualização do diagnostico de entrada de acordo com a evolução clínica do paciente?',
    },
    {
      'pergunta':
          'Há registro do projeto terapeutico elaborado pela equipe multidisciplinar? (enfermeiro, nutricionista, TO, FISIO, Farmaceutico, etc.)',
    },
    {'pergunta': 'O projeto terapeutico está atualizado?'},
    {
      'pergunta':
          'O projeto terapeutico condiz com o quadro clínico do paciente?',
    },
    {
      'pergunta':
          'O projeto terapêutico está descrito com informações claras e objetivas e contempla a equipe multiprofissional?',
    },
    {
      'pergunta':
          'Há registro do processo de enfermagem completo (avaliação, exame físico, diagnostico, scores, intervenção de enfermagem)?',
    },
    {
      'pergunta':
          'Registro da Triagem e Avaliação do risco nutricional em até 72 horas da admissão?',
    },
    {
      'pergunta':
          'Há registro da evolução Nutricional conforme risco classificado?',
    },
    {
      'pergunta':
          'Se o paciente faz uso de medicamentos próprios, Há evidencias da conciliação medicamentosa na admissão?',
    },
    {
      'pergunta':
          'Há registro de reconciliação medicamentosa nas transições do cuidado?',
    },
    {
      'pergunta':
          'Há registro da Farmácia Clínica em prontuário dentro do prazo estabelecido?',
    },
    {
      'pergunta':
          'Há evidências da avaliação de risco farmaceutica e reavaliação conforme preconizado no score?',
    },
    {
      'pergunta':
          'As abreviações, símbolos e designações de dose da Lista de Abreviações Perigosas não são usados em formulários ou rótulos gerados pela farmácia?',
    },
    {
      'pergunta':
          'Os formulários impressos relacionados ao uso de medicamentos não incluem nenhuma abreviação, símbolo ou designação de dose identificados na lista de abreviações perigosas?',
    },
    {
      'pergunta':
          'Evolução da fisioterapia esta condizente com a meta terapêutica?',
    },
    {
      'pergunta':
          'Registro da identificação e avaliação de risco para o paciente?',
    },
    {
      'pergunta':
          'Há evidência de todos os scores de avaliação do risco (quando aplicável)?',
    },
    {
      'pergunta':
          'São aplicadas medidas preventivas para os riscos identificados?',
    },
    {
      'pergunta':
          'SEPSE: o procolo foi aberto em tempo oportuno e baseado nos critérios de abertura?',
    },
    {'pergunta': 'SEPSE: a hora ouro do protocolo foi respeitada?'},
    {
      'pergunta':
          'SEPSE: as etapas II e III do protocolo foram cumpridas / registradas?',
    },
    {'pergunta': 'HPP: o formulário de HPP foi evidenciado em prontuário?'},
    {
      'pergunta':
          'HPP: Há evidencia de avaliação do risco de HPP na admissão e durante a internação conforme preconizado?',
    },
    {'pergunta': 'HPP: Há evidencia do cumprimento do protocolo?'},
    {'pergunta': 'SHEG: Há evidência de adesão ao protocolo?'},
    {
      'pergunta':
          'SHEG: Os medicamentos prescritos para este fim estão de acordo com o preconizado pelo protocolo?',
    },
    {
      'pergunta':
          'TEV: Há evidência da avaliação do risco para TEV em todos os pacientes?',
    },
    {
      'pergunta':
          'TEV: Há evidência da profilaxia medicamentosa para TEV em pacientes de alto risco, caso não haja contra indicação?',
    },
    {
      'pergunta':
          'DOR: Há evidencia da aplicação da escala de EVA na avaliação do paciente?',
    },
    {
      'pergunta':
          'DOR: Os medicamentos prescritos para este fim estão de acordo com o preconizado pelo protocolo?',
    },
    {'pergunta': 'ATB: O antibiótico prescrito está nas diretrizes da SCIH?'},
    {'pergunta': 'ATB: O antibiótico foi avaliado pelo SCIH?'},
    {'pergunta': 'ATB: O antibiótico profilático está nas diretrizes da CCIH?'},
    {
      'pergunta':
          'ATB: O antibiótico profilático foi administrado no tempo certo no centro cirúrgico?',
    },
    {'pergunta': 'CIRURGIA: Preenchimento do check list de cirurgia segura?'},
    {'pergunta': 'CIRURGIA: Avaliação pré-anestésica foi realizada?'},
    {
      'pergunta':
          'CIRURGIA: evidência do score de Aldret para liberação do RPA?',
    },
    {
      'pergunta':
          'CIRURGIA: todos os termos cirurgicos estão assinados pelo paciente e médico?',
    },
    {
      'pergunta':
          'CIRURGIA: A suspensão do antibiótico foi realizada conforme preconizado pela CCIH?',
    },
    {'pergunta': 'MAV: Há prescrição de MAV se necessário?'},
    {
      'pergunta':
          'MAV: há evidencia de dupla checagem no momento da administração do medicamento?',
    },
    {
      'pergunta':
          'Há registros de Sinais Vitais conforme a prescrição (médica e de enfermagem)?',
    },
    {
      'pergunta':
          'Há evidencia da avaliação do Score de deterioração a cada verificação de sinais vitais ou quando houver alterações?',
    },
    {
      'pergunta':
          'Evidencia de todo processo de realização de exames (solicitação, realização, e resultados )?',
    },
    {
      'pergunta':
          'Os tempos dos exames estão conforme os protocolos e as interações?',
    },
    {
      'pergunta':
          'O formulário de SBAR foi realizado com recomendações claras?',
    },
    {
      'pergunta':
          'O médico realizou a recomendação em caso de necessidade de transferencia? (evolução livre ou diária)',
    },
    {'pergunta': 'Há evidência da visita multiprofissional registrada?'},
    {'pergunta': 'Plano/Orientações de alta registrado?'},
    {
      'pergunta':
          'No sumário de alta a evolução da internação contempla toda a historia clínica (inicio e desfecho) do paciente?',
    },
    {'pergunta': 'Sumário de alta está com dignóstico atualizado?'},
    {
      'pergunta':
          'Em caso de óbito, há registro de evolução do óbito pela equipe multiprofissional?',
    },
  ];

  final List<Map<String, String>> _perguntasProntuarios2 = [
    {"pergunta": "Todos os profissionais estão cientes do plano terapêutico?"},
    {
      "pergunta":
          "Os profissionais conhecem os riscos estratificados dos pacientes?",
    },
    {
      "pergunta":
          "Existe evidencia da continuidade do cuidado nas trocas de turno pela equipe médica?",
    },
    {
      "pergunta":
          "Existe evidencia da continuidade do cuidado nas trocas de turno pela equipe de enfermagem?",
    },
    {
      "pergunta":
          "Há evidencias de aderência ao plano de aplicação medicamentosa?",
    },
    {
      "pergunta":
          "Os profissionais conhecem as políticas de segurança para fármacos de riscos?",
    },
  ];

  final List<Map<String, String>> _perguntasProntuarios3 = [
    {
      'pergunta':
          'O paciente/acompanhante demonstra conhecimento do plano de tratamento?',
    },
    {'pergunta': 'Foi envolvido no plano terapêutico?'},
    {'pergunta': 'Demonstra entender os procedimentos propostos?'},
    {'pergunta': 'Demonstra satisfação com o processo de comunicação?'},
  ];

  final Map<String, String?> _respostasProntuario1 = {};
  final Map<String, String?> _respostasProntuario2 = {};
  final Map<String, String?> _respostasProntuario3 = {};

  @override
  void initState() {
    super.initState();
    _auditorSelecionado = _auditores.first;
    _setorSelecionado = _setores.first;

    _inicializarRespostas(_perguntasProntuarios1, _respostasProntuario1);
    _inicializarRespostas(_perguntasProntuarios2, _respostasProntuario2);
    _inicializarRespostas(_perguntasProntuarios3, _respostasProntuario3);
  }

  void _inicializarRespostas(
    List<Map<String, String>> perguntas,
    Map<String, String?> respostas,
  ) {
    for (var pergunta in perguntas) {
      final key = _gerarChave(pergunta['pergunta']!);
      respostas[key] = null;
    }
  }

  String _gerarChave(String texto) {
    return texto.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '_').toLowerCase();
  }

  @override
  void dispose() {
    _dataHoraController.dispose();
    _numeroAtendimentoController.dispose();
    _consideracoes1Controller.dispose();
    _consideracoes2Controller.dispose();
    _consideracoes3Controller.dispose();
    _outroAuditorController.dispose();
    _outroSetorController.dispose();
    super.dispose();
  }

  Widget _buildRadioGroup(
    String pergunta,
    String key,
    Map<String, String?> respostas,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            pergunta,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Row(
            children:
                ['C', 'NC', 'NA'].map((opcao) {
                  return Expanded(
                    child: Column(
                      children: [
                        Text(
                          opcao,
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Radio<String>(
                          value: opcao,
                          groupValue: respostas[key],
                          onChanged: (value) {
                            setState(() {
                              respostas[key] = value!;
                            });
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                  );
                }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSecaoProntuario(
    String titulo,
    List<Map<String, String>> perguntas,
    Map<String, String?> respostas,
    TextEditingController controller,
    Color cor,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cabeçalho do bloco
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: cor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Text(
              titulo,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          // Conteúdo do bloco
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: Column(
              children: [
                // Perguntas
                ...perguntas.map((pergunta) {
                  final key = _gerarChave(pergunta['pergunta']!);
                  return _buildRadioGroup(
                    pergunta['pergunta']!,
                    key,
                    respostas,
                  );
                }).toList(),

                const SizedBox(height: 16),

                // Campo de considerações
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: TextFormField(
                    controller: controller,
                    decoration: const InputDecoration(
                      labelText: 'Considerações',
                      border: InputBorder.none,
                      hintText: 'Digite suas observações...',
                    ),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCamposFormulario() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Data e Hora
        const Text('Data e Hora da Auditoria *'),
        const SizedBox(height: 8),
        TextFormField(
          controller: _dataHoraController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'dd/mm/aaaa hh:mm',
            prefixIcon: Icon(Icons.calendar_today),
          ),
          readOnly: true,
          onTap: () async {
            FocusScope.of(context).requestFocus(FocusNode());
            final date = await showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2100),
            );
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              );
              if (time != null) {
                setState(() {
                  _dataHoraAuditoria = DateTime(
                    date.year,
                    date.month,
                    date.day,
                    time.hour,
                    time.minute,
                  );
                  _dataHoraController.text =
                      '${_dataHoraAuditoria!.day.toString().padLeft(2, '0')}/'
                      '${_dataHoraAuditoria!.month.toString().padLeft(2, '0')}/'
                      '${_dataHoraAuditoria!.year} '
                      '${_dataHoraAuditoria!.hour.toString().padLeft(2, '0')}:'
                      '${_dataHoraAuditoria!.minute.toString().padLeft(2, '0')}';
                });
              }
            }
          },
          validator:
              (value) =>
                  _dataHoraAuditoria == null ? 'Campo obrigatório' : null,
        ),
        const SizedBox(height: 16),

        // Auditor
        const Text('Auditor *'),
        DropdownButtonFormField<String>(
          value: _auditorSelecionado,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
          ),
          items:
              _auditores
                  .map((a) => DropdownMenuItem(value: a, child: Text(a)))
                  .toList(),
          onChanged: (value) {
            setState(() {
              _auditorSelecionado = value;
              _mostrarCampoOutroAuditor = value == 'Outros...';
              if (value != 'Outros...') {
                _outroAuditorController.clear();
              }
            });
          },
          validator: (value) => value == null ? 'Selecione um auditor' : null,
        ),
        if (_mostrarCampoOutroAuditor) ...[
          const SizedBox(height: 8),
          TextFormField(
            controller: _outroAuditorController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome do Auditor',
              prefixIcon: Icon(Icons.edit),
            ),
            validator: (value) {
              if (_mostrarCampoOutroAuditor &&
                  (value == null || value.isEmpty)) {
                return 'Informe o nome do auditor';
              }
              return null;
            },
          ),
        ],
        const SizedBox(height: 16),

        // Setor
        const Text('Setor *'),
        DropdownButtonFormField<String>(
          value: _setorSelecionado,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.business),
          ),
          items:
              _setores
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
          onChanged: (value) {
            setState(() {
              _setorSelecionado = value;
              _mostrarCampoOutroSetor = value == 'Outros...';
              if (value != 'Outros...') {
                _outroSetorController.clear();
              }
            });
          },
          validator: (value) => value == null ? 'Selecione um setor' : null,
        ),
        if (_mostrarCampoOutroSetor) ...[
          const SizedBox(height: 8),
          TextFormField(
            controller: _outroSetorController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nome do Setor',
              prefixIcon: Icon(Icons.edit),
            ),
            validator: (value) {
              if (_mostrarCampoOutroSetor && (value == null || value.isEmpty)) {
                return 'Informe o nome do setor';
              }
              return null;
            },
          ),
        ],
        const SizedBox(height: 16),

        // Nº Atendimento
        const Text('Nº do atendimento do paciente auditado *'),
        const SizedBox(height: 8),
        TextFormField(
          controller: _numeroAtendimentoController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Digite o número do atendimento',
            prefixIcon: Icon(Icons.numbers),
          ),
          validator:
              (value) => value?.isEmpty ?? true ? 'Campo obrigatório' : null,
        ),
      ],
    );
  }

  int _calcularProgresso() {
    int totalPerguntas = 0;
    int perguntasRespondidas = 0;

    for (var pergunta in _perguntasProntuarios1) {
      totalPerguntas++;
      final key = _gerarChave(pergunta['pergunta']!);
      if (_respostasProntuario1[key] != null) perguntasRespondidas++;
    }

    for (var pergunta in _perguntasProntuarios2) {
      totalPerguntas++;
      final key = _gerarChave(pergunta['pergunta']!);
      if (_respostasProntuario2[key] != null) perguntasRespondidas++;
    }

    for (var pergunta in _perguntasProntuarios3) {
      totalPerguntas++;
      final key = _gerarChave(pergunta['pergunta']!);
      if (_respostasProntuario3[key] != null) perguntasRespondidas++;
    }

    return totalPerguntas > 0
        ? (perguntasRespondidas * 100 / totalPerguntas).round()
        : 0;
  }

  @override
  Widget build(BuildContext context) {
    int progresso = _calcularProgresso();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoria Clínica'),
        backgroundColor: const Color(0xFF2979D4),
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  '$progresso%',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2979D4),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de progresso
          LinearProgressIndicator(
            value: progresso / 100,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              progresso == 100 ? Colors.green : const Color(0xFF2979D4),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Campos do formulário
                    _buildCamposFormulario(),

                    const SizedBox(height: 24),

                    // Seções de perguntas
                    _buildSecaoProntuario(
                      '1. Prontuário',
                      _perguntasProntuarios1,
                      _respostasProntuario1,
                      _consideracoes1Controller,
                      const Color(0xFF4CAF50), // Verde
                    ),
                    _buildSecaoProntuario(
                      '2. Questões Relativas aos Colaboradores',
                      _perguntasProntuarios2,
                      _respostasProntuario2,
                      _consideracoes2Controller,
                      const Color(0xFF9C27B0), // Roxo
                    ),
                    _buildSecaoProntuario(
                      '3. Questões Relacionadas ao Paciente',
                      _perguntasProntuarios3,
                      _respostasProntuario3,
                      _consideracoes3Controller,
                      const Color(0xFFF44336), // Vermelho
                    ),

                    const SizedBox(height: 24),

                    // Botão de salvar
                    Center(
                      child: ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            if (_respostasProntuario1.values.any(
                                  (v) => v == null,
                                ) ||
                                _respostasProntuario2.values.any(
                                  (v) => v == null,
                                ) ||
                                _respostasProntuario3.values.any(
                                  (v) => v == null,
                                )) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Responda todas as perguntas!'),
                                ),
                              );
                              return;
                            }

                            final dados = {
                              'dataHora': _dataHoraAuditoria?.toIso8601String(),
                              'auditor':
                                  _auditorSelecionado == 'Outros...'
                                      ? _outroAuditorController.text
                                      : _auditorSelecionado,
                              'setor':
                                  _setorSelecionado == 'Outros...'
                                      ? _outroSetorController.text
                                      : _setorSelecionado,
                              'numeroAtendimento':
                                  _numeroAtendimentoController.text,
                              'prontuario1': _respostasProntuario1,
                              'prontuario2': _respostasProntuario2,
                              'prontuario3': _respostasProntuario3,
                              'consideracoes1': _consideracoes1Controller.text,
                              'consideracoes2': _consideracoes2Controller.text,
                              'consideracoes3': _consideracoes3Controller.text,
                            };

                            debugPrint(dados.toString());
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Dados salvos com sucesso!'),
                              ),
                            );
                          }
                        },
                        icon: const Icon(Icons.save),
                        label: const Text('Salvar'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF2979D4),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

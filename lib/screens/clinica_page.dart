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

  final TextEditingController _numeroAtendimentoController =
      TextEditingController();
  final TextEditingController _consideracoes1Controller =
      TextEditingController();
  final TextEditingController _consideracoes2Controller =
      TextEditingController();
  final TextEditingController _consideracoes3Controller =
      TextEditingController();

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
    _numeroAtendimentoController.dispose();
    _consideracoes1Controller.dispose();
    _consideracoes2Controller.dispose();
    _consideracoes3Controller.dispose();
    super.dispose();
  }

  Widget _buildRadioGroup(
    String pergunta,
    String key,
    Map<String, String?> respostas,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pergunta),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  Radio<String>(
                    value: 'C',
                    groupValue: respostas[key],
                    onChanged: (value) {
                      setState(() {
                        respostas[key] = value;
                      });
                    },
                  ),
                  const Text('C'),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'NC',
                    groupValue: respostas[key],
                    onChanged: (value) {
                      setState(() {
                        respostas[key] = value;
                      });
                    },
                  ),
                  const Text('NC'),
                ],
              ),
              Row(
                children: [
                  Radio<String>(
                    value: 'NA',
                    groupValue: respostas[key],
                    onChanged: (value) {
                      setState(() {
                        respostas[key] = value;
                      });
                    },
                  ),
                  const Text('NA'),
                ],
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }

  Widget _buildSecaoProntuario(
    String titulo,
    List<Map<String, String>> perguntas,
    Map<String, String?> respostas,
    TextEditingController controller,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          titulo,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),

        const Divider(thickness: 2),
        ...perguntas.map((pergunta) {
          final key = _gerarChave(pergunta['pergunta']!);
          return _buildRadioGroup(pergunta['pergunta']!, key, respostas);
        }).toList(),
        const SizedBox(height: 16),
        TextFormField(
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Comentários sobre o prontuário',
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoria Clínica'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2979D4),
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          constraints: const BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Auditoria Clínica',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF2C3E50),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),

                  // Data e Hora
                  const Text('Data e Hora da Auditoria *'),
                  const SizedBox(height: 8),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'dd/mm/aaaa hh:mm',
                    ),
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
                          });
                        }
                      }
                    },
                    readOnly: true,
                    controller: TextEditingController(
                      text:
                          _dataHoraAuditoria != null
                              ? "${_dataHoraAuditoria!.day.toString().padLeft(2, '0')}/"
                                  "${_dataHoraAuditoria!.month.toString().padLeft(2, '0')}/"
                                  "${_dataHoraAuditoria!.year} "
                                  "${_dataHoraAuditoria!.hour.toString().padLeft(2, '0')}:"
                                  "${_dataHoraAuditoria!.minute.toString().padLeft(2, '0')}"
                              : '',
                    ),
                    validator:
                        (value) =>
                            _dataHoraAuditoria == null
                                ? 'Campo obrigatório'
                                : null,
                  ),
                  const SizedBox(height: 16),

                  // Auditor
                  const Text('Auditor *'),
                  DropdownButtonFormField<String>(
                    value: _auditorSelecionado,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items:
                        _auditores
                            .map(
                              (a) => DropdownMenuItem(value: a, child: Text(a)),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        _auditorSelecionado = value;
                        if (value != 'Outros...') {
                          _outroAuditorNome = null;
                        }
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? 'Selecione um auditor' : null,
                  ),
                  if (_auditorSelecionado == 'Outros...') ...[
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Informe o nome do auditor',
                      ),
                      onChanged: (value) => _outroAuditorNome = value,
                      validator: (value) {
                        if (_auditorSelecionado == 'Outros...' &&
                            (value == null || value.trim().isEmpty)) {
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
                    ),
                    items:
                        _setores
                            .map(
                              (s) => DropdownMenuItem(value: s, child: Text(s)),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        _setorSelecionado = value;
                        if (value != 'Outros...') {
                          _outroSetorNome = null;
                        }
                      });
                    },
                    validator:
                        (value) => value == null ? 'Selecione um setor' : null,
                  ),
                  if (_setorSelecionado == 'Outros...') ...[
                    const SizedBox(height: 12),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Informe o nome do setor',
                      ),
                      onChanged: (value) => _outroSetorNome = value,
                      validator: (value) {
                        if (_setorSelecionado == 'Outros...' &&
                            (value == null || value.trim().isEmpty)) {
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
                    ),
                    validator:
                        (value) =>
                            value?.isEmpty ?? true ? 'Campo obrigatório' : null,
                  ),

                  _buildSecaoProntuario(
                    '1. Prontuário ',
                    _perguntasProntuarios1,
                    _respostasProntuario1,
                    _consideracoes1Controller,
                  ),
                  _buildSecaoProntuario(
                    '2. Questões Relativas aos Colaboradores ',
                    _perguntasProntuarios2,
                    _respostasProntuario2,
                    _consideracoes2Controller,
                  ),
                  _buildSecaoProntuario(
                    '3. Questões Relacionadas ao Paciente',
                    _perguntasProntuarios3,
                    _respostasProntuario3,
                    _consideracoes3Controller,
                  ),

                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
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
                                  ? _outroAuditorNome
                                  : _auditorSelecionado,
                          'setor':
                              _setorSelecionado == 'Outros...'
                                  ? _outroSetorNome
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
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: const Color(0xFF2979D4),
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text('Salvar'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

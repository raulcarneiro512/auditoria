import 'package:flutter/material.dart';

class InternaPage extends StatefulWidget {
  const InternaPage({super.key});

  @override
  _InternaPageState createState() => _InternaPageState();
}

class _InternaPageState extends State<InternaPage> {
  final _formKey = GlobalKey<FormState>();
  DateTime? _dataHoraAuditoria;
  String? _auditorSelecionado;
  String? _setorSelecionado;
  bool _mostrarCampoOutroAuditor = false;
  final TextEditingController _dataHoraController = TextEditingController();
  final TextEditingController _outroAuditorController = TextEditingController();

  final List<String> auditores = [
    'Amanda Borges',
    'Camila Negrão',
    'Regina Bastos',
    'Romulo Nina',
    'Rosa Amélia',
    'Fernanda Paiva',
    'Outro...',
  ];

  final List<String> setores = [
    'Internação 1',
    'Internação 2',
    'UTI',
    'Outros...',
  ];

  // Lista para os nomes dos blocos - altere aqui os títulos como quiser
  final List<String> nomesBlocos = [
    'ESTRUTURA AMBIENTE',
    'GERENCIAL',
    'SEGURANÇA DAS INSTALAÇÕES',
    'PGRSS',
    'PLANO DE CONTIGÊNCIA',
    'APRESENTAÇÃO E SEGURANÇA PESSOAL',
    'GESTÃO DA QUALIDADE E SEGURANÇA DO PACIENTE',
    'SCIH',
    'GERENCIAMENTO DE RISCO',
    'UNIDADES',
  ];

  final List<List<String>> blocosPerguntas = [
    [
      // Bloco 1
      "Setor promove organização, limpeza e eficiência no ambiente de trabalho através da utilização, ordenação, limpeza, padronização e disciplina?",
      "Cronograma de desinsetização de livre acesso e atualizado?",
      "As paredes apresentam fungos ou ambiente com presença de vetores?",
      "Janelas fechadas ou teladas? (controle de pragas e prevenção de suicídio)",
      "Cronograma de limpeza terminal disponível?",
      "Evidência de limpeza concorrente?",
      "Reagentes com identificação do prazo de abertura e validade?",
      "Geladeira limpa, sem produtos adversos, sem medicamentos na porta, com monitoramento de temperatura adequada?",
      "Carro de transporte limpo e sem ferrugem?",
      "Há cruzamento no fluxo de transporte do material limpo e sujo?",
      "Expurgo limpo? Porta fechada? Material sujo organizado e identificado",
      "Banheiros com barras e ralos escamoteáveis?",
    ],
    [
      // Bloco 2
      "O quadro de Gestão a vista está atualizado, organizado, e é do conhecimento de todos da equipe?",
      "Os indicadores de qualidade estão com análise atualizada no MV estratégico? Seus resultados são compartilhados com todos da equipe em local de fácil acesso?",
      "Coordenador, gerente ou RT se faz presente na área, e realiza reuniões periódicas?",
      "Os planos de ação definidos são gerenciados e a equipe percebe a melhoria no ambiente?",
      "Escalas de trabalho multiprofissional disponíveis em local de fácil acesso?",
    ],
    [
      // Bloco 3
      "Há plano de evacuação em caso de incêndio? Se sim, qual a rota de fuga?",
      "Sinalização adequada da rota de fuga?",
      "Há brigadistas no setor? Houve treinamento?",
      "Há identificação adequada dos extintores sem móveis e equipamentos obstruindo? E com local demarcado de conhecimento de todos?",
      "Todas as pessoas no ambiente estão identificadas, incluindo fornecedores, acompanhantes, pacientes, etc.?",
      "Cronograma de manutenção preventiva dos equipamentos em local de fácil acesso?",
      "Cronograma de manutenção preventiva das instalações disponível?",
    ],
    [
      // Bloco 4
      "Caixa de perfuro cortante está identificada, no limite e altura adequados?",
      "Os resíduos estão descartados adequadamente?",
      "Houve treinamento sobre descarte correto de resíduos?",
      "O PGRSS está devidamente documentado e atualizado?",
      "Relatórios periódicos são gerados e revisados pelas partes interessadas?",
    ],
    [
      // Bloco 5
      "Há plano de contingência elaborado e amplamente divulgado?",
      "O plano é revisado e atualizado regularmente para refletir mudanças no ambiente interno e externo?",
      "Foram designadas claramente as responsabilidades de cada membro da equipe de contingência?",
      "Existe fluxo coordenado definido para situações de emergência? (falta de luz, água, telefone, parada de sistema, parada de elevador, etc)?",
      "O plano identifica os recursos necessários (equipamentos, materiais, pessoal) para cada tipo de contingência?",
      "A equipe foi treinada regularmente sobre os procedimentos do plano de contingência?",
    ],
    [
      // Bloco 6
      "Profissional com crachá fixado na altura do peito de forma visível? (sem fio ou cordão)",
      "Profissional com uniforme limpo e íntegro? (Jaleco ou roupa privativa em áreas fechadas)",
      "Profissional com sapato fechado?",
      "Uso de EPI's adequado durante a atividade realizada",
    ],
    [
      // Bloco 7
      "Mapa estratégico disponível (visão, missão e valores) e de conhecimento de todos?",
      "Mapa de processo atualizado e disponível?",
      "Procedimento Geral descrito com foco nas ROP's?",
      "É do conhecimento de todos as práticas obrigatórias de saúde (ROP)?",
      "É de conhecimento geral a localização dos documentos no sistema?",
      "As normas, rotinas e manuais são documentados? POP e protocolos descritos, atualizados e disponíveis na área?",
      "O cronograma de treinamento está alinhado com o LNT (levantamento de necessidade de treinamento)?",
      "As interações de processos estão definidas e documentadas na pasta gerencial?",
      "Como são gerenciadas as não conformidades ou desvios identificados nas interações de processos?",
      "O setor atingiu a meta de auditoria clínica definida nas últimas 4 semanas?",
      "O gestor conhece e divulga a ferramenta de monitoramento da auditoria clínica para todos da equipe?",
      "O resultado da auditoria foi utilizado para traçar melhorias e essas ações têm evidência de conclusão?",
    ],
    [
      // Bloco 8
      "Equipe conforme NR 32 e adorno zero?",
      "Equipe conhece o protocolo de precaução padrão e de isolamento? Recebeu treinamento sobre o protocolo?",
      "Há pias em todos os ambientes de assistência facilitando a higienização das mãos?",
      "Há dispensadores de álcool gel abastecidos em cada área próxima à assistência prestada? (entre leitos, ou entre macas, ou entre poltronas)",
      "Os indicadores de IRAS são compartilhados com gerentes e equipe assistencial?",
      "As infecções são monitoradas e os resultados obtidos são usados para traçar melhorias na assistência?",
    ],
    [
      // Bloco 9
      "Mapeamento de risco está atualizado?",
      "Quais são os principais riscos gerenciados?",
      "A equipe sabe informar as principais práticas de controle para cada risco gerenciado?",
      "Há sinalização de riscos identificados em prontuários, ou é utilizada outra estratégia para sua sinalização?",
      "É do conhecimento de todos o fluxo de notificação de incidentes? Notificação - avaliação da qualidade - encaminhamento - investigação e análise - plano de ação - validação",
      "Todos conhecem o sistema de notificação e sabem notificar?",
      "Equipe tem conhecimento do Painel BI de gerenciamento de notificações?",
      "Houve treinamento sobre notificação de incidentes?",
    ],
    [
      // Bloco 10
      "O quadro de divisão de tarefas está preenchido e atualizado?",
      "O sistema de chamada nos leitos e banheiros está funcionando e é utilizado?",
      "A régua de gases é funcionante com pontos de oxigênio e ar comprimido em todos os leitos?",
      "Há inventário de equipamento médico hospitalar no setor?",
      "Há evidência de inventário do mobiliário administrativo?",
      "Nos ambientes em que se encontra o paciente sua privacidade é garantida durante procedimentos ou sempre que necessário?",
      "As maletas de emergência são de fácil acesso e com controle adequado?",
      "O carro de emergência está com lacre padronizado, e com auditoria realizada no último mês em dupla checagem entre enfermeiro e farmacêutico?",
      "É garantida a rastreabilidade dos medicamentos multidoses?",
      "Há estoque indevido de material reprocessado?",
      "Há estoque indevido de insumos?",
    ],
  ];

  final List<Map<String, String>> blocosRespostas = List.generate(
    10,
    (_) => {},
  );

  final List<TextEditingController> blocosConsideracoes = List.generate(
    10,
    (_) => TextEditingController(),
  );

  // Cores para os blocos (seguindo o padrão do RopsPage)
  final List<String> coresBlocos = [
    '#2979D4', // Azul
    '#4CAF50', // Verde
    '#FF9800', // Laranja
    '#9C27B0', // Roxo
    '#F44336', // Vermelho
    '#00BCD4', // Ciano
    '#795548', // Marrom
    '#607D8B', // Azul acinzentado
    '#E91E63', // Rosa
    '#3F51B5', // Índigo
  ];

  @override
  void initState() {
    super.initState();
  }

  Widget _buildPerguntaIndividual(String pergunta, int blocoIndex) {
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
                          groupValue: blocosRespostas[blocoIndex][pergunta],
                          onChanged: (value) {
                            setState(() {
                              blocosRespostas[blocoIndex][pergunta] = value!;
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

  Widget _buildBloco(int index) {
    Color corBloco = _hexToColor(coresBlocos[index]);

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
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: corBloco,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Text(
              '${index + 1}. ${nomesBlocos[index]}',
              style: const TextStyle(
                fontSize: 18,
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
                ...blocosPerguntas[index]
                    .map(
                      (pergunta) => _buildPerguntaIndividual(pergunta, index),
                    )
                    .toList(),

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
                    controller: blocosConsideracoes[index],
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

  Color _hexToColor(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  int _calcularProgresso() {
    int totalPerguntas = 0;
    int perguntasRespondidas = 0;

    for (int i = 0; i < blocosPerguntas.length; i++) {
      for (String pergunta in blocosPerguntas[i]) {
        totalPerguntas++;
        if (blocosRespostas[i][pergunta] != null) {
          perguntasRespondidas++;
        }
      }
    }

    return totalPerguntas > 0
        ? (perguntasRespondidas * 100 / totalPerguntas).round()
        : 0;
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
              auditores
                  .map((a) => DropdownMenuItem(value: a, child: Text(a)))
                  .toList(),
          onChanged: (value) {
            setState(() {
              _auditorSelecionado = value;
              _mostrarCampoOutroAuditor = value == 'Outro...';
              if (value != 'Outro...') {
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
              setores
                  .map((s) => DropdownMenuItem(value: s, child: Text(s)))
                  .toList(),
          onChanged: (value) {
            setState(() {
              _setorSelecionado = value;
            });
          },
          validator: (value) => value == null ? 'Selecione um setor' : null,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    int progresso = _calcularProgresso();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoria Interna'),
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

                    // Blocos de perguntas
                    ...List.generate(10, (index) => _buildBloco(index)),

                    const SizedBox(height: 24),

                    // Botão
                    Center(
                      child: ElevatedButton.icon(
                        onPressed:
                            progresso == 100
                                ? () {
                                  if (_formKey.currentState?.validate() ??
                                      false) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text('Dados salvos!'),
                                      ),
                                    );
                                  }
                                }
                                : null,
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

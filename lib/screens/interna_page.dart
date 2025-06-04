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

  @override
  void initState() {
    super.initState();
    _auditorSelecionado = auditores.first;
    _setorSelecionado = setores.first;
  }

  Widget _buildBloco(int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          nomesBlocos[index], // Aqui está o nome customizável do bloco
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 10),
        ...blocosPerguntas[index].map((pergunta) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(pergunta),
              Row(
                children:
                    ['C', 'NC', 'NA'].map((resposta) {
                      return Expanded(
                        child: RadioListTile<String>(
                          title: Text(resposta),
                          value: resposta,
                          groupValue: blocosRespostas[index][pergunta],
                          onChanged: (value) {
                            setState(() {
                              blocosRespostas[index][pergunta] = value!;
                            });
                          },
                        ),
                      );
                    }).toList(),
              ),
            ],
          );
        }).toList(),
        const SizedBox(height: 10),
        TextFormField(
          controller: blocosConsideracoes[index],
          decoration: const InputDecoration(
            labelText: 'Considerações',
            border: OutlineInputBorder(),
          ),
          maxLines: 3,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auditoria Interna'),
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
                    'Auditoria Interna',
                    style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFF2C3E50),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 25),
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
                  const Text('Auditor *'),
                  DropdownButtonFormField<String>(
                    value: _auditorSelecionado,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items:
                        auditores
                            .map(
                              (a) => DropdownMenuItem(value: a, child: Text(a)),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        _auditorSelecionado = value;
                        _mostrarCampoOutroAuditor = value == 'Outro...';
                      });
                    },
                    validator:
                        (value) =>
                            value == null ? 'Selecione um auditor' : null,
                  ),
                  if (_mostrarCampoOutroAuditor) ...[
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _outroAuditorController,
                      decoration: const InputDecoration(
                        labelText: 'Informe o nome do auditor',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (_mostrarCampoOutroAuditor &&
                            (value == null || value.isEmpty)) {
                          return 'Por favor, informe o nome do auditor';
                        }
                        return null;
                      },
                    ),
                  ],
                  const SizedBox(height: 16),
                  const Text('Setor *'),
                  DropdownButtonFormField<String>(
                    value: _setorSelecionado,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    items:
                        setores
                            .map(
                              (s) => DropdownMenuItem(value: s, child: Text(s)),
                            )
                            .toList(),
                    onChanged: (value) {
                      setState(() {
                        _setorSelecionado = value;
                      });
                    },
                    validator:
                        (value) => value == null ? 'Selecione um setor' : null,
                  ),
                  ...List.generate(10, (index) => _buildBloco(index)),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Dados salvos!')),
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

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:auditoria_hospitalar/screens/rank_page.dart';

class RopsPage extends StatefulWidget {
  const RopsPage({super.key});

  @override
  _RopsPageState createState() => _RopsPageState();
}

class _RopsPageState extends State<RopsPage> {
  final _formKey = GlobalKey<FormState>();

  DateTime? _dataHoraAuditoria;
  String? _auditorSelecionado;
  String? _outroAuditorNome;
  String? _setorSelecionado;
  String? _outroSetorNome;
  String? _liderPresente;

  final TextEditingController _dataHoraController = TextEditingController();
  final TextEditingController _outroAuditorController = TextEditingController();
  final TextEditingController _outroSetorController = TextEditingController();

  List<Map<String, dynamic>> blocosAnterior = [];
  List<Map<String, dynamic>> blocos = [];
  bool _isLoading = true;

  final List<String> _auditores = ['João', 'Maria', 'Carlos', 'Outros...'];
  final List<String> _setores = [
    'Enfermagem',
    'Administrativo',
    'T.I.',
    'Outros...',
  ];

  @override
  void initState() {
    super.initState();
    _carregarPerguntas();
  }

  Future<void> _carregarPerguntas() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/perguntas_auditoria.json',
      );
      final data = json.decode(response);

      setState(() {
        blocos = List<Map<String, dynamic>>.from(data['blocos']);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        blocos = [];
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao carregar perguntas')),
      );
    }
  }

  void _calcularParcial() {
    int totalC = 0;
    int totalNC = 0;

    for (var bloco in blocos) {
      for (var subBloco in bloco['perguntas']) {
        for (var pergunta in subBloco['perguntas']) {
          String? resposta = pergunta['resposta'];
          if (resposta == 'C') totalC++;
          if (resposta == 'NC') totalNC++;
        }
      }
    }

    int totalConsiderado = totalC + totalNC;
    double percentual =
        totalConsiderado > 0 ? (totalC / totalConsiderado) * 100 : 0.0;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Parcial da Auditoria'),
            content: Text(
              'Conformidade: ${percentual.toStringAsFixed(1)}%\n'
              'Total C: $totalC\n'
              'Total NC: $totalNC\n'
              'Total Considerado (C + NC): $totalConsiderado',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          ),
    );
  }

  Widget _buildPerguntaIndividual(Map<String, dynamic> pergunta) {
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
            pergunta['texto'],
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
                          groupValue: pergunta['resposta'],
                          onChanged: (value) {
                            setState(() {
                              pergunta['resposta'] = value;
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

  Widget _buildSubBloco(Map<String, dynamic> subBloco) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Text(
              '${subBloco['id']} ${subBloco['titulo']}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children:
                  subBloco['perguntas']
                      .map<Widget>(
                        (pergunta) => _buildPerguntaIndividual(pergunta),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlocoPrincipal(Map<String, dynamic> bloco) {
    Color corBloco = _hexToColor(bloco['cor'] ?? '#2979D4');

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${bloco['id']}. ${bloco['titulo']}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                if (bloco['descricao'] != null) ...[
                  const SizedBox(height: 8),
                  Text(
                    bloco['descricao'],
                    style: const TextStyle(fontSize: 14, color: Colors.white70),
                  ),
                ],
              ],
            ),
          ),
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
              children:
                  bloco['perguntas']
                      .map<Widget>((subBloco) => _buildSubBloco(subBloco))
                      .toList(),
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

    for (var bloco in blocos) {
      for (var subBloco in bloco['perguntas']) {
        for (var pergunta in subBloco['perguntas']) {
          totalPerguntas++;
          if (pergunta['resposta'] != null) {
            perguntasRespondidas++;
          }
        }
      }
    }

    return totalPerguntas > 0
        ? (perguntasRespondidas * 100 / totalPerguntas).round()
        : 0;
  }

  void _irParaRank() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                rank_page(blocosAnterior: blocosAnterior, blocosAtual: blocos),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    int progresso = _calcularProgresso();

    return Scaffold(
      appBar: AppBar(
        title: const Text('ROPS - Auditoria'),
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
                    _buildCamposFormulario(),
                    const SizedBox(height: 24),
                    ...blocos
                        .map((bloco) => _buildBlocoPrincipal(bloco))
                        .toList(),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            if (_formKey.currentState?.validate() ?? false) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Enviando dados...'),
                                ),
                              );
                            }
                          },
                          icon: const Icon(Icons.send),
                          label: const Text('Enviar'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF2979D4),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _calcularParcial,
                          icon: const Icon(Icons.calculate),
                          label: const Text('Parcial'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                        ),
                        ElevatedButton.icon(
                          onPressed: _irParaRank,
                          icon: const Icon(Icons.bar_chart),
                          label: const Text('Rank'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ],
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

  Widget _buildCamposFormulario() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
        // ... (continua igual com campos de auditor, setor e líder presente)
      ],
    );
  }
}

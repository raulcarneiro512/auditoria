import 'package:flutter/material.dart';

class rank_page extends StatelessWidget {
  final List<Map<String, dynamic>> blocosAnterior;
  final List<Map<String, dynamic>> blocosAtual;

  const rank_page({
    super.key,
    required this.blocosAnterior,
    required this.blocosAtual,
  });

  // Função para calcular a porcentagem de respostas "C" por bloco
  double _calcularPercentual(List<dynamic> perguntas) {
    if (perguntas.isEmpty) return 0.0;
    int total = perguntas.length;
    int countC = perguntas.where((p) => p['resposta'] == 'C').length;
    return (countC / total) * 100;
  }

  @override
  Widget build(BuildContext context) {
    // Mapear blocos anterior e atual pelo título para facilitar comparação
    Map<String, Map<String, dynamic>> anteriorMap = {
      for (var bloco in blocosAnterior) bloco['titulo']: bloco,
    };
    Map<String, Map<String, dynamic>> atualMap = {
      for (var bloco in blocosAtual) bloco['titulo']: bloco,
    };

    // Listas para categorias
    List<String> melhoraram = [];
    List<String> pioraram = [];
    List<String> continuamZerados = [];

    for (var titulo in atualMap.keys) {
      final blocoAtual = atualMap[titulo]!;
      final blocoAnterior = anteriorMap[titulo];

      final percentualAtual = _calcularPercentual(blocoAtual['perguntas']);
      final percentualAnterior =
          blocoAnterior != null
              ? _calcularPercentual(blocoAnterior['perguntas'])
              : 0.0;

      if (percentualAnterior == 0 && percentualAtual == 100) {
        melhoraram.add(titulo);
      } else if (percentualAnterior == 100 && percentualAtual == 0) {
        pioraram.add(titulo);
      } else if (percentualAnterior == 0 && percentualAtual == 0) {
        continuamZerados.add(titulo);
      }
    }

    Widget _buildCategoria(String titulo, List<String> blocos) {
      return Expanded(
        child: Card(
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                Text(
                  titulo,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const Divider(),
                if (blocos.isEmpty)
                  const Text('Nenhum bloco nessa categoria.')
                else
                  ...blocos.map((b) => ListTile(title: Text(b))).toList(),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Painel de Melhoria ROPS'),
        backgroundColor: Colors.green,
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategoria('Melhoraram 0% → 100%', melhoraram),
          _buildCategoria('Pioraram 100% → 0%', pioraram),
          _buildCategoria('Continuam 0%', continuamZerados),
        ],
      ),
    );
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../data/database_helper.dart';

// Substitua com seus dados reais do Supabase:
const String supabaseUrl = 'https://SEU_PROJETO.supabase.co/rest/v1/auditoria';
const String supabaseApiKey = 'SUA_API_KEY_AQUI';

/// Envia uma auditoria individual para o Supabase
Future<bool> enviarAuditoriaParaSupabase(Map<String, dynamic> auditoria) async {
  try {
    final response = await http.post(
      Uri.parse(supabaseUrl),
      headers: {
        'apikey': supabaseApiKey,
        'Authorization': 'Bearer $supabaseApiKey',
        'Content-Type': 'application/json',
        'Prefer': 'return=representation',
      },
      body: jsonEncode({
        'data': auditoria['data'],
        'auditor': auditoria['auditor'],
        'setor': auditoria['setor'],
        'tipo': auditoria['tipo'],
        'respostas': jsonDecode(auditoria['respostas']),
      }),
    );

    if (response.statusCode == 201) {
      print('✅ Enviado com sucesso: ${response.body}');
      return true;
    } else {
      print('❌ Erro ao enviar (${response.statusCode}): ${response.body}');
      return false;
    }
  } catch (e) {
    print('❌ Erro na requisição: $e');
    return false;
  }
}

/// Sincroniza todas as auditorias não sincronizadas do SQLite para o Supabase
Future<void> sincronizarAuditorias() async {
  final dbHelper = DatabaseHelper.instance;
  final lista = await dbHelper.listarAuditoriasNaoSincronizadas();

  print('🔄 Total de auditorias a sincronizar: ${lista.length}');

  for (var auditoria in lista) {
    bool sucesso = await enviarAuditoriaParaSupabase(auditoria);
    if (sucesso) {
      await dbHelper.marcarComoSincronizado(auditoria['id']);
    }
  }

  print('✅ Sincronização concluída.');
}

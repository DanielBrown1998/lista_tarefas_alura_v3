import 'package:lista_tarefas_alura_v3/components/principal/task.dart';
import 'package:lista_tarefas_alura_v3/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String _tableName = 'taskTable';
  static const String _name = 'nome';
  static const String _dificulty = 'dificuldade';
  static const String _image = 'imagem';

  static const String createTableSql = 'CREATE TABLE $_tableName('
      '$_name TEXT, '
      '$_dificulty INTEGER, '
      '$_image TEXT)';

  Map<String, dynamic> toMap(Task tarefa) {
    print("convertendo tarefa em Map");

    Map<String, dynamic> map = {
      _name: tarefa.text,
      _dificulty: tarefa.dificulty,
      _image: tarefa.urlPicture,
    };
    print("Mapa gerado: $map");

    return map;
  }

  save(Task tarefa) async {
    print('iniciando o save.');
    final Database bancoDeDados = await getDatabase();
    var itemExists = await find(tarefa.text);
    if (itemExists.isEmpty) {
      print('A tarefa NÃO existia');
      return await bancoDeDados.insert(_tableName, toMap(tarefa));
    } else {
      print("A tarefa JÁ existia!");
      return await bancoDeDados.update(_tableName, toMap(tarefa),
          where: '$_name = ?', whereArgs: [tarefa.text]);
    }
  }

  Future<List<Task>> findAll() async {
    print('Estamos acessando o findAll: ');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result =
        await bancoDeDados.query(_tableName);
    print('expondo..');
    print('$result');
    return toList(result);
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    print('acessando find');
    final Database bancoDeDados = await getDatabase();
    final List<Map<String, dynamic>> result = await bancoDeDados
        .query(_tableName, where: '$_name = ?', whereArgs: ['%$nomeDaTarefa%']);
    print('procurando...');
    print(result);
    return toList(result);
  }

  delete(String nomeDaTArefa) async {
    print("Deletando a tarefa $nomeDaTArefa");
    final Database bancoDeDados = await getDatabase();
    return bancoDeDados
        .delete(_tableName, where: "$_name = ?", whereArgs: [nomeDaTArefa]);
  }

  List<Task> toList(List<Map<String, dynamic>> mapaDeTarefas) {
    print('convertendo to list');
    final List<Task> tarefas = [];

    for (Map<String, dynamic> item in mapaDeTarefas) {
      tarefas.add(Task(item[_name], item[_image], item[_dificulty]));
    }
    print('pronto.');
    return tarefas;
  }
}

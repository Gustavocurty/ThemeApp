// ignore_for_file: empty_constructor_bodies

class Tarefa {
  late String id;
  late String titulo;
  late String descricao;
  late bool concluida;

  Tarefa({
    required this.id,
    required this.titulo,
    required this.descricao,
    this.concluida= false,
  });

  factory Tarefa.fromJson(Map<String, dynamic> json) {
    return Tarefa(
      id: json['id'],
      titulo: json['titulo'],
      descricao: json['descricao'],
      concluida: json['concluida'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'descricao': descricao,
      'concluida': concluida,
    };
  }
}
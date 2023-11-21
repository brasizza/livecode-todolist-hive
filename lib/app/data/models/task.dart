// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:isar/isar.dart';

part 'task.g.dart';

@Collection()

class Task {
  final Id? id;
  final String tarefa;
  final String descricao;
  final bool status;
  Task({
    this.id,
    required this.tarefa,
    required this.descricao,
    required this.status,
  });

  Task copyWith({
    Id? id,
    String? tarefa,
    String? descricao,
    bool? status,
  }) {
    return Task(
      id: id ?? this.id,
      tarefa: tarefa ?? this.tarefa,
      descricao: descricao ?? this.descricao,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'tarefa': tarefa,
      'descricao': descricao,
      'status': status,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as int : null,
      tarefa: map['tarefa'] as String,
      descricao: map['descricao'] as String,
      status: map['status'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id, tarefa: $tarefa, descricao: $descricao, status: $status)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.tarefa == tarefa &&
      other.descricao == descricao &&
      other.status == status;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      tarefa.hashCode ^
      descricao.hashCode ^
      status.hashCode;
  }
}

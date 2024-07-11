// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  int id;
  List<String> taskName;

  TodoModel({
    required this.taskName,
    required this.id,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        taskName: json["taskName"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "taskName": taskName,
        "id": id,
      };
}

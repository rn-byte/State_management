// To parse this JSON data, do
//
//     final todoModel = todoModelFromJson(jsonString);

import 'dart:convert';

TodoModel todoModelFromJson(String str) => TodoModel.fromJson(json.decode(str));

String todoModelToJson(TodoModel data) => json.encode(data.toJson());

class TodoModel {
  List<String> taskName;

  TodoModel({
    required this.taskName,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        taskName: json["taskName"],
      );

  Map<String, dynamic> toJson() => {
        "taskName": taskName,
      };
}

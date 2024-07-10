import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoService extends Equatable {
  static Future<void> addData(List<String> todo) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setStringList('todo', todo).then((value) {
      debugPrint('Add Data Check : ${todo.toString()}');
    });
  }

  static Future<List<String>> getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    debugPrint('Retrive Data Check : ${sp.getStringList('todo').toString()}');
    return sp.getStringList('todo') ?? [];
  }

  @override
  List<Object?> get props => [];
}

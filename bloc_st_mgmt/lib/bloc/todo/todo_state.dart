import 'package:equatable/equatable.dart';

class TodoState extends Equatable {
  final List<String> todoList;
  const TodoState({this.todoList = const []});

  TodoState copyWith({List<String>? toDoVal}) {
    return TodoState(
      todoList: toDoVal ?? todoList,
    );
  }

  @override
  List<Object?> get props => [todoList];
}

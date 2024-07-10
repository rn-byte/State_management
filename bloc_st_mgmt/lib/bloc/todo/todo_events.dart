import 'package:equatable/equatable.dart';

abstract class TodoEvents extends Equatable {
  const TodoEvents();
}

class AddTodoEvent extends TodoEvents {
  final String taskName;
  const AddTodoEvent({required this.taskName});
  @override
  List<Object?> get props => [taskName];
}

class RemoveTodoEvent extends TodoEvents {
  final Object taskObj;
  const RemoveTodoEvent({required this.taskObj});

  @override
  List<Object?> get props => [taskObj];
}

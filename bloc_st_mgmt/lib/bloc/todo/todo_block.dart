import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/bloc/todo/todo_events.dart';
import 'package:bloc_st_mgmt/bloc/todo/todo_state.dart';

class TodoBlock extends Bloc<TodoEvents, TodoState> {
  final List<String> taskList = [];
  TodoBlock() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
    on<DisplayTodoEvent>(_displayTodo);
  }
  void _addTodo(AddTodoEvent events, Emitter<TodoState> emit) {
    taskList.add(events.taskName);
    emit(state.copyWith(toDoVal: List.from(taskList)));
  }

  void _removeTodo(RemoveTodoEvent events, Emitter<TodoState> emit) {
    taskList.remove(events.taskObj);
    emit(state.copyWith(toDoVal: List.from(taskList)));
  }

  void _displayTodo(DisplayTodoEvent events, Emitter<TodoState> emit) {
    emit(state.copyWith(toDoVal: state.todoList));
  }
}

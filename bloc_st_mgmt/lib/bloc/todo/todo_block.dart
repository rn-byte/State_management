import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/bloc/todo/todo_events.dart';
import 'package:bloc_st_mgmt/bloc/todo/todo_state.dart';
import 'package:bloc_st_mgmt/todo_service/todo_service.dart';

class TodoBlock extends Bloc<TodoEvents, TodoState> {
  List<String> taskList = [];
  TodoBlock() : super(const TodoState()) {
    on<AddTodoEvent>(_addTodo);
    on<RemoveTodoEvent>(_removeTodo);
    on<DisplayTodoEvent>(_displayTodo);
  }
  void _addTodo(AddTodoEvent events, Emitter<TodoState> emit) async {
    taskList = await TodoService.getData();
    taskList.add(events.taskName);
    TodoService.addData(taskList);
    emit(state.copyWith(toDoVal: List.from(await TodoService.getData())));
  }

  void _removeTodo(RemoveTodoEvent events, Emitter<TodoState> emit) async {
    taskList = await TodoService.getData();
    taskList.remove(events.taskObj);
    TodoService.addData(taskList);
    emit(state.copyWith(toDoVal: List.from(await TodoService.getData())));
  }

  void _displayTodo(DisplayTodoEvent events, Emitter<TodoState> emit) async {
    emit(state.copyWith(toDoVal: List.from(await TodoService.getData())));
  }
}

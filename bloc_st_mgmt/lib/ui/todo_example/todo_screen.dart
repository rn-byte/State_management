import 'package:bloc_st_mgmt/bloc/todo/todo_block.dart';
import 'package:bloc_st_mgmt/bloc/todo/todo_events.dart';
import 'package:bloc_st_mgmt/bloc/todo/todo_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: unused_import
import 'package:shared_preferences/shared_preferences.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> datum = [];
  TextEditingController todoController = TextEditingController();

  // Future<void> addData(String todo) async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   setState(() {
  //     datum.add(todo);
  //     sp.setStringList('todo', datum);
  //     debugPrint(datum.toString());
  //   });
  // }

  Future<void> getData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    setState(() {
      datum = sp.getStringList('todo') ?? [];
      debugPrint('TODO Screen Data check: ${datum.toString()}');
    });
  }

  // Future<void> removeData(String value) async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   setState(() {
  //     datum.remove(value);
  //     sp.setStringList('todo', datum);
  //     debugPrint(datum.toString());
  //   });
  // }

  @override
  void initState() {
    super.initState();
    getData();
    context.read<TodoBlock>().add(const DisplayTodoEvent());
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("BUILD");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc ToDo Example'),
        centerTitle: true,
        backgroundColor: Colors.purple[300],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<TodoBlock, TodoState>(
          builder: (context, state) {
            debugPrint('Block Builder ${state.todoList.toString()}');
            return state.todoList.isEmpty
                ? const Center(
                    child: Text('Add a TODO...'),
                  )
                : ListView.builder(
                    itemCount: state.todoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            onTap: () {
                              debugPrint(state.todoList[index].toString());
                            },
                            title: Text(state.todoList[index]),
                            trailing: IconButton(
                                onPressed: () {
                                  context.read<TodoBlock>().add(RemoveTodoEvent(
                                      taskObj: state.todoList[index]));
                                },
                                icon: const Icon(Icons.delete))),
                      );
                    },
                  );
          },
        ),
        // datum.isEmpty
        //     ? const Center(
        //         child: Text("Add a Todo"),
        //       )
        //     : ListView.builder(
        //         itemCount: datum.length,
        //         itemBuilder: (context, index) {
        //           return Card(
        //             child: ListTile(
        //               title: Text(datum[index]),
        //               trailing: GestureDetector(
        //                   onTap: () {
        //                     removeData(datum[index]);
        //                   },
        //                   child: const Icon(Icons.delete)),
        //             ),
        //           );
        //         },
        //       ),
      ),
      floatingActionButton: BlocBuilder<TodoBlock, TodoState>(
        builder: (context, state) {
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'Add a Todo',
                      textAlign: TextAlign.center,
                    ),
                    content: TextFormField(
                      controller: todoController,
                      decoration:
                          const InputDecoration(hintText: 'Add a todo......'),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            // addData(todoController.text.toString());
                            if (todoController.text.toString() != '' ||
                                todoController.text.toString().isNotEmpty) {
                              context.read<TodoBlock>().add(AddTodoEvent(
                                  taskName: todoController.text.toString()));
                              todoController.clear();
                              Navigator.pop(context);
                            } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('Add a Todo'),
                                backgroundColor: Colors.white,
                              ));
                            }
                          },
                          child: const Text('Add')),
                      TextButton(
                          onPressed: () {
                            todoController.clear();
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel')),
                    ],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  );
                },
              );
            },
            child: const Icon(Icons.add),
          );
        },
      ),
    );
  }
}

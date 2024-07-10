import 'package:bloc_st_mgmt/bloc/counter/counter_bloc.dart';
import 'package:bloc_st_mgmt/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_st_mgmt/bloc/switch/switch_bloc.dart';
import 'package:bloc_st_mgmt/bloc/todo/todo_block.dart';
import 'package:bloc_st_mgmt/utils/image/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'ui/home/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CounterBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => TodoBlock()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

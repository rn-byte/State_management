import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_bloc.dart';
import 'package:bloc_st_mgmt/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_st_mgmt/bloc/switch/switch_bloc.dart';
import 'package:bloc_st_mgmt/bloc/todo/todo_block.dart';
import 'package:bloc_st_mgmt/repository/fav_repository.dart';
import 'package:bloc_st_mgmt/utils/image/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/post/post_bloc.dart';
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
        //BlocProvider(create: (context) => CounterBloc()),

        BlocProvider(create: (context) => SwitchBloc()),
        BlocProvider(create: (context) => TodoBlock()),
        BlocProvider(create: (context) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (context) => FavAppBloc(FavRepository())),
        BlocProvider(create: (context) => PostBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.dark,
        theme: ThemeData(
          //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

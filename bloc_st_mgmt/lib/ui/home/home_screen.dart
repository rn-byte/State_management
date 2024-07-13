import 'package:bloc_st_mgmt/ui/counter_example/counter_screen.dart';
import 'package:bloc_st_mgmt/ui/favourite_app/favourite_app_screen.dart';
import 'package:bloc_st_mgmt/ui/image_picker_example/image_picker.dart';
import 'package:bloc_st_mgmt/ui/login/login_screen.dart';
import 'package:bloc_st_mgmt/ui/post_api_example/post_screen.dart';
import 'package:bloc_st_mgmt/ui/switch_example/switch_screen.dart';
import 'package:bloc_st_mgmt/ui/todo_example/todo_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bolc Examples'),
        centerTitle: true,
        backgroundColor: Colors.blue[400],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        child: Column(
          children: [
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CounterScreen(),
                      ));
                },
                title: const Text('Counter Example'),
                subtitle: const Text('Using Bloc State Management'),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SwitchScreen(),
                      ));
                },
                title: const Text('Switch & Slider Example'),
                subtitle: const Text('Using Bloc State Management'),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ImagePickerScreen(),
                      ));
                },
                title: const Text('Image Picker Example'),
                subtitle: const Text('Using Bloc State Management'),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TodoScreen(),
                      ));
                },
                title: const Text('ToDO Example'),
                subtitle:
                    const Text('Flutter Bloc Insert & Delete Data from List'),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const FavouriteAppScreen(),
                      ));
                },
                title: const Text('Favourite App Example'),
                subtitle: const Text('Flutter Bloc Fav App'),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostScreen(),
                      ));
                },
                title: const Text('Post api Example'),
                subtitle: const Text('Flutter Bloc example'),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
              ),
            ),
            Card(
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ));
                },
                title: const Text('Bloc Login/Signup Example'),
                subtitle: const Text('Flutter Bloc example'),
                trailing: const Icon(Icons.arrow_circle_right_outlined),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

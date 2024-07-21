import 'package:blc_st_mgmt_clean_archit/config/routes/routes_name.dart';
import 'package:blc_st_mgmt_clean_archit/services/storage/local_storage.dart';
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
        title: const Text('Home'),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              LocalStorage localStorage = LocalStorage();
              localStorage.clearValue('token').then((value) {
                localStorage.clearValue('isLogin');
                Navigator.pushReplacementNamed(context, RoutesName.loginScreen);
              });
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}

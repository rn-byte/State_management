import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Post Api example'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: const Center(child: Text('This is bloc post Api example')),
    );
  }
}

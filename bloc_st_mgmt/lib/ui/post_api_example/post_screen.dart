import 'package:bloc_st_mgmt/bloc/post/post_bloc.dart';
import 'package:bloc_st_mgmt/bloc/post/post_events.dart';
import 'package:bloc_st_mgmt/bloc/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/enum/enums.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPost());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Post Api example'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );

            case PostStatus.failure:
              return Center(
                child: Text(state.message.toString()),
              );
            case PostStatus.success:
              return ListView.builder(
                itemCount: state.postList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(state.postList[index].name),
                      subtitle: Text(state.postList[index].email),
                    ),
                  );
                },
              );
          }
        },
      ),
    );
  }
}

import 'package:bloc_st_mgmt/bloc/post/post_bloc.dart';
import 'package:bloc_st_mgmt/bloc/post/post_events.dart';
import 'package:bloc_st_mgmt/bloc/post/post_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/enum/enums.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  //late PostBloc _postBloc;
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(FetchPost());
  }

  // @override
  // void dispose() {
  //   _postBloc.close();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    debugPrint('BUILD');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc Get Api example'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          debugPrint('post build');
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
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      onChanged: (filterKey) {
                        context
                            .read<PostBloc>()
                            .add(SearchPost(stSearch: filterKey));
                      },
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.black,
                          contentPadding: const EdgeInsets.all(17.0),
                          hintText: 'Search with Email',
                          prefixIcon: const Icon(Icons.search_outlined),
                          border: OutlineInputBorder(
                              borderSide: const BorderSide(width: 0.01),
                              borderRadius: BorderRadius.circular(50))),
                    ),
                  ),
                  Expanded(
                    child: state.stMessage.isNotEmpty
                        ? Center(
                            child: Text(state.stMessage),
                          )
                        : ListView.builder(
                            itemCount: state.tempPostList.isEmpty
                                ? state.postList.length
                                : state.tempPostList.length,
                            itemBuilder: (context, index) {
                              if (state.tempPostList.isNotEmpty) {
                                final item = state.tempPostList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item.email),
                                    subtitle: Text(item.body),
                                  ),
                                );
                              } else {
                                final item = state.postList[index];
                                return Card(
                                  child: ListTile(
                                    title: Text(item.email),
                                    subtitle: Text(item.body),
                                  ),
                                );
                              }
                            },
                          ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}

import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_bloc.dart';
import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fav App Bloc Example'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: BlocBuilder<FavAppBloc, FavAppState>(
        builder: (context, state) {
          switch (state.listStatus) {
            case ListStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case ListStatus.failure:
              return const Text('Something went wrong');
            case ListStatus.success:
              return ListView.builder(
                itemBuilder: (context, index) {
                  return const ListTile();
                },
              );
          }
        },
      ),
    );
  }
}

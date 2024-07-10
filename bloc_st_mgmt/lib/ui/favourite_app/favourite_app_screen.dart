import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_bloc.dart';
import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_events.dart';
import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_state.dart';
import 'package:bloc_st_mgmt/models/fav_app/fav_items_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteAppScreen extends StatefulWidget {
  const FavouriteAppScreen({super.key});

  @override
  State<FavouriteAppScreen> createState() => _FavouriteAppScreenState();
}

class _FavouriteAppScreenState extends State<FavouriteAppScreen> {
  @override
  void initState() {
    super.initState();
    context.read<FavAppBloc>().add(FetchFavAppList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fav App Bloc Example'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          BlocBuilder<FavAppBloc, FavAppState>(
            builder: (context, state) {
              return Visibility(
                visible: state.tempFavItemList.isEmpty ? false : true,
                child: IconButton(
                    onPressed: () {
                      context.read<FavAppBloc>().add(DeleteItem());
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    )),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocBuilder<FavAppBloc, FavAppState>(
          builder: (context, state) {
            switch (state.listStatus) {
              case ListStatus.loading:
                return const Center(child: CircularProgressIndicator());
              case ListStatus.failure:
                return const Text('Something went wrong');
              case ListStatus.success:
                return ListView.builder(
                  itemCount: state.favItemList.length,
                  itemBuilder: (context, index) {
                    final item = state.favItemList[index];
                    return Card(
                        child: ListTile(
                      leading: Checkbox(
                        value:
                            state.tempFavItemList.contains(item) ? true : false,
                        onChanged: (value) {
                          if (value!) {
                            context
                                .read<FavAppBloc>()
                                .add(SelectItem(item: item));
                          } else {
                            context
                                .read<FavAppBloc>()
                                .add(UnselectItem(item: item));
                          }
                        },
                      ),
                      title: Text(
                        item.value.toString(),
                        style: state.tempFavItemList.contains(item)
                            ? const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.black,
                                decorationThickness: 2.7,
                              )
                            : null,
                      ),
                      trailing: IconButton(
                          onPressed: () {
                            FavItemsModel itemsModel = FavItemsModel(
                                id: item.id,
                                value: item.value,
                                isFavourite: item.isFavourite ? false : true);
                            context
                                .read<FavAppBloc>()
                                .add(FavouriteItem(item: itemsModel));
                          },
                          icon: Icon(item.isFavourite
                              ? Icons.favorite
                              : Icons.favorite_outline)),
                    ));
                  },
                );
            }
          },
        ),
      ),
    );
  }
}

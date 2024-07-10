import 'package:equatable/equatable.dart';

import '../../models/fav_app/fav_items_model.dart';

enum ListStatus {
  loading,
  success,
  failure,
}

class FavAppState extends Equatable {
  final List<FavItemsModel> favItemList;
  final List<FavItemsModel> tempFavItemList;
  final ListStatus listStatus;
  const FavAppState({
    this.favItemList = const [],
    this.tempFavItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavAppState copyWith({
    List<FavItemsModel>? favItemList,
    List<FavItemsModel>? tempFavItemList,
    ListStatus? listStatus,
  }) {
    return FavAppState(
      favItemList: favItemList ?? this.favItemList,
      tempFavItemList: tempFavItemList ?? this.tempFavItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favItemList, tempFavItemList, listStatus];
}

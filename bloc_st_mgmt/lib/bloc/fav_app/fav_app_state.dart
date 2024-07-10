import 'package:equatable/equatable.dart';

import '../../models/fav_app/fav_items_model.dart';

enum ListStatus {
  loading,
  success,
  failure,
}

class FavAppState extends Equatable {
  final List<FavItemsModel> favItemList;
  final ListStatus listStatus;
  const FavAppState({
    this.favItemList = const [],
    this.listStatus = ListStatus.loading,
  });

  FavAppState copyWith({
    List<FavItemsModel>? favListItem,
    ListStatus? listStatus,
  }) {
    return FavAppState(
      favItemList: favListItem ?? favItemList,
      listStatus: listStatus ?? this.listStatus,
    );
  }

  @override
  List<Object?> get props => [favItemList, listStatus];
}

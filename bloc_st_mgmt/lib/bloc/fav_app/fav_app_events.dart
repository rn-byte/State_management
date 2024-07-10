import 'package:bloc_st_mgmt/models/fav_app/fav_items_model.dart';
import 'package:equatable/equatable.dart';

abstract class FavAppEvents extends Equatable {
  const FavAppEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavAppList extends FavAppEvents {}

class FavouriteItem extends FavAppEvents {
  final FavItemsModel item;
  const FavouriteItem({required this.item});

  @override
  List<Object?> get props => [item];
}

class SelectItem extends FavAppEvents {
  final FavItemsModel item;
  const SelectItem({required this.item});

  @override
  List<Object?> get props => [item];
}

class UnselectItem extends FavAppEvents {
  final FavItemsModel item;
  const UnselectItem({required this.item});

  @override
  List<Object?> get props => [item];
}

class DeleteItem extends FavAppEvents {}

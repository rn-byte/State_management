import 'package:equatable/equatable.dart';

import '../../models/fav_app/fav_items_model.dart';

class FavAppState extends Equatable {
  final List<FavItemsModel> favItemList;

  const FavAppState({this.favItemList = const []});
  @override
  List<Object?> get props => [favItemList];
}

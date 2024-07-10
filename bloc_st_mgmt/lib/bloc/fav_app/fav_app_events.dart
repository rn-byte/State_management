import 'package:equatable/equatable.dart';

abstract class FavAppEvents extends Equatable {
  const FavAppEvents();

  @override
  List<Object?> get props => [];
}

class FetchFavAppList extends FavAppEvents {}

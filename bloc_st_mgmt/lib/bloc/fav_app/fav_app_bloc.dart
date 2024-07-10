import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_events.dart';
import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_state.dart';
import '../../models/fav_app/fav_items_model.dart';
import '../../repository/fav_repository.dart';

class FavAppBloc extends Bloc<FavAppEvents, FavAppState> {
  FavRepository favRepository;

  List<FavItemsModel> favItemList = [];

  FavAppBloc(this.favRepository) : super(const FavAppState()) {
    on<FetchFavAppList>(fetchFavList);
  }
  void fetchFavList(FetchFavAppList event, Emitter<FavAppState> emit) async {
    favItemList = await favRepository.fetchItem();
    emit(state.copyWith(
        favListItem: List.from(favItemList), listStatus: ListStatus.success));
  }
}

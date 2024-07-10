import 'package:bloc/bloc.dart';
import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_events.dart';
import 'package:bloc_st_mgmt/bloc/fav_app/fav_app_state.dart';
import '../../models/fav_app/fav_items_model.dart';
import '../../repository/fav_repository.dart';

class FavAppBloc extends Bloc<FavAppEvents, FavAppState> {
  FavRepository favRepository;

  List<FavItemsModel> favItemList = [];
  List<FavItemsModel> tempFavItemList = [];

  FavAppBloc(this.favRepository) : super(const FavAppState()) {
    on<FetchFavAppList>(fetchFavList);
    on<FavouriteItem>(_addFavItem);
    on<SelectItem>(_selectItem);
    on<UnselectItem>(_unselectItem);
    on<DeleteItem>(_deleteItem);
  }
  void fetchFavList(FetchFavAppList event, Emitter<FavAppState> emit) async {
    favItemList = await favRepository.fetchItem();
    emit(state.copyWith(
        favItemList: List.from(favItemList), listStatus: ListStatus.success));
  }

  void _addFavItem(FavouriteItem event, Emitter<FavAppState> emit) async {
    final index =
        favItemList.indexWhere((element) => element.id == event.item.id);

    if (event.item.isDeleting) {
      if (tempFavItemList.contains(favItemList[index])) {
        tempFavItemList.remove(favItemList[index]);
        tempFavItemList.add(event.item);
      }
    } else {
      if (tempFavItemList.contains(favItemList[index])) {
        tempFavItemList.remove(favItemList[index]);
        tempFavItemList.add(event.item);
      }
    }

    favItemList[index] = event.item;

    emit(state.copyWith(
        favItemList: List.from(favItemList),
        tempFavItemList: List.from(tempFavItemList)));
  }

  void _selectItem(SelectItem event, Emitter<FavAppState> emit) async {
    tempFavItemList.add(event.item);
    emit(state.copyWith(tempFavItemList: List.from(tempFavItemList)));
  }

  void _unselectItem(UnselectItem event, Emitter<FavAppState> emit) async {
    tempFavItemList.remove(event.item);
    emit(state.copyWith(tempFavItemList: List.from(tempFavItemList)));
  }

  void _deleteItem(DeleteItem event, Emitter<FavAppState> emit) async {
    for (int i = 0; i < tempFavItemList.length; i++) {
      favItemList.remove(tempFavItemList[i]);
    }
    tempFavItemList.clear();
    emit(state.copyWith(
        favItemList: List.from(favItemList),
        tempFavItemList: List.from(tempFavItemList)));
  }
}

import 'package:bloc_st_mgmt/models/fav_app/fav_items_model.dart';

class FavRepository {
  Future<List<FavItemsModel>> fetchItem() async {
    await Future.delayed(const Duration(seconds: 3));
    return List.of(_generateList(10));
  }

  List<FavItemsModel> _generateList(int length) {
    return List.generate(
      length,
      (index) => FavItemsModel(id: index.toString(), value: 'Item : $index'),
    );
  }
}

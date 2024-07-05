import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_st_mgmt/controller/fav_app_controller.dart';

class FavAppScreen extends StatefulWidget {
  const FavAppScreen({super.key});

  @override
  State<FavAppScreen> createState() => _FavAppScreenState();
}

class _FavAppScreenState extends State<FavAppScreen> {
  final FavAppController favAppController = Get.put(FavAppController());
  @override
  Widget build(BuildContext context) {
    debugPrint('Built');
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX FavApp"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: favAppController.fruitList.length,
        itemBuilder: (context, index) {
          return Obx(
            () {
              return Card(
                child: ListTile(
                  onTap: () {
                    if (favAppController.tempList
                        .contains(favAppController.fruitList[index])) {
                      favAppController
                          .removeListVal(favAppController.fruitList[index]);
                    } else {
                      favAppController
                          .addListVal(favAppController.fruitList[index]);
                    }
                  },
                  title: Text(favAppController.fruitList[index]),
                  trailing: Icon(
                    favAppController.tempList.contains(
                            favAppController.fruitList[index].toString())
                        ? Icons.favorite_rounded
                        : Icons.favorite_outline,
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

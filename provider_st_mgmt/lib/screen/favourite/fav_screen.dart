import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_st_mgmt/provider/favourite_provider.dart';
import 'package:provider_st_mgmt/screen/favourite/my_fav_screen.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('build');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite App'),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MyFavScreenItem(),
                    ));
              },
              child: const Icon(Icons.favorite)),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 50,
              itemBuilder: (context, index) {
                return Consumer<FavouriteProvider>(
                  builder: (context, value, child) {
                    return ListTile(
                      onTap: () {
                        if (value.selectedItem.contains(index)) {
                          value.removeItem(index);
                        } else {
                          value.addItem(index);
                        }
                      },
                      title: Text('Item $index'),
                      subtitle: Text('Description of Item $index'),
                      trailing: Icon(value.selectedItem.contains(index)
                          ? Icons.favorite
                          : Icons.favorite_outline),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

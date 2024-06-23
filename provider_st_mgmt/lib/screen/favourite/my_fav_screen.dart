import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/favourite_provider.dart';

class MyFavScreenItem extends StatefulWidget {
  const MyFavScreenItem({super.key});

  @override
  State<MyFavScreenItem> createState() => _MyFavScreenItemState();
}

class _MyFavScreenItemState extends State<MyFavScreenItem> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider =
        Provider.of<FavouriteProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourite Item'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: favouriteProvider.selectedItem.length,
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
                      title: Text('Item ${value.selectedItem[index]}'),
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

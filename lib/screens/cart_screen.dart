import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/item_data.dart';

class Cart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.yellow,
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.orange,
              child: Text('CLEAR CART'),
              onPressed: () =>
                  Provider.of<ItemData>(context, listen: false).reset(),
            ),
          ),
        ],
      ),
      body: Consumer<ItemData>(
        builder: (context, value, child) {
          return value.otherList.length == 0
              ? Center(
                  child: Container(
                    child: Text(
                      'Cart Empty',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                )
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(value.otherList[index].name),
                      subtitle: Text(value.otherList[index].price.toString()),
                      trailing: Icon(
                        Icons.verified,
                        color: Colors.blue,
                      ),
                    );
                  },
                  itemCount: value.otherList.length,
                );
        },
      ),
    );
  }
}

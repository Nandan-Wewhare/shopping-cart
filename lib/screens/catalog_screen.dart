import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart/models/item_data.dart';

import 'cart_screen.dart';

class Catalog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (context) => Cart(),
            ),
          );
        },
        splashColor: Colors.black,
        backgroundColor: Colors.yellow,
        child: Icon(
          Icons.shopping_cart,
          color: Colors.black,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.orange,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Cart Value: \$ ' +
                  Provider.of<ItemData>(context).getSum.toString(),
              textScaleFactor: 2,
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
            child: Text('CLEAR CART'),
            onPressed: () =>
                Provider.of<ItemData>(context, listen: false).reset(),
          ),
        ]),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.yellow,
        title: Text(
          'Catalog',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Consumer<ItemData>(builder: (context, value, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(value.getList[index].name),
              subtitle: Text('\$ ' + value.getList[index].price.toString()),
              trailing: Checkbox(
                  value: value.getList[index].isAdded,
                  onChanged: (bool add) {
                    value.add(value.getList[index]);
                  }),
            );
          },
          itemCount: Provider.of<ItemData>(context).count,
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:shopping_cart/models/item.dart';

class ItemData extends ChangeNotifier {
  int _sum;
  List<Item> _items = [
    Item(name: 'Apple', price: 300),
    Item(name: 'Mango', price: 600),
    Item(name: 'Banana', price: 400),
    Item(name: 'Orange', price: 500),
    Item(name: 'Guava', price: 200)
  ];
  List<Item> _addedItems = [];
  int get count => _items.length;

  List<Item> get getList => _items;
  List<Item> get otherList => _addedItems;

  void add(Item item) {
    item.addToCart();
    _sum = 0;
    _addedItems.clear();
    for (int i = 0; i < _items.length; i++) {
      if (_items[i].isAdded) {
        _sum += _items[i].price;
        _addedItems.add(_items[i]);
      }
    }
    notifyListeners();
  }

  void reset() {
    _sum = 0;
    _addedItems.clear();
    for (int i = 0; i < _items.length; i++) {
      _items[i].isAdded = false;
    }
    notifyListeners();
  }

  int get getSum => _sum ?? 0;
}

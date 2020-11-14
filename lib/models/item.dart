class Item {
  final String name;
  final int price;
  bool isAdded;
  Item({this.name, this.price, this.isAdded = false});

  void addToCart() {
    isAdded = !isAdded;
  }
}

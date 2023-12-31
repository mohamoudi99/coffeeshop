class Order {
  static List<CartItem> cartItems = [
    CartItem(name: "Black", price: 3.5, amount: 0),
    CartItem(name: "Vanilla", price: 4, amount: 0),
    CartItem(name: "Mocha", price: 4, amount: 0),
    CartItem(name: "Caramel", price: 4, amount: 0),
  ];
}

class CartItem {
  String name;
  double price;
  int amount;


  // Use a constructor to calculate totalPrice based on price and amount
  CartItem({
    required this.name,
    required this.price,
    required this.amount,
  });

  double totalPrice() {
    return this.amount*this.price;
  }

  }




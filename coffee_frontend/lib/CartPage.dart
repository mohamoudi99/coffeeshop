
import 'package:coffee_frontend/HomePage.dart';
import 'package:flutter/material.dart';
import 'Order.dart';


class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    bool isCartEmpty = Order.cartItems.every((item) => item.amount == 0);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the previous screen
            Navigator.pushReplacement(
              context,
              PageRouteBuilder(
                pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return child;
                },
                maintainState: false,
              ),
            );
          },
        ),
        backgroundColor: Colors.white70,
        title: Text('Cart Page'), // Set the title to 'Cart Page' or any relevant text
      ),
      backgroundColor: Colors.brown,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Cart Items',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            SizedBox(height: 16),
            Expanded(
              child: isCartEmpty
                  ? Center(
                child: Text('Cart is Empty', style: TextStyle(fontSize: 18, color: Colors.white)),
              )
                  : ListView.builder(
                itemCount: Order.cartItems.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        Text(Order.cartItems[index].name, style: TextStyle(color: Colors.white)),
                        Text('\$${Order.cartItems[index].totalPrice()}' , style: TextStyle(color: Colors.white))
                        ]
                    ),
                    subtitle: Text('Amount: ${Order.cartItems[index].amount}', style: TextStyle(color: Colors.white)),
                  );

                },
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Total Price: \$${calculateTotalPrice()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }

  double calculateTotalPrice() {
    return Order.cartItems.fold(0, (total, item) => total + (item.amount * item.price));
  }
}

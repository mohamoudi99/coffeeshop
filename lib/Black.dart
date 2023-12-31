
import 'package:flutter/material.dart';
import 'package:coffeeshop/HomePage.dart';
import 'package:coffeeshop/CartPage.dart';
import 'Order.dart';
class Black extends StatefulWidget {
  Black({Key? key}) : super(key: key);

  @override
  _BlackState createState() {
    return _BlackState();
  }
}
int quantity = Order.cartItems[0].amount;
class _BlackState extends State<Black> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.white70,
            onPressed: () {
              // Navigate back to the HomePage without animation
              quantity= Order.cartItems[0].amount;
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
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: Colors.white70,
                child: Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0), // Set the border radius as needed
                    child: Image.asset(
                      'lib/images/black.jpeg', // Replace with the actual path of your image
                      fit: BoxFit.cover, // Adjust the BoxFit as needed
                      width: 300, // Set the width as needed
                      height: 300, // Set the height as needed
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12), // Add spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 0) {

                          quantity--;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // Set background color
                      foregroundColor: Colors.white70,
                    ),
                    child: Text('-'),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '${quantity}',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {

                        quantity++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // Set background color
                    ),
                    child: Text('+'),
                  ),
                ],
              ),
              SizedBox(height: 12), // Add spacing
              ElevatedButton(
                onPressed: () {
                  // Add to Cart logic here
                  Order.cartItems[0].amount = quantity;
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => CartPage(),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        return child;
                      },
                      maintainState: false,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white70,
                ),
                child: Text('Add to Cart'),
              ),
            ],
            ),
        );
    }
}


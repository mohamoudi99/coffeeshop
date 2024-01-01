import 'package:flutter/material.dart';
import 'package:coffee_frontend/HomePage.dart';

import 'CartPage.dart';
import 'Order.dart';
class Mocha extends StatefulWidget {
  const Mocha({Key? key}) : super(key: key);

  @override
  _MochaState createState() {
    return _MochaState();
  }
}
int quantity = Order.cartItems[2].amount;
class _MochaState extends State<Mocha> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white70,
            onPressed: () {
              // Navigate back to the HomePage without animation
              quantity = Order.cartItems[2].amount;
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => const HomePage(),
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
                      'lib/images/mocha.jpeg', // Replace with the actual path of your image
                      fit: BoxFit.cover, // Adjust the BoxFit as needed
                      width: 300, // Set the width as needed
                      height: 300, // Set the height as needed
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12), // Add spacing
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
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white70// Set background color
                    ),
                    child: const Text('-'),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '$quantity',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown, // Set background color
                    ),
                    child: const Text('+'),
                  ),
                ],
              ),
              const SizedBox(height: 12), // Add spacing
              ElevatedButton(
                onPressed: () {
                  // Add to Cart logic here
                  Order.cartItems[2].amount = quantity;
                  Navigator.pushReplacement(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const CartPage(),
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
                  // Set background color
                ),
                child: const Text('Add to Cart'),
              ),
            ],
           ),
        );
    }
}
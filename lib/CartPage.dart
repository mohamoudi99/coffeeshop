
import 'package:flutter/material.dart';
class CartPage extends StatefulWidget {
  CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() {
    return _CartPageState();
  }
}

class _CartPageState extends State<CartPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Navigate back to the HomePage without animation
              
            },
          ),
          backgroundColor: Colors.white70,
          title: Text('Cart Page'), // Set the title to 'Info' or any relevant text
        ),

        backgroundColor: Colors.brown,
        );
    }
}
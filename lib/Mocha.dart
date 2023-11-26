import 'package:flutter/material.dart';


class Mocha extends StatefulWidget {
  Mocha({Key? key}) : super(key: key);

  @override
  _MochaState createState() {
    return _MochaState();
  }
}

class _MochaState extends State<Mocha> {
  int quantity = 0; // Track the quantity

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
              SizedBox(height: 12), // Add spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (quantity > 0) {
                          quantity -= 1;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.brown,
                        foregroundColor: Colors.white70// Set background color
                    ),
                    child: Text('-'),
                  ),
                  SizedBox(width: 8),
                  Text(
                    '$quantity',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        quantity += 1;
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
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  foregroundColor: Colors.white70,
                  // Set background color
                ),
                child: Text('Add to Cart'),
              ),
            ],
           ),
        );
    }
}
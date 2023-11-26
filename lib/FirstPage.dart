import 'package:flutter/material.dart';
import 'package:coffeeshop/HomePage.dart';

class FirstPage extends StatefulWidget {
  FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() {
    return _FirstPageState();
  }
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "lib/images/MM.png",
              width: 400,
              height: 400,
            ),
            SizedBox(height: 20),
            Text(
              'How  do you like your cofee?',
              style: TextStyle(fontSize: 18, color: Colors.black54,fontStyle: FontStyle.italic),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the HomePage without the transition animation
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                    maintainState: false, // Set this to false to avoid maintaining state
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(400, 75),
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: Text('Go To Shop'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:coffee_frontend/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:coffee_frontend/Login.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

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
            const SizedBox(height: 20),
            const Text(
              'How  do you like your cofee?',
              style: TextStyle(fontSize: 18, color: Colors.black54,fontStyle: FontStyle.italic),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the HomePage without the transition animation
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const Login(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                    maintainState: false, // Set this to false to avoid maintaining state
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 60),
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text('Log In'),
            ),
            const SizedBox(height: 15.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the HomePage without the transition animation
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => const SignUpPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                    maintainState: false, // Set this to false to avoid maintaining state
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(350, 60),
                backgroundColor: Colors.brown,
                foregroundColor: Colors.white70,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}

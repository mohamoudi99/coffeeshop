import 'package:flutter/material.dart';
import 'package:coffee_frontend/SignUp.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your login form components here
            Text(
              'Login',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            Container(
              width: double.infinity, // Set the button width to the maximum available width
              child: ElevatedButton(
                onPressed: () {
                  // Add your login logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Set the background color to brown
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black, // Set the text color to black
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            TextButton(
              onPressed: () {
                // Add navigation logic to go to the sign-up page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SignUpPage()),
                );
              },
              child: Text("Don't have an account? Sign Up",
                style: TextStyle(
                color: Colors.black, // Set the text color to black
                fontSize: 16.0,
              ),
            ),

            ),
          ],
        ),
      ),
    );
  }
}






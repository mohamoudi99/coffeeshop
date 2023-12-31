import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:coffee_frontend/Login.dart';
import 'package:http/http.dart' as  http;
import 'config.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;

  void registerUser() async {
    if (emailController.text.isNotEmpty && usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {

      var regBody = {
        "email":emailController.text,
        "username":usernameController.text,
        "password":passwordController.text,
      };
      var response = await http.post(Uri.parse(SignUp),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(regBody)
      );

      print(response);
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign Up',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                errorStyle: TextStyle(color: Colors.black),
                errorText: _isNotValidate ? "Enter Proper Info " : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorStyle: TextStyle(color: Colors.black),
                errorText: _isNotValidate ? "Enter Proper Info " : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorStyle: TextStyle(color: Colors.black),
                errorText: _isNotValidate ? "Enter Proper Info " : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            SizedBox(height: 20.0),

            Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  registerUser();
                  // Add your registration logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),

            SizedBox(height: 13.0),
            TextButton(
              onPressed: () {

                print("sign in");
                // Add navigation logic to go to the sign-in page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                "Do you have an account? Log In ;)",
                style: TextStyle(
                  color: Colors.black,
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

import 'dart:convert';
import 'package:coffee_frontend/dashboard.dart';
import 'package:flutter/material.dart';
import 'config.dart';
import 'package:coffee_frontend/SignUp.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';



class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}


class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isNotValidate = false;
  late SharedPreferences prefs;

  @override
  void initState(){

    super.initState();
    initSharedPref();
  }

  void initSharedPref() async{
    prefs = await SharedPreferences.getInstance();

  }

  void loginUser() async {
    if (
        usernameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      var regBody = {

        "username": usernameController.text,
        "password": passwordController.text,
      };
      var response = await http.post(Uri.parse(LOgin),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(regBody)
      );

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['message']);
      if (jsonResponse['message'] == 'Signup successful') {
        var myToken = jsonResponse['token'];
        prefs.setString('token',myToken);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard(token: myToken)));


      }else{
        print("Something went wrong");
      }

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your login form components here
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                errorStyle: const TextStyle(color: Colors.black),
                errorText: _isNotValidate ? "Enter Proper Info " : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorStyle: const TextStyle(color: Colors.black),
                errorText: _isNotValidate ? "Enter Proper Info " : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity, // Set the button width to the maximum available width
              child: ElevatedButton(
                onPressed: () {
                  loginUser();
                  // Add your login logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown, // Set the background color to brown
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black, // Set the text color to black
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12.0),
            TextButton(
              onPressed: () {

                // Add navigation logic to go to the sign-up page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpPage()),
                );
              },
              child: const Text("Don't have an account? Sign Up",
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






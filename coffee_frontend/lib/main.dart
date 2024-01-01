// ignore_for_file: sort_child_properties_last

import 'package:coffee_frontend/FirstPage.dart';
import 'package:coffee_frontend/HomePage.dart';
import 'package:coffee_frontend/Login.dart';
import 'package:coffee_frontend/SignUp.dart';
import 'package:coffee_frontend/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MyApp(token: prefs.getString('token')));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({
    Key? key,
    this.token,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (token == null) {
      // Handle the case where the token is null, e.g., redirect to login screen.
      return const MaterialApp(
        home: Login(), // Replace LoginPage with your login screen.
      );
    }

    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: JwtDecoder.isExpired(token!)
            ? const FirstPage()
            : HomePage(token: token),
      ),
    );
  }
}

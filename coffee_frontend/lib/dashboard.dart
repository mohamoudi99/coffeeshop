import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class Dashboard extends StatefulWidget {
  final token;
  const Dashboard({@required this.token, Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late String email;

  @override
  void initState() {
    super.initState();
    Map<String, dynamic> jwtDecodedToken = JwtDecoder.decode(widget.token);

    // Check if 'email' key exists before accessing it
    if (jwtDecodedToken.containsKey('email')) {
      email = jwtDecodedToken['email'];
    } else {
      email = ''; // Default to an empty string if 'email' is not present
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(email),
          ],
        ),
      ),
    );
  }
}



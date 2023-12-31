import 'package:flutter/material.dart';
import 'package:coffee_frontend/HomePage.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the HomePage without animation
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
        backgroundColor: Colors.white70,
        title: const Text('Info'), // Set the title to 'Info' or any relevant text
        foregroundColor: Colors.black,
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "FROM A BUTTONED-UP MECHANICAL ENGINEER GRAPPLING WITH THE COMPLEXITIES OF LIFE TO A "
                    "CAFFEINATED WIZARD OF BEANS, MY TRANSFORMATION STORY IS NOTHING SHORT "
                    "OF COMICAL. POST-GRADUATION, MY QUEST FOR AN ENGINEERING JOB WAS LIKE SEARCHING "
                    "FOR BIGFOOT - LOTS OF EXCITEMENT, ZERO RESULTS. BUT AS THE WEEKS TICKED BY, MY "
                    "AFFINITY FOR THE BARISTA LIFE BEGAN BREWING. I THOUGHT, WHY NOT CREATE SOMETHING EVEN MORE "
                    "MAGICAL THAN A SELF-STIRRING COFFEE MUG? SO, AFTER SIX YEARS OF JAVANGLING, I PRESENT "
                    "TO YOU MY CAFFEINATED MASTERPIECE, A PRODUCT AS PERFECT AS A SYNCHRONIZED DANCE OF COFFEE BEANS.",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.brown,
    );
  }
}

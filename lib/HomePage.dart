import 'package:coffeeshop/Info.dart';
import 'package:coffeeshop/FirstPage.dart';
import 'package:flutter/material.dart';
import 'package:coffeeshop/Shop_page.dart';
import 'package:coffeeshop/CartPage.dart';
import 'package:coffeeshop/Black.dart';
import 'package:coffeeshop/Caramel.dart';
import 'package:coffeeshop/Mocha.dart';
import 'package:coffeeshop/Vanilla.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          'How do you like your Coffee?',
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
        foregroundColor: Colors.black,
      ),
      drawer: Drawer(
        backgroundColor: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ListTile(
              textColor: Colors.white70,
              hoverColor: Colors.brown,
              leading: Icon(Icons.home),
              title: Text('Home', textAlign: TextAlign.center),
              onTap: () {
                // Navigate to the FirstPage without animation
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => FirstPage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                    maintainState: false,
                  ),
                );
              },
            ),
            ListTile(
              textColor: Colors.white70,
              hoverColor: Colors.brown,
              leading: Icon(Icons.info),
              title: Text('Info', textAlign: TextAlign.center),
              onTap: () {
                // Navigate to the FirstPage without animation
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => Info(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return child;
                    },
                    maintainState: false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            ListItem(
              itemName: 'Black',
              subtitle: '3.5USD',
              imagePath: 'lib/images/black.jpeg',
            ),
            ListItem(
              itemName: 'Caramel',
              subtitle: '4USD',
              imagePath: 'lib/images/caramel.jpeg',
            ),
            ListItem(
              itemName: 'Mocha',
              subtitle: '4USD',
              imagePath: 'lib/images/mocha.jpeg',
            ),
            ListItem(
              itemName: 'Vanilla',
              subtitle: '4USD',
              imagePath: 'lib/images/vanilla.jpeg',
            ),
            // Add more items as needed
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to the Shop_page without animation
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => Shop_page(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return child;
                  },
                  maintainState: false,
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
            label: Text('Shop'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white70,
              foregroundColor: Colors.black,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
          SizedBox(width: 16.0), // Add spacing between buttons
          ElevatedButton.icon(
            onPressed: () {
              // Navigate to the Cart_page without animation
              Navigator.pushReplacement(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) => CartPage(),
                  transitionsBuilder: (context, animation, secondaryAnimation, child) {
                    return child;
                  },
                  maintainState: false,
                ),
              );
            },
            icon: Icon(Icons.shopping_basket),
            label: Text('Cart'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white70,
              foregroundColor: Colors.black,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
class ListItem extends StatelessWidget {
  final String itemName;
  final String imagePath;
  final String subtitle;

  ListItem({required this.itemName, required this.imagePath, required this.subtitle});

  void _navigateToPage(BuildContext context) {
    switch (itemName) {
      case 'Black':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Black()),
        );
        break;
      case 'Caramel':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Caramel()),
        );
        break;
      case 'Mocha':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Mocha()),
        );
        break;
      case 'Vanilla':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Vanilla()),
        );
        break;
      default:
      // Handle other cases or show an error message
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0.0), // Set the border radius
      ),
      child: Card(
        color: Colors.white70, // Change the background color here
        child: Container(
          height: 100, // Adjust the height as needed
          child: ListTile(
            title: Text(itemName, style: TextStyle(color: Colors.black)), // Set text color
            subtitle: Text(subtitle, style: TextStyle(color: Colors.black)), // Set text color
            contentPadding: EdgeInsets.all(9.0), // Add content padding
            leading: Container(
              height: 100, // Set the height to the same value as the ListTile height
              width: 60, // Adjust the width as needed
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover, // Adjust the BoxFit as needed
                ),
              ),
            ),
            trailing: GestureDetector(
              onTap: () {
                _navigateToPage(context);
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20.0), // Adjust the right padding as needed
                child: Icon(Icons.arrow_forward), // Add the arrow icon here
              ),
            ),
          ),
        ),
      ),
    );
  }
}
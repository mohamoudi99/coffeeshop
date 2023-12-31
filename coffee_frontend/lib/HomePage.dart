// ignore_for_file: library_private_types_in_public_api, unused_element

import 'package:coffee_frontend/Info.dart';
import 'package:coffee_frontend/FirstPage.dart';
import 'package:coffee_frontend/app_state.dart';
import 'package:flutter/material.dart';
import 'package:coffee_frontend/CartPage.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  void _showCartModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        AppState appState = Provider.of<AppState>(context);

        // Build your cart information here
        // You can use appState.totalItemCount and other information from the app state
        return Column(
          children: [
            // Add your cart information widgets here
            Text('Total Items: ${appState.totalItemCount}'),
            // ...
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Close the modal
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: const Text(
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
              leading: const Icon(Icons.home),
              title: const Text('Home', textAlign: TextAlign.center),
              onTap: () {
                // Navigate to the FirstPage without animation
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const FirstPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
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
              leading: const Icon(Icons.info),
              title: const Text('Info', textAlign: TextAlign.center),
              onTap: () {
                // Navigate to the FirstPage without animation
                Navigator.pushReplacement(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const Info(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
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
          children: const [
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
          const SizedBox(width: 16.0), // Add spacing between buttons
          ElevatedButton.icon(
            onPressed: () {
              _showCartModal(context);
            },
            icon: const Icon(Icons.shopping_basket),
            label: Text(
                'Cart ${appState.totalItemCount > 0 ? '(${appState.totalItemCount})' : ''}'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(150, 60),
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

class ListItem extends StatefulWidget {
  final String itemName;
  final String imagePath;
  final String subtitle;

  const ListItem({
    Key? key,
    required this.itemName,
    required this.imagePath,
    required this.subtitle,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  int itemCount = 0;

  void _increaseAmount() {
    setState(() {
      itemCount++;
      Provider.of<AppState>(context, listen: false).updateCart(widget.itemName);
    });
  }

  void _decreaseAmount() {
    setState(() {
      if (itemCount > 0) {
        itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Card(
        color: Colors.white70,
        child: SizedBox(
          height: 90,
          child: ListTile(
            title: Text(
              widget.itemName,
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              widget.subtitle,
              style: const TextStyle(color: Colors.black),
            ),
            contentPadding: const EdgeInsets.all(9.0),
            leading: Container(
              height: 100,
              width: 60,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(widget.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _decreaseAmount,
                  child: const Padding(
                    padding: EdgeInsets.only(right: 8.0),
                    child: Icon(Icons.remove),
                  ),
                ),
                Text(
                  '$itemCount',
                  style: const TextStyle(fontSize: 18),
                ),
                GestureDetector(
                  onTap: _increaseAmount,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.add),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

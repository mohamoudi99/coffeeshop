// ignore_for_file: library_private_types_in_public_api, unused_element, deprecated_member_use, dead_code

import 'package:coffee_frontend/Info.dart';
import 'package:coffee_frontend/FirstPage.dart';
import 'package:coffee_frontend/app_state.dart';
import 'package:coffee_frontend/orderForm.dart';
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
  bool showOrderForm = false;

  void _showCartModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        AppState appState = Provider.of<AppState>(context);
        // Build your cart information here
        // You can use appState.totalItemCount and other information from the app state
        //if items.totalAmount==0 then show empty cart
        if (appState.totalItemCount == 0) {
          return Container(
            color: Colors.brown, // Set the background color to brown
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shopping_cart,
                    size: 100, // Adjust the size of the icon
                    color: Colors.white,
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Your cart is empty',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the modal
                    },
                    style: ElevatedButton.styleFrom(
                      primary:
                          Colors.white70, // Set the background color to white
                      onPrimary: Colors.black, // Set the text color to brown
                    ),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          );
        }

        List<Widget> itemTiles = [];

        for (var item in appState.items.entries) {
          if (item.value.amount > 0) {
            itemTiles.add(ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(item.key, style: const TextStyle(color: Colors.white)),
                  Text('\$${item.value.total}',
                      style: const TextStyle(color: Colors.white))
                ],
              ),
              subtitle: Text('Amount: ${item.value.amount}',
                  style: const TextStyle(color: Colors.white)),
            ));
          }
        }

        return Container(
          color: Colors.brown, // Set the background color to brown
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Use a ListView.builder for better performance
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: itemTiles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return itemTiles[index];
                    },
                  ),
                ),
                Text(
                  'Total Items: ${appState.totalItemCount}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16),
                Text(
                  'Total Price: \$${appState.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16),
                //if (showOrderForm) const OrderForm(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context); // Close the modal
                      },
                      style: ElevatedButton.styleFrom(
                        primary:
                            Colors.white70, // Set the background color to white
                        onPrimary: Colors.black, // Set the text color to brown
                      ),
                      child: const Text('Close'),
                    ),
                    if (appState.totalItemCount > 0)
                      ElevatedButton(
                        onPressed: () {
                          // Toggle the state to show/hide the order form
                          Navigator.pop(context); // Close the modal
                          _showOrderFormModal(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors
                              .white70, // Set the background color to white
                          onPrimary:
                              Colors.black, // Set the text color to brown
                        ),
                        child: const Text('Order'),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showOrderFormModal(BuildContext context) {
    // Show the order form modal
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return OrderForm(onOrderSubmitted: () {
          // Handle the order submission logic here
          // Close the modal after order is submitted
          Navigator.pop(context);
        });
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

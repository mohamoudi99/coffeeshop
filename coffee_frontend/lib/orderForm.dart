// ignore_for_file: must_be_immutable, library_private_types_in_public_api, deprecated_member_use

import 'dart:ui';
import 'package:flutter/material.dart';

class OrderForm extends StatefulWidget {
  final Function(String name, String address, String floor) onOrderSubmitted;
  bool _isNotValidate = false;

  OrderForm({Key? key, required this.onOrderSubmitted}) : super(key: key);

  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController floorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.brown,
      padding: const EdgeInsets.all(16.0),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.2),
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Enter Your Details',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: 'phone number',
                  controller: phoneController,
                  //make the primary color as white
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: 'Address',
                  controller: addressController,
                ),
                const SizedBox(height: 16),
                _buildInputField(
                  label: 'Floor',
                  controller: floorController,
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary:
                        Colors.white70, // Set the background color to white
                    onPrimary: Colors.black, // Set the text color to brown
                  ),
                  onPressed: () {
                    // Check the validation condition here
                    if (validateForm()) {
                      // Call the callback when the order is submitted
                      widget.onOrderSubmitted(
                        phoneController.text,
                        addressController.text,
                        floorController.text,
                      );
                    } else {
                      // Set the not valid state
                      setState(() {
                        widget._isNotValidate = true;
                      });
                    }
                  },
                  child: Text(
                    'Submit Order',
                    style: TextStyle(
                      color: widget._isNotValidate
                          ? Colors
                              .red // Change text color to red when not valid
                          : Colors.black, // Set the text color to brown
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
  }) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: Colors.white, // Set label text color to white
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: Colors.white), // Set border color when focused
          borderRadius: BorderRadius.circular(10.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: widget._isNotValidate
                  ? Colors.red // Change border color to red when not valid
                  : Colors.black
                      .withOpacity(0.5)), // Set border color when not focused
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  bool validateForm() {
    // Implement your validation logic here
    // For example, you can check if the required fields are not empty
    return phoneController.text.isNotEmpty &&
            addressController.text.isNotEmpty &&
            floorController.text.isNotEmpty
        //also check if the phone number is 10 digits and a number
        ;
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    phoneController.dispose();
    addressController.dispose();
    floorController.dispose();
    super.dispose();
  }
}

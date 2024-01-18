import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // this is the cart screen where we will display the items inside the cart

      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,

          ),
          child: Center(child: Text("Your Cart is Empty")),
        ),
      ),
    );
  }
}

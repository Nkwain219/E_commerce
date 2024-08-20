import 'package:e_commerce/resources.dart';
import 'package:flutter/material.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back),
      ),
    ),
    body: const AddCart(),
    );
  }
}


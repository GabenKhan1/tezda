import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_tezda_commerce_app/screens/cart/cart_controller.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Cart Data will show here"),
    ));
  }
}

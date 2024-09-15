import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              // Navigator.pop(context);
              Get.back();
              },
            child: Text("Back"),
          )
        ],
      ),
    );
  }
}

import 'package:eccommerce/controllers/home/home_controller.dart';
import 'package:eccommerce/views/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeController homeControl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          // simple statemanagement
          // GetBuilder<HomeController>(
          //   builder: (context) {
          //     return Center(
          //       child: Text(
          //         "${homeControl.countVal}",
          //         style: TextStyle(fontSize: 30),
          //       ),
          //     );
          //   }
          // ),
          // Reactive Statement
          Center(
        // child: Obx(()=>
        //   Text(
        //     "${homeControl.countVal}",
        //     style: TextStyle(fontSize: 30),
        //   ),
        // ),
        child: GetX<HomeController>(builder: (contexat) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${homeControl.countVal}",
                style: TextStyle(fontSize: 30),
              ),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => CartView()));
                    // Get.to(CartView());
                    // Get.off(CartView());
                    Get.snackbar("title", "message",);
                    Get.defaultDialog(title: "message",);
                  },
                  child: Text("Navigate to Cart"))
            ],
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          homeControl.increment();
        },
        child: Text("+"),
      ),
    );
  }
}

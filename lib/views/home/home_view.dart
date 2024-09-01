import 'package:eccommerce/controllers/home/home_controller.dart';
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
        child: 
          GetX<HomeController>(
            builder: (context) {
              return Text(
                "${homeControl.countVal}",
                style: TextStyle(fontSize: 30),
              
                      );
            }
          ),
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

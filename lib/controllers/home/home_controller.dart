import 'package:get/get.dart';

class HomeController extends GetxController {
  // Simple Statemanagement
  // int countVal = 0;
  // increment() {
  //   countVal++;
  //   update();
  // }
RxInt countVal = 0.obs;
  increment() {
    countVal.value++;
  }
}

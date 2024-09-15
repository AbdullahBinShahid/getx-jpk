import 'dart:async';

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

  @override
  void onInit() {
    // TODO: implement onInit
    print("On INIT");
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
        print("On onReady");

    super.onReady();
  }
  @override
  void onClose() {
    // TODO: implement onClose
        print("On onClose");

    super.onClose();
  }

   static const maxSeconds = 60;
  var seconds = maxSeconds;
  Timer? timer;

  /// Start Timer
  void startTimer({bool rest = true}) {
    if (rest) {
      resetTimer();
      update();
    }
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds > 0) {
        seconds--;
        update();
      } else {
        stopTimer(rest: false);
        resetTimer();
      }
    });
  }

  /// Stop Timer
  void stopTimer({bool rest = true}) {
    if (rest) {
      resetTimer();
      update();
    }
    timer?.cancel();
    update();
  }

  /// Reset Timer
  void resetTimer() {
    seconds = maxSeconds;
    update();
  }

  /// is Timer Active?
  bool isTimerRuning() {
    return timer == null ? false : timer!.isActive;
  }

  /// is Timer Completed?
  bool isCompleted() {
    return seconds == maxSeconds || seconds == 0;
  }
}

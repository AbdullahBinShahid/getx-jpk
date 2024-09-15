import 'package:eccommerce/controllers/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  HomeController homeControl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(10),
        width: Get.width,
        height: Get.height,
        child: GetBuilder<HomeController>(
            init: HomeController(),
            builder: (context) {
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10.0,
                                offset: const Offset(5, 5),
                                color:
                                    const Color.fromARGB(109, 144, 144, 144)),
                            BoxShadow(
                                blurRadius: 10.0,
                                offset: const Offset(-5, -5),
                                color: const Color.fromARGB(255, 243, 243, 243))
                          ],
                        ),
                        width: 300,
                        height: 300,
                        child: Stack(fit: StackFit.expand, children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: CircularProgressIndicator(
                              strokeWidth: 12,
                              valueColor: AlwaysStoppedAnimation(
                                  homeControl.seconds == 60
                                      ? Colors.green
                                      : Colors.red),
                              backgroundColor:
                                  const Color.fromARGB(255, 237, 237, 237),
                              value: homeControl.seconds /
                                  HomeController.maxSeconds,
                            ),
                          ),
                          Center(
                            child: Text(
                              homeControl.seconds.toString(),
                              style: TextStyle(
                                fontSize: 100,
                                fontWeight: FontWeight.bold,
                                color: homeControl.isCompleted()
                                    ? const Color.fromARGB(255, 8, 123, 12)
                                    : const Color.fromARGB(255, 178, 14, 2),
                              ),
                            ),
                          )
                        ])),
                    const SizedBox(
                      height: 50,
                    ),

                    /// Buttons
                    homeControl.isTimerRuning() || !homeControl.isCompleted()
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              ButtonWidget(
                                  onTap: () {
                                    homeControl.isTimerRuning()
                                        ? homeControl.stopTimer(rest: false)
                                        : homeControl.startTimer(rest: false);
                                  },
                                  text: homeControl.isTimerRuning()
                                      ? "Pause"
                                      : "Resume",
                                  color: homeControl.isTimerRuning()
                                      ? Colors.red
                                      : Colors.green,
                                  fontWeight: FontWeight.w400),
                              ButtonWidget(
                                  onTap: () {
                                    homeControl.stopTimer(rest: true);
                                  },
                                  text: "Cancel",
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600)
                            ],
                          )
                        : ButtonWidget(
                            onTap: () {
                              homeControl.startTimer();
                            },
                            text: "Start",
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                  ]);
            }),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onTap,
    required this.color,
    required this.fontWeight,
  }) : super(key: key);
  final String text;
  final Color color;
  final VoidCallback onTap;
  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Get.width / 5,
        height: Get.height / 14,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  blurRadius: 10.0,
                  offset: const Offset(5, 5),
                  color: const Color.fromARGB(109, 144, 144, 144)),
              BoxShadow(
                  blurRadius: 10.0,
                  offset: const Offset(-5, -5),
                  color: const Color.fromARGB(255, 243, 243, 243))
            ],
            borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 19,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}

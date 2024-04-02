import 'package:firebase_login/on_boarding/pages/onboard_one.dart';
import 'package:firebase_login/on_boarding/pages/onboard_three.dart';
import 'package:firebase_login/on_boarding/pages/onboard_two.dart';
import 'package:firebase_login/user_account/medico_login.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MedicoOnboardHome extends StatefulWidget {
  const MedicoOnboardHome({super.key});

  @override
  State<MedicoOnboardHome> createState() => _MedicoOnboardHomeState();
}

class _MedicoOnboardHomeState extends State<MedicoOnboardHome> {
  // page view controller
  PageController controller = PageController();

  // page state
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // page view
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                lastPage = (index == 2);
                // lastpage = (0==2)
                // lastpage = (1==2)
                // lastpage = (2==2)
                // lastpage = true
              });
            },
            children: const [
              OnboardOne(),
              OnboardTwo(),
              OnboardThree(),
            ],
          ),

          // smooth page indicator
          Align(
            alignment: const Alignment(0, 0.59),
            child: SmoothPageIndicator(
              controller: controller,
              count: 3,
              effect: const WormEffect(
                dotHeight: 8,
                dotWidth: 8,
              ),
            ),
          ),

          // pages
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Align(
              alignment: const Alignment(0, 0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // skip page
                  GestureDetector(
                    onTap: () {
                      controller.jumpToPage(2);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // next page
                  lastPage
                      ? GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (ctx) => const MedicoLoginScreen(),
                              ),
                            );
                          },
                          child: Container(
                            height: 55,
                            width: 125,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(80, 128, 200, 1),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Done",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.check_circle_outline,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                      : GestureDetector(
                          onTap: () {
                            controller.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Container(
                            height: 55,
                            width: 125,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(80, 128, 200, 1),
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Next",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Icon(
                                  Icons.arrow_circle_right_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

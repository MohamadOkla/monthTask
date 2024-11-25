import 'package:flutter/material.dart';
import 'package:monthtask/constant/constant.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:monthtask/screens/home_screen/home_screen.dart';

// ignore: must_be_immutable
class PageThreeScreen extends StatelessWidget {
  double wi = 240;
  PageThreeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 350,
          height: 450,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25), topRight: Radius.circular(25)),
            gradient: LinearGradient(
              colors: [AppColors.mainColor, AppColors.orangeColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(4, 8),
                blurRadius: 10,
              ),
            ],
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  width: MediaQuery.sizeOf(context).width,
                  child: Center(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        FadeAnimatedText(
                          'Simple and Easy to Use',
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                        FadeAnimatedText(
                          'Designed for a fun and comfortable user experience',
                          textAlign: TextAlign.center,
                          textStyle: const TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                color: Colors.black45,
                                offset: Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          duration: const Duration(seconds: 2),
                        ),
                      ],
                      repeatForever: true, // يجعل النص يعيد التأثير باستمرار
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                AnimatedContainer(
                  width: wi,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.linear,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.mainColor,
                      foregroundColor: AppColors.orangeColor,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 20),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                    },
                    child: const Text(
                      'Let’s Start',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

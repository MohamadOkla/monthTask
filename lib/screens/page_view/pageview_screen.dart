import 'package:flutter/material.dart';
import 'package:monthtask/constant/constant.dart';
import 'package:monthtask/screens/page_view/page_one.dart';
import 'package:monthtask/screens/page_view/page_three.dart';
import 'package:monthtask/screens/page_view/page_two.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [AppColors.mainColor, AppColors.orangeColor],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: SizedBox(
                  width: 350,
                  height: 450,
                  child: PageView(
                    onPageChanged: (int index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    children: [
                      const PageOneScreen(),
                      const PageTwoScreen(),
                      PageThreeScreen(),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    width: _currentPage == index ? 16 : 10,
                    height: _currentPage == index ? 16 : 10,
                    decoration: BoxDecoration(
                      color: _currentPage == index
                          ? AppColors.orangeColor
                          : Colors.white.withOpacity(0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

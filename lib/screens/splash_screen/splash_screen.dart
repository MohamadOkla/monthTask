import 'package:flutter/material.dart';
import 'package:monthtask/screens/page_view/pageview_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const PageViewScreen(),
          ));
    });
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              'assets/sp.jpg',
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}

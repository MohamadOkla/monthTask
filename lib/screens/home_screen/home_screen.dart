import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'time_selector.dart';
import 'date_selector.dart';
import 'slider_screen.dart';
import 'range_slider_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  void _selectTime() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TimeSelector(),
      ),
    );
  }

  void _selectDate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DateSelector(),
      ),
    );
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  void _goToSliderScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SliderScreen(),
      ),
    );
  }

  void _goToRangeSliderScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RangeSliderScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            floating: true,
            pinned: true,
            backgroundColor: Colors.black,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Life Organizer",
                  style: TextStyle(color: Color(0xffFF9800))),
              background:
                  Image.asset('assets/sliver_appbar.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'أهلاً بك في تطبيق Life Organizer!',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'هنا يمكنك إدارة وقتك وتنظيم حياتك بسهولة.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'يمكنك اختيار الوقت والتاريخ، إضافة صور، واستخدام بعض الأدوات مثل الـ Slider و RangeSlider.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(30.0),
                  child: Text(
                    'كل شيء تحت سيطرتك لتنظيم حياتك بشكل أفضل.',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                if (_imageFile != null)
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.file(
                      File(_imageFile!.path),
                      fit: BoxFit.cover,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "addImage",
            child: const Icon(Icons.image),
            backgroundColor: Colors.orange,
            onPressed: _pickImage,
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "selectTime",
            child: const Icon(Icons.access_time),
            backgroundColor: Colors.orange,
            onPressed: _selectTime,
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "selectDate",
            child: const Icon(Icons.calendar_today),
            backgroundColor: Colors.orange,
            onPressed: _selectDate,
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "goToSliderScreen",
            child: const Icon(Icons.tune),
            backgroundColor: Colors.orange,
            onPressed: _goToSliderScreen,
          ),
          SizedBox(height: 20),
          FloatingActionButton(
            heroTag: "goToRangeSliderScreen",
            child: const Icon(Icons.filter_1),
            backgroundColor: Colors.orange,
            onPressed: _goToRangeSliderScreen,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

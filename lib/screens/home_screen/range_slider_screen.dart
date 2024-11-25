import 'package:flutter/material.dart';

class RangeSliderScreen extends StatefulWidget {
  const RangeSliderScreen({super.key});

  @override
  _RangeSliderScreenState createState() => _RangeSliderScreenState();
}

class _RangeSliderScreenState extends State<RangeSliderScreen> {
  RangeValues _rangeValues = const RangeValues(20.0, 80.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Between : ${_rangeValues.start.toStringAsFixed(1)} and ${_rangeValues.end.toStringAsFixed(1)}',
              style: const TextStyle(fontSize: 24),
            ),
            RangeSlider(
              values: _rangeValues,
              min: 0.0,
              max: 100.0,
              divisions: 100,
              labels: RangeLabels(
                _rangeValues.start.toStringAsFixed(1),
                _rangeValues.end.toStringAsFixed(1),
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _rangeValues = values;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

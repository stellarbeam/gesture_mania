import 'package:flutter/material.dart';
import 'package:gesture_mania/widgets/controls.dart';
import 'package:gesture_mania/widgets/counter_label.dart';
import 'package:gesture_mania/widgets/transluscent_image.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _imageOpacityValue = 1.0;
  bool _enableIncrement = true;
  int _counterValue = 0;

  Color _getColourFromCount(value) {
    if (value == 0) return Colors.white;
    if (value > 0)
      return Colors.green;
    else
      return Colors.red;
  }

  void _incrementCount() {
    setState(() {
      _counterValue++;
    });
  }

  void _decrementCount() {
    setState(() {
      _counterValue--;
    });
  }

  void _toggleEnableIncrement(bool newValue) {
    setState(() {
      _enableIncrement = newValue;
    });
  }

  void _setImageOpacity(double newValue) {
    setState(() {
      _imageOpacityValue = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gesture Mania"),
      ),
      body: GestureDetector(
        onTap: _decrementCount,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: _getColourFromCount(_counterValue),
          child: _buildMainView(),
        ),
      ),
    );
  }

  Widget _buildMainView() {
    Widget controls = Controls(
      _enableIncrement,
      _incrementCount,
      _toggleEnableIncrement,
      _imageOpacityValue,
      _setImageOpacity,
    );

    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Column(
            children: [
              Expanded(
                flex: 3,
                child: TransluscentImage(_imageOpacityValue),
              ),
              Expanded(
                child: CounterLabel(_counterValue),
              ),
              Expanded(
                child: controls,
              ),
              SizedBox(height: 20),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: TransluscentImage(_imageOpacityValue),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(child: CounterLabel(_counterValue)),
                    Expanded(child: controls),
                  ],
                ),
              ),
            ],
          );
  }
}

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
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

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("Firebase initialized.");
      setState(() {});
    });
  }

  Color _getColourFromCount(value) {
    if (value == 0) return Colors.white;
    if (value > 0)
      return Colors.green;
    else
      return Colors.red;
  }

  void _incrementCount() async {
    setState(() {
      _counterValue++;
    });
    await FirebaseAnalytics().logEvent(name: 'increment', parameters: null);
  }

  void _decrementCount(TapUpDetails details) async {
    setState(() {
      _counterValue--;
    });
    await FirebaseAnalytics().logEvent(
      name: 'decrement',
      parameters: {
        'x': details.globalPosition.dx,
        'y': details.globalPosition.dy,
      },
    );
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
    // WARN: Force a crash when tring to change image opacity through slider
    FirebaseCrashlytics.instance.crash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTapUp: (details) => _decrementCount(details),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: _getColourFromCount(_counterValue),
          child: SafeArea(
            child: _buildMainView(),
          ),
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
                    Expanded(
                      child: CounterLabel(_counterValue),
                    ),
                    Expanded(
                      child: controls,
                    ),
                  ],
                ),
              ),
            ],
          );
  }
}

import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Mania"),
      ),
      body: GestureDetector(
        onTap: _decrementCount,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: _getColourFromCount(_counterValue),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: TransluscentImage(_imageOpacityValue),
              ),
              Expanded(
                flex: 1,
                child: CounterLabel(_counterValue),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                child: Text('Enable increment'),
                                onTap: () {},
                              ),
                              Switch(
                                value: _enableIncrement,
                                onChanged: (val) {
                                  setState(() {
                                    _enableIncrement = val;
                                  });
                                },
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: RaisedButton.icon(
                              onPressed:
                                  _enableIncrement ? _incrementCount : null,
                              icon: Icon(Icons.add),
                              label: Text("Increment"),
                              color: Theme.of(context).primaryColor,
                              textColor: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      Slider(
                        value: _imageOpacityValue,
                        onChanged: (newValue) {
                          setState(() {
                            _imageOpacityValue = newValue;
                          });
                        },
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

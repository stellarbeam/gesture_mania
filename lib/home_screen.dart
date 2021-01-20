import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _imageOpacityValue = 1.0;
  bool _enableIncrement = true;
  int _counterValue = -4;

  Color _getColourFromCount(value) {
    if (value == 0) return Colors.white;
    if (value > 0)
      return Colors.green;
    else
      return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gesture Mania"),
      ),
      body: Container(
        color: _getColourFromCount(_counterValue),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Center(
                child: Opacity(
                  opacity: _imageOpacityValue,
                  child: Image.network(
                    'https://cdn.pixabay.com/photo/2015/11/08/09/05/beach-1033294_1280.jpg',
                    width: 300,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(3),
                  child: Container(
                    height: 40,
                    color: Theme.of(context).primaryColor,
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,
                    ),
                    child: Text(
                      'Count: $_counterValue',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
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
                            Text('Enable increment'),
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
                        RaisedButton.icon(
                          onPressed: _enableIncrement
                              ? () {
                                  setState(() {
                                    _counterValue++;
                                  });
                                }
                              : null,
                          icon: Icon(Icons.add),
                          label: Text("Increment"),
                          color: Theme.of(context).primaryColor,
                          textColor: Colors.white,
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
    );
  }
}

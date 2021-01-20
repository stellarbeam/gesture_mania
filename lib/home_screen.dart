import 'package:flutter/material.dart';

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
        behavior: HitTestBehavior.deferToChild,
        onTap: _decrementCount,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          color: _getColourFromCount(_counterValue),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Opacity(
                    opacity: _imageOpacityValue,
                    child: GestureDetector(
                      child: Image.network(
                        'https://cdn.pixabay.com/photo/2015/11/08/09/05/beach-1033294_1280.jpg',
                        width: 300,
                      ),
                      onTap: () {},
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
                      child: GestureDetector(
                        child: Text(
                          'Count: $_counterValue',
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        onTap: () {},
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

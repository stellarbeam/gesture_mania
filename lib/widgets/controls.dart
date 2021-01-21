import 'package:flutter/material.dart';

class Controls extends StatelessWidget {
  Controls(
    this._enableIncrement,
    this._incrementCount,
    this._toggleEnableIncrement,
    this._imageOpacity,
    this._setImageOpacity,
  );

  final bool _enableIncrement;
  final Function _incrementCount;
  final Function _toggleEnableIncrement;

  final double _imageOpacity;
  final Function _setImageOpacity;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                    onChanged: _toggleEnableIncrement,
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {},
                child: RaisedButton.icon(
                  onPressed: _enableIncrement ? _incrementCount : null,
                  icon: Icon(Icons.add),
                  label: Text("Increment"),
                  color: Theme.of(context).primaryColor,
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
          Slider(
            value: _imageOpacity,
            onChanged: _setImageOpacity,
          )
        ],
      ),
    );
  }
}

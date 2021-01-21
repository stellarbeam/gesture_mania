import 'package:flutter/material.dart';

class CounterLabel extends StatelessWidget {
  CounterLabel(this._counterValue);

  final int _counterValue;

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}

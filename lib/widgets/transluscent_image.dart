import 'package:flutter/material.dart';

class TransluscentImage extends StatelessWidget {
  const TransluscentImage(this._imageOpacityValue);

  final double _imageOpacityValue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Opacity(
        opacity: _imageOpacityValue,
        child: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Image.asset(
              'assets/images/beach.jpg',
              fit: BoxFit.contain,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

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
            child: Image.network(
              'https://cdn.pixabay.com/photo/2015/11/08/09/05/beach-1033294_1280.jpg',
              fit: BoxFit.contain,
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ErroImage extends StatelessWidget {
  ErroImage({required this.height, required this.width, super.key});
  double width;
  double height;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://upload.wikimedia.org/wikipedia/commons/1/14/No_Image_Available.jpg?20200913095930',
      width: width,
      height: height,
    );
  }
}

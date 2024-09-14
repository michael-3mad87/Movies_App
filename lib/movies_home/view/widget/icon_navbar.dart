import 'package:flutter/material.dart';

class IconNavbar extends StatelessWidget {
  const IconNavbar(this.image, {super.key});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ImageIcon(AssetImage(image));
  }
}

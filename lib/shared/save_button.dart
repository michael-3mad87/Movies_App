import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';

class SavedButton extends StatefulWidget {
  const SavedButton({super.key});

  @override
  State<SavedButton> createState() => _SavedButtonState();
}

class _SavedButtonState extends State<SavedButton> {
  bool isClicked = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        isClicked = !isClicked;
        setState(() {});
      },
      child: Stack(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Icon(
                Icons.bookmark,
                color: isClicked
                    ? AppTheme.bookMarkColor
                    : AppTheme.darkGrey.withOpacity(.75),
                size: MediaQuery.of(context).size.width / 9,
              ),
              Icon(
                isClicked ? Icons.check : Icons.add,
                color: AppTheme.white,
                size: MediaQuery.of(context).size.width / 17,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

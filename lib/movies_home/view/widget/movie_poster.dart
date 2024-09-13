import 'package:flutter/material.dart';
import 'package:movies_app/shared/app_theme.dart';

class SavedButton extends StatelessWidget {
  const SavedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Stack(
        children: [
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Icon(
                Icons.bookmark,
                color: Colors.grey.withOpacity(0.8),
                size: 32,
              ),
              Icon(
                Icons.add,
                color: AppTheme.white,
                size: 20,
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}

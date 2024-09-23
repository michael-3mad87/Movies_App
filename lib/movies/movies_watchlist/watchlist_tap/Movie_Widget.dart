import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'Movie.dart';

class MovieWidgetItem extends StatefulWidget {
  String id;
   MovieWidgetItem({super.key, required this.id});

  @override
  State<MovieWidgetItem> createState() => _MovieWidgetItemState();
}

class _MovieWidgetItemState extends State<MovieWidgetItem> {
  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width:
                  MediaQuery.of(context).size.width * 0.5, // Adjusted width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            bottom: 8.0), // Adjust the space as needed
                        child: Text(
                          widget.id ?? "",
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}
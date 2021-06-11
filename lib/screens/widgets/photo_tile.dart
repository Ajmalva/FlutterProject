import 'package:flutter/material.dart';

class photoTile extends StatelessWidget {
  final String url;

  photoTile({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          url,
        fit: BoxFit.cover,
      ),
    );
  }
}

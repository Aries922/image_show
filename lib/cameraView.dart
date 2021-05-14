import 'dart:io';

import 'package:flutter/material.dart';

class CameraViewPage extends StatelessWidget {

  final String imagePath;

  const CameraViewPage({Key key, this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.file(File(imagePath)),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:gallary2/constants/styles.dart';

class OfflinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        
        child: Center(
            child: Text(
          "helo",
          style: appNameSType(),
        )),
      ),
    );
  }
}

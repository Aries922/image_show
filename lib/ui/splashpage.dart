// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gallary2/constants/styles.dart';
import 'package:gallary2/pages/homepage.dart';
import 'package:permission_handler/permission_handler.dart';

class SplashPage extends StatelessWidget {
  getPermission() async {
    PermissionStatus status = await Permission.camera.status;
    print(status);
    if (status == PermissionStatus.granted) return;

    await Permission.camera.request();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5)).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
          (context) => false);
    });
    getPermission();
    return Scaffold(
      body: Container(
        child: Center(
            child: Text(
          "Images",
          style: appNameSType(),
        )),
      ),
      backgroundColor: Colors.blue,
    );
  }
}

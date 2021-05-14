import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:gallary2/constants/styles.dart';
import 'package:gallary2/pages/camera.dart';
import 'package:gallary2/pages/onlinepage.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

PickedFile _image;
final picker = ImagePicker();

getImage() async {
  var pickedFile = await picker.getImage(source: ImageSource.gallery);

  setState(() {
    pickedFile = _image;
  });
}

void setState(Null Function() param0) {}

getCamera() async {
  var pickedFile = await picker.getImage(source: ImageSource.camera);

  setState(() {
    pickedFile = _image;
  });
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Void> _showChoiceDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text("Make Your Choice"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    GestureDetector(
                      child: Text("Gallery"),
                      onTap: () {
                        getImage();
                      },
                    ),
                    Padding(padding: EdgeInsets.all(8.0)),
                    GestureDetector(
                      child: Text("Camera"),
                      onTap: () {
                        getCamera();
                      },
                    )
                  ],
                ),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: "online"),
                Tab(
                  icon: Icon(Icons.camera_alt),
                ),
              ],
            ),
            title: Text("ImagesShowing", style: appNameSType()),
          ),
          body: TabBarView(
            children: [
              OnlinePage(),
              Camera(),
            ],
          )),
    );
  }
}

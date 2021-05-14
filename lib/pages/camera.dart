import 'package:flutter/material.dart';
import 'package:gallary2/cameraView.dart';
import 'package:image_picker/image_picker.dart';
import 'package:camera/camera.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

List<CameraDescription> cameras;

class Camera extends StatefulWidget {
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  CameraController _cameraController;
  Future<void> cameraValue;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[1], ResolutionPreset.medium);
    cameraValue = _cameraController.initialize();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Stack(
      children: [
        FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }),
        Positioned(
          bottom: 0.0,
          child: Container(
            padding: EdgeInsets.only(top: 5, bottom: 5),
            color: Colors.black,
            height: 100,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          icon: Icon(Icons.flash_off,
                              color: Colors.white, size: 28),
                          onPressed: () {}),
                      InkWell(
                          onTap: ()=>takePhoto(context),
                          child: Icon(Icons.panorama_fish_eye,
                              color: Colors.white, size: 70)),
                      IconButton(
                          icon: Icon(Icons.flip_camera_ios,
                              color: Colors.white, size: 28),
                          onPressed: () {}),
                    ]),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "Hold for Video, Tap for photo",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
  void takePhoto(BuildContext context) async{
// final path = join((await getTemporaryDirectory()).path);
    final image =await _cameraController.takePicture();

    
        Navigator.push(context, MaterialPageRoute(builder: (builder)=>CameraViewPage(
          imagePath: image?.path,
    )));
  }
}



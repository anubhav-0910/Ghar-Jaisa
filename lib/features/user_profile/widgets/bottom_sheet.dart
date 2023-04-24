import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

late File imageFile;

class BottomShhetWidget extends StatefulWidget {
  @override
  _BottomShhetWidgetState createState() => _BottomShhetWidgetState();
}

class _BottomShhetWidgetState extends State<BottomShhetWidget> {
  void takePhotoByCamera() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = image as File;
    });
  }

  void takePhotoByGallery() async {
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image as File;
    });
  }

  void removePhoto() {
    setState(() {
      imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 250.0,
      margin: const EdgeInsets.only(left: 30.0, top: 25.0),
      child: Column(
        children: <Widget>[
          const Text(
            "Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 20.0, top: 20.0),
            child: Row(
              children: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.camera),
                  onPressed: takePhotoByCamera,
                  label: const Text("Camera"),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 20.0),
                ),
                TextButton.icon(
                  icon: const Icon(Icons.image),
                  onPressed: takePhotoByGallery,
                  label: const Text("Gallery"),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(right: 40.0, top: 10.0),
            child: Row(
              children: <Widget>[
                TextButton.icon(
                  icon: const Icon(Icons.delete),
                  onPressed: removePhoto,
                  label: const Text("Remove"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePicke extends StatefulWidget {
  ImagePicke({Key? key}) : super(key: key);

  @override
  State<ImagePicke> createState() => _ImagePickeState();
}

class _ImagePickeState extends State<ImagePicke> {
  var imagePath = ''.obs;
  getImagePath() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.camera, maxWidth: 600, maxHeight: 600);
    imagePath.value = image.path;
  }

  getImagePathGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    imagePath.value = image.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Obx(() => imagePath != ''
            ? Image.file(File(imagePath.value))
            : Container(
                child: Center(
                  child: Text(
                    "请传入照片",
                  ),
                ),
                constraints: const BoxConstraints(maxHeight: 600),
                height: 600,
              )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: getImagePathGallery, child: Text("从相册中选择")),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        ElevatedButton(onPressed: getImagePath, child: Text("相机拍摄")),
        ElevatedButton(onPressed: () {}, child: Text("剪裁")),
      ]),
    );
  }
}

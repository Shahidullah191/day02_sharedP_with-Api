import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_3/controller/image_picker_controller.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({Key? key}) : super(key: key);

  @override
  State<ImagePickerExample> createState() => _ImagePickerExampleState();
}

class _ImagePickerExampleState extends State<ImagePickerExample> {

  ImagePickerController controller =Get.put(ImagePickerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),

      body: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: controller.imagePathCamera.isNotEmpty ?
                    FileImage(File(controller.imagePathCamera.toString())) : null
              ),
            ),

            ElevatedButton(onPressed: () {
              controller.getImageFromCamera();
            }, child: Text("Pick Image from Camera")),

            Center(
              child: CircleAvatar(
                  radius: 50,
                  backgroundImage: controller.imagePathGallery.isNotEmpty ?
                  FileImage(File(controller.imagePathGallery.toString())) : null
              ),
            ),

            ElevatedButton(onPressed: () {
              controller.getImageFromGallery();
            }, child: Text("Pick Image From Gallery"))
          ],
        );
      }),
    );
  }
}

//DISEASE DETECTION PAGE

// ignore_for_file: camel_case_types

import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';

class Scan extends StatefulWidget {
  const Scan({Key? key}) : super(key: key);

  @override
  State<Scan> createState() => _ScanState();
}

File? _image, _croppedFile;
// ignore: prefer_typing_uninitialized_variables
var cropim;
int cropcheck = 0;
String message = "";

class _ScanState extends State<Scan> {
  ///static Future<File> Function(File file) cropImage
  // Function to get image from the camera
  Future<void> _getImageFromCamera() async {
    cropcheck = 0;
    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    //XFile? file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    setState(() {
      _image = File(image.path);
      print("${_image?.path}");
    });
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Cropwindow()),
    );
  }

  Future<void> _cropImage() async {
    print("croping");
    try {
      if (_image != null) {
        print("crop_intiated");
        cropim = await ImageCropper().cropImage(
            sourcePath: _image!.path,
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 100,
            uiSettings: [
              AndroidUiSettings(
                toolbarTitle: 'Cropper',
                toolbarColor: Colors.deepOrange,
                // toolbarWidgetColor: Colors.white,
                // initAspectRatio: CropAspectRatioPreset.original,
                //lockAspectRatio: false
              ),
            ]);
        if (cropim != null) {
          setState(() {
            _croppedFile = File(cropim.path);
            _image = File(cropim.path);
            cropcheck = 1;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  // Function to get image from the gallery
  Future<void> _getImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    cropcheck = 0;
    if (image == null) return;

    setState(() {
      _image = File(image.path);
    });
    // ignore: use_build_context_synchronously
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Cropwindow()),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                height: 40,
              ),
              Row(children: [
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(left: 10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 85, 139, 47),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              const Align(
                child: Text(
                  "Crop Disease Analysis",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Align(
                child: Text(
                  "Scan your crop for diseases",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w300),
                ),
              ),
              Container(
                width: size.width * .8,
                //height: size.height * .8,
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/plantscan.png',
                        height: 300,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  /*  GestureDetector(
                    onTap: _getImageFromCamera,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 85, 139, 47),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),*/
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 85, 139, 47),
                      ),
                      onPressed: _getImageFromCamera,
                      icon: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                      label: const Text("Take a picture")),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 85, 139, 47),
                      ),
                      onPressed: _getImageFromGallery,
                      icon: const Icon(
                        Icons.photo_library,
                        color: Colors.white,
                      ),
                      label: const Text("Browse a file")),
                  /*GestureDetector(
                    onTap: _getImageFromGallery,
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: const Color.fromARGB(255, 85, 139, 47),
                      ),
                      child: const Icon(
                        Icons.photo_library,
                        color: Colors.white,
                      ),
                    ),
                  )*/
                ],
              )
            ]),
      ),
    );
  }
}

class Cropwindow extends StatefulWidget {
  const Cropwindow({super.key});

  @override
  State<Cropwindow> createState() => _cropwindowState();
}

Reference referenceRoot = FirebaseStorage.instance.ref();
Reference referencedirimage = referenceRoot.child('images');
// ignore: non_constant_identifier_names
Reference referenceimage_up = referencedirimage.child('imagename');
// ignore: non_constant_identifier_names
String image_url = '';

class _cropwindowState extends State<Cropwindow> {
  Future<void> onUploadImage() async {
    print("process_triggered");
    //File imagefile = _croppedFile; //convert to bytes
    String url =
        "http://ec2-13-233-200-28.ap-south-1.compute.amazonaws.com:8080/disease?f=";
    Uint8List imagebytes = await _croppedFile!.readAsBytes();
    String base64string =
        base64.encode(imagebytes); //convert bytes to base64 string

    String parsedData = Uri.encodeComponent(base64string);
    url = url + parsedData;
    print(url);
    http.Response response = await http.get(Uri.parse(url));
    String result = response.body;
    print(result);
    //print(response.body);
    /// return response.body;
  }

  /* Future<void> upimage() async {
    try {
      await referenceimage_up.putFile(File(_image!.path));
      image_url = await referenceimage_up.getDownloadURL();
    } catch (e) {
      print(e);
    }
  }*/

  Future<void> cropImage() async {
    print("croping");
    try {
      if (_image != null) {
        print("crop_intiated");
        var Cropped = await ImageCropper().cropImage(
            sourcePath: _image!.path,
            compressFormat: ImageCompressFormat.jpg,
            compressQuality: 100,
            uiSettings: [
              AndroidUiSettings(
                  toolbarTitle: 'Cropper',
                  // toolbarColor: Colors.deepOrange,
                  // toolbarWidgetColor: Colors.white,
                  initAspectRatio: CropAspectRatioPreset.square,
                  lockAspectRatio: true),
            ]);
        if (Cropped != null) {
          setState(() {
            _croppedFile = File(Cropped.path);
            _image = File(Cropped.path);
            cropcheck = 1;
          });
        }
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 85, 139, 47),
          title: const Text("Crop image")),
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
          backgroundColor: const Color.fromARGB(255, 85, 139, 47),
          onPressed: cropImage,
          tooltip: 'Crop_image',
          child: const Icon(Icons.crop),
        ),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 85, 139, 47),
          ),
          onPressed: () {
            if (cropcheck == 1) {
              //upimage();
              onUploadImage();
            } else {
              print("crop check_activated $cropcheck");
              final snackBar = SnackBar(
                content: const Text('Crop photo'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    // Some code to undo the change.
                  },
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          icon: const Icon(Icons.upload_file),
          label: const Text("Process image"),
        )
      ]),
    );
  }
}

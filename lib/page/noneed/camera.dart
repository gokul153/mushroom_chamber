import 'dart:io';
//import 'package:b_green/page/moisturecontrol.dart';
//import 'package:b_green/page/meandrawer.dart';
//import 'package:b_green/page/yeild_update.dart';
//import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
//import 'package:b_green/core/color.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:typed_data';
import 'dart:convert';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CameraGalleryDemoState createState() => _CameraGalleryDemoState();
}

File? _image, _croppedFile;
// ignore: prefer_typing_uninitialized_variables
var cropim;
int cropcheck = 0;
String message = "";

class _CameraGalleryDemoState extends State<Camera> {
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
                toolbarColor: Colors.green,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Gallery Demo'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          /*ElevatedButton.icon(
              onPressed: () {
                //uploadimage(_image);
              },
              icon: Icon(Icons.upload),
              label: Text("upload")),*/
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: _image == null
                    ? const Center(
                        child: Text(
                        'No image selected.',
                        selectionColor: Colors.green,
                      ))
                    : Image.file(_image!),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          /* FloatingActionButton(
            onPressed: _cropImage,
            tooltip: 'Crop_image',
            child: const Icon(Icons.crop),
          ),*/
          FloatingActionButton(
            onPressed: _getImageFromCamera,
            tooltip: 'Take a photo',
            child: const Icon(Icons.camera_alt),
          ),
          // const SizedBox(width: 16),
          FloatingActionButton(
            onPressed: _getImageFromGallery,
            tooltip: 'Pick from gallery',
            child: const Icon(Icons.photo_library),
          ),
        ],
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
Reference referenceimage_up = referencedirimage.child('imagename');
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
      appBar: AppBar(title: const Text("Crop image")),
      body: Center(
        child: _image == null
            ? const Text('No image selected.')
            : Image.file(_image!),
      ),
      floatingActionButton:
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        FloatingActionButton(
          onPressed: cropImage,
          tooltip: 'Crop_image',
          child: const Icon(Icons.crop),
        ),
        ElevatedButton.icon(
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

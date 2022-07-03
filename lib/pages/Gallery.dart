import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mgmt/Models/userRegistration.dart';
import 'package:mgmt/pages/home.dart';
import 'package:mgmt/pages/login.dart';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Gallery extends StatefulWidget {
  const Gallery({Key? key}) : super(key: key);

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  File? image1;
  File? image2;
  File? image3;
  File? image4;
  //var imagebytes;
  //String img = '';
  Future pickImage1(ImageSource source) async {
    // try {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imagePath = File(image.path);
    // imagebytes = await imagePath.readAsBytes(); //convert to bytes
    // img = convert.base64.encode(imagebytes);
    setState(() {
      this.image1 = imagePath;
    });
    // }
    // on PlatformException catch (e) {
    //   print('failed to pick image: $e');
    // }
  }

  Future pickImage2(ImageSource source) async {
    // try {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imagePath = File(image.path);
    // imagebytes = await imagePath.readAsBytes(); //convert to bytes
    // img = convert.base64.encode(imagebytes);
    setState(() {
      this.image2 = imagePath;
    });
    // }
    // on PlatformException catch (e) {
    //   print('failed to pick image: $e');
    // }
  }

  Future pickImage3(ImageSource source) async {
    // try {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imagePath = File(image.path);
    // imagebytes = await imagePath.readAsBytes(); //convert to bytes
    // img = convert.base64.encode(imagebytes);
    setState(() {
      this.image3 = imagePath;
    });
    // }
    // on PlatformException catch (e) {
    //   print('failed to pick image: $e');
    // }
  }

  Future pickImage4(ImageSource source) async {
    // try {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imagePath = File(image.path);
    // imagebytes = await imagePath.readAsBytes(); //convert to bytes
    // img = convert.base64.encode(imagebytes);
    setState(() {
      this.image4 = imagePath;
    });
    // }
    // on PlatformException catch (e) {
    //   print('failed to pick image: $e');
    // }
  }

  @override
  Widget build(BuildContext context) {
    final imageUpload1 = InkWell(
      onTap: () => pickImage1(ImageSource.gallery),
      child: image1 != null
          ? Image.file(
              image1!,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            )
          : FlutterLogo(
              size: 100,
            ),
    );

    final imageUpload2 = InkWell(
      onTap: () => pickImage2(ImageSource.gallery),
      child: image2 != null
          ? Image.file(
              image2!,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            )
          : FlutterLogo(
              size: 100,
            ),
    );

    final imageUpload3 = InkWell(
      onTap: () => pickImage3(ImageSource.gallery),
      child: image3 != null
          ? Image.file(
              image3!,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            )
          : FlutterLogo(
              size: 100,
            ),
    );

    final imageUpload4 = InkWell(
      onTap: () => pickImage4(ImageSource.gallery),
      child: image4 != null
          ? Image.file(
              image4!,
              width: 150,
              height: 150,
              fit: BoxFit.cover,
            )
          : FlutterLogo(
              size: 100,
            ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Gallery Page'),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    imageUpload1,
                    imageUpload2,
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    imageUpload3,
                    imageUpload4,
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff4a4e69),
                  ),
                  child: const Text('Save'),
                  onPressed: () async {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

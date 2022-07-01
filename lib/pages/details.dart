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

class DetailsPage extends StatefulWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  File? image;
  var imagebytes;
  String img = '';
  String pdfFile = '';
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imagePath = File(image.path);
      imagebytes = await imagePath.readAsBytes(); //convert to bytes
      img = convert.base64.encode(imagebytes);
      setState(() => this.image = imagePath);
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }

  final _formkey = GlobalKey<FormState>();
  final nameEC = new TextEditingController();
  final FnameEC = new TextEditingController();
  final districtEC = new TextEditingController();
  final emailEC = new TextEditingController();
  final passwordEC = new TextEditingController();
  final cnfpasswordEC = new TextEditingController();
  final mobileEC = new TextEditingController();
  final noOfPeopleEC = new TextEditingController();
  final GSTEC = new TextEditingController();
  final addressEC = new TextEditingController();

  String _stateController = 'Haryana';
  String _catController = 'Categories';
  String _genderController = 'Male';

  @override
  Widget build(BuildContext context) {
    final color = Colors.black;
    //name
    final nameField = TextFormField(
      autofocus: false,
      controller: nameEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Name can't be empty";
        }
      },
      onSaved: (value) {
        nameEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "Enter Name",
        labelText: "Name",
      ),
    );

    final FnameField = TextFormField(
      autofocus: false,
      controller: FnameEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Father Name can't be empty";
        }
      },
      onSaved: (value) {
        FnameEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Father Name",
        labelText: "Father Name",
      ),
    );

    final districtField = TextFormField(
      autofocus: false,
      controller: districtEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "District can't be empty";
        }
      },
      onSaved: (value) {
        districtEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter District",
        labelText: "District",
      ),
    );

    final GSTField = TextFormField(
      autofocus: false,
      controller: GSTEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "GST number can't be empty";
        }
      },
      onSaved: (value) {
        GSTEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter GST no.",
        labelText: "GST no.",
      ),
    );

    final addressField = TextFormField(
      autofocus: false,
      controller: addressEC,
      keyboardType: TextInputType.name,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Address can't be empty";
        }
      },
      onSaved: (value) {
        addressEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Address.",
        labelText: "Address",
      ),
    );

    //email
    final emailField = TextFormField(
      autofocus: false,
      controller: emailEC,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Email can't be empty";
        }
      },
      onSaved: (value) {
        emailEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Email",
        labelText: "Email",
      ),
    );

    final MobileField = TextFormField(
      autofocus: false,
      controller: mobileEC,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Mobile Number can't be empty";
        }
        if (value.length != 10) {
          return "Mobile Number not valid";
        }
      },
      onSaved: (value) {
        mobileEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter Mobile Number",
        labelText: "Mobile Number",
      ),
    );

    final noOfPeopleField = TextFormField(
      autofocus: false,
      controller: noOfPeopleEC,
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "field can't be empty";
        }
      },
      onSaved: (value) {
        noOfPeopleEC.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
        hintText: "enter No of People",
        labelText: "No of People",
      ),
    );

    final catField = DropdownButtonFormField<String>(
      value: _catController,
      items: [
        'Categories',
        'food',
        'NZCC',
        'education',
        'cosmetics',
        'jewellery',
        'handicrafts',
        'handloom'
      ]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
      hint: Text('Rating'),
      onChanged: (value) {
        setState(
          () {
            _catController = value!;
          },
        );
      },
    );

    final stateField = DropdownButtonFormField<String>(
      value: _stateController,
      items: [
        'Andhra Pradesh',
        'Arunachal Pradesh',
        'Assam',
        'Bihar',
        'Chhattisgarh',
        'Goa',
        'Gujarat',
        'Haryana',
        'Himachal Pradesh',
        'Jharkhand',
        'Karnataka',
        'Kerala',
        'Madhya Pradesh',
        'Maharashtra',
        'Manipur',
        'Meghalaya',
        'Mizoram',
        'Nagaland',
        'Odisha',
        'Punjab',
        'Rajasthan',
        'Sikkim',
        'Tamil Nadu',
        'Telangana',
        'Tripura',
        'Uttar Pradesh',
        'Uttarakhand',
        'West Bengal',
        'Andaman and Nicobar Islands',
        'Chandigarh',
        'Dadra & Nagar Haveli & Daman & Diu',
        'Delhi',
        'Jammu and Kashmir',
        'Lakshadweep',
        'Puducherry',
        'Ladakh'
      ]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
      hint: Text('Rating'),
      onChanged: (value) {
        setState(
          () {
            _stateController = value!;
          },
        );
      },
    );

    final genderField = DropdownButtonFormField<String>(
      value: _genderController,
      items: [
        'Male',
        'Female',
        'Other',
      ]
          .map((label) => DropdownMenuItem(
                child: Text(label.toString()),
                value: label,
              ))
          .toList(),
      hint: Text('Gender'),
      onChanged: (value) {
        setState(
          () {
            _genderController = value!;
          },
        );
      },
    );
    UploadFile() {}
    final gstCertificate = Material(
        color: Color.fromARGB(255, 151, 156, 160),
        borderRadius: BorderRadius.circular(10),
        child: ElevatedButton(
            child: Text("Upload gstCertificate"),
            onPressed: () async {
              // final result = await FilePicker.platform.pickFiles();
              // FilePickerResult? result = await FilePicker.platform.pickFiles(
              //   type: FileType.custom,
              //   allowedExtensions: ['jpg', 'pdf', 'doc'],
              // );
              FilePickerResult? result = await FilePicker.platform.pickFiles();

              if (result != null) {
                PlatformFile file = result.files.first;
                pdfFile = file.path.toString();
                print(pdfFile);
                // if (result != null) {
                //   File file = File(result.files.single.path);
                //   pdfFile = convert.base64.encode(utf8.encode(file.path));
                // }
                // if (result != null) {
                //   var pdfPath = File(result.toString());
                // }
              }
            }));

    final imageUpload = Stack(
      children: [
        InkWell(
          onTap: () => pickImage(ImageSource.gallery),
          child: image != null
              ? ClipOval(
                  child: Image.file(
                    image!,
                    width: 150,
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                )
              : FlutterLogo(
                  size: 100,
                ),
        ),
        Positioned(
          bottom: 0,
          right: 4,
          child: InkWell(
            onTap: () => pickImage(ImageSource.camera),
            child: buildEditIcon(color),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Details'),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Form(
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("Update details"),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      imageUpload,
                      const SizedBox(
                        height: 20,
                      ),
                      nameField,
                      const SizedBox(
                        height: 20,
                      ),
                      FnameField,
                      const SizedBox(
                        height: 20,
                      ),
                      genderField,
                      const SizedBox(
                        height: 20,
                      ),
                      emailField,
                      const SizedBox(
                        height: 20,
                      ),
                      stateField,
                      const SizedBox(
                        height: 20,
                      ),
                      districtField,
                      const SizedBox(
                        height: 20,
                      ),
                      addressField,
                      const SizedBox(
                        height: 20,
                      ),
                      MobileField,
                      const SizedBox(
                        height: 20,
                      ),
                      catField,
                      const SizedBox(
                        height: 20,
                      ),
                      GSTField,
                      const SizedBox(
                        height: 20,
                      ),
                      noOfPeopleField,
                      const SizedBox(
                        height: 50,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      gstCertificate,
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        child: const Text('Send'),
                        onPressed: () async {
                          UserRegistration users = new UserRegistration(
                            name: nameEC.text,
                            fName: FnameEC.text,
                            mobile: mobileEC.text,
                            email: emailEC.text,
                            state: _stateController,
                            district: districtEC.text,
                            //address: FnameField.text,
                            gender: _genderController,
                            team: noOfPeopleEC.text,
                            category: _catController,
                            gsTNo: GSTEC.text,
                            gsTCertificate: 'dsdffsdfdsfsdfsda',
                            address: addressEC.text,
                            photo: img,
                            srno: 0,
                          );

                          var res =
                              await kdbmela(users).whenComplete(() => null);
                          if (res == 200) {
                            showdg(context, "Success", "Details Submitted");
                          } else {
                            showdg(context, "Failure", "Failed!!");
                          }

                          /**
             * Here we will add the necessary code to 
             * send the entered data to the Firebase Cloud Firestore.
             */
                        },
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildEditIcon(Color color) => buildCircle(
      all: 3,
      color: Colors.white,
      child: buildCircle(
        child: Icon(
          Icons.camera_enhance,
          color: Colors.white,
          size: 20,
        ),
        all: 8,
        color: Colors.black,
      ),
    );

Widget buildCircle({
  required Widget child,
  required double all,
  required Color color,
}) =>
    ClipOval(
      child: Container(
        padding: EdgeInsets.all(all),
        color: Colors.blue,
        child: child,
      ),
    );

Future kdbmela(UserRegistration users) async {
  Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  var myUsers = users.toJson();
  var usersBody = convert.json.encode(myUsers);
  var res = await http.post(
      Uri.parse('http://103.87.24.58/kdbmela/UserRegistration'),
      headers: header,
      body: usersBody);
  print(res.statusCode);
  return res.statusCode;
}

void showdg(BuildContext context, String title, String message) {
  showDialog(
      context: context,
      builder: (context) => new AlertDialog(
              title: new Text(title),
              content: Text(message),
              actions: <Widget>[
                new ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    // dismisses only the dialog and returns nothing
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Text("Ok"),
                )
              ]));
}

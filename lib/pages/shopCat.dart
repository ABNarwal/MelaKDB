import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import '../Models/userRegistration.dart';
import 'package:http/http.dart' as http;

class ShopCat extends StatefulWidget {
  String Cat;
  ShopCat({Key? key, required this.Cat}) : super(key: key);

  @override
  State<ShopCat> createState() => _ShopCatState();
}

class _ShopCatState extends State<ShopCat> {
  String? dropdownvalue = 'Select All';
  final List<String> myItems = [
    'Select All',
    'Food',
    'NZCC',
    'education',
    'cosmetics',
    'jewellery',
    'handicrafts',
    'handloom'
  ];
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  List<UserRegistration>? initialData;
  List<UserRegistration>? filteredByCatData;

  Future<List<UserRegistration>?> fetchData() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://103.87.24.58/kdbmela/UserRegistration'));
      if (response.statusCode == 200) {
        initialData = userRegistrationFromJson(response.body);

        print(initialData);
      } else {
        return throw Exception('Failed to load ...');
      }
    } catch (e) {
      return throw Exception('Failed to load ...');
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    fetchData().then((value) => setFilter(widget.Cat));

    super.initState();
  }

  void setFilter(String value) {
    filteredByCatData?.clear();
    if (value == 'Select All') {
      setState(() {
        filteredByCatData = initialData;
      });

      return;
    }

    setState(() {
      filteredByCatData =
          initialData! ////! means if initial data is null then no need to move ahead just stop here,don't perform where action
              .where((element) =>
                  element.category.toLowerCase() == value.toLowerCase())
              .toList(); //element is value we pass on to this method on changed of dropdown value
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4a4e69),
        title: Text(widget.Cat + " Shops"),
      ),
      body: filteredByCatData == null
          ? Center(
              child: CircularProgressIndicator(
                color:
                    Colors.primaries[Random().nextInt(Colors.primaries.length)],
              ),
            )
          : Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
              child: Column(
                children: [
                  Center(child: Text(filteredByCatData!.length.toString())),
                  Expanded(
                    child: ListView.builder(
                        itemCount: filteredByCatData == null
                            ? 0
                            : filteredByCatData?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(top: 15),
                                width: double.infinity,
                                child: Card(
                                  elevation: 5,

                                  // color: index % 2 == 0
                                  //     ? Colors.primaries[Random()
                                  //         .nextInt(Colors.primaries.length)]
                                  //     : Colors.primaries[Random()
                                  //         .nextInt(Colors.primaries.length)],
                                  color: index % 2 == 0
                                      ? Color.fromARGB(255, 200, 147, 209)
                                      : Color.fromARGB(255, 133, 139, 185),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Text("Shop Name:" + "",
                                      //     style:
                                      //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      ListTile(
                                        visualDensity: VisualDensity(
                                            horizontal: 0, vertical: -4),
                                        horizontalTitleGap: 80,
                                        leading: Text("Shop No :"),
                                        //title: Text((index + 1).toString()),
                                        title: Text(filteredByCatData![index]
                                            .srno
                                            .toString()),
                                        dense: true,
                                      ),
                                      // Text("Shop Category:" + query,
                                      //     style:
                                      //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                      ListTile(
                                        horizontalTitleGap: 30,
                                        visualDensity: VisualDensity(
                                            horizontal: 0, vertical: -4),
                                        leading: Text("Shop Category :"),
                                        title: Text(
                                            filteredByCatData![index].category),
                                        dense: true,
                                      ),
                                      Visibility(
                                          visible: _isVisible,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                horizontalTitleGap: 40,
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                leading: Text("How to Reach :"),
                                                trailing: Icon(
                                                    Icons.location_on_outlined),
                                                dense: true,
                                              ),
                                              // Text("Contact No:" + "",
                                              //     style:
                                              //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                              ListTile(
                                                horizontalTitleGap: 60,
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                leading: Text("Contact Us :"),
                                                title: Text(
                                                    filteredByCatData![index]
                                                        .mobile),
                                                trailing: Icon(
                                                    Icons.whatsapp_outlined),
                                                dense: true,
                                              ),
                                              ListTile(
                                                horizontalTitleGap: 50,
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                leading: Text("Email Us :"),
                                                title: Text(
                                                    filteredByCatData![index]
                                                        .email),
                                                trailing:
                                                    Icon(Icons.email_outlined),
                                                dense: true,
                                              ),
                                              ListTile(
                                                horizontalTitleGap: 80,
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                leading: Text("Address :"),
                                                title: Text(
                                                    filteredByCatData![index]
                                                        .address),
                                                dense: true,
                                              ),
                                              ListTile(
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                leading: Text("View Photo"),
                                                trailing: Icon(
                                                    Icons.camera_alt_outlined),
                                                // trailing: Image(image: initialData[index].photo.),
                                                dense: true,
                                              ),
                                            ],
                                          )),
                                      ListTile(
                                        visualDensity: VisualDensity(
                                            horizontal: 0, vertical: -4),
                                        horizontalTitleGap: 80,
                                        leading: SizedBox(width: 15),
                                        title: InkWell(
                                          child: Text("Show/Hide",
                                              style: TextStyle(
                                                  decoration:
                                                      TextDecoration.underline,
                                                  fontSize: 16,
                                                  color: Colors.black)),
                                          onTap: showToast,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        }),
                  )
                ],
              ),
            ),
    );
  }
}

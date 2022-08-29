import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mgmt/pages/Ratingshops.dart';
import '../Models/userRegistration.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
    _ratingController = TextEditingController(text: '');
    _rating = _initialRating;
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
      //backgroundColor: Color.fromARGB(179, 205, 204, 224),
      backgroundColor: Colors.white,
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
                                  //
                                  color: Colors.white,
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
                                                trailing: InkWell(
                                                  child: Text(
                                                    "Rate",
                                                    style: TextStyle(
                                                        color: Colors.orange,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          RatingShops(),
                                                    ),
                                                  );
                                                },
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
                                                //horizontalTitleGap: 50,
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                leading: Text("Rate Us :"),
                                                trailing: Text(
                                                  "($_rating)",
                                                  style: TextStyle(
                                                      color:
                                                          Colors.orangeAccent),
                                                ),
                                                title:
                                                    _ratingBar(_ratingBarMode),
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          RatingShops(),
                                                    ),
                                                  );
                                                },
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

  late final _ratingController;
  double? _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;

  Widget _RatingShop(BuildContext context) {
    return Directionality(
      textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            //_heading('Rate Our Shop'),
            _ratingBar(_ratingBarMode),
          ],
        ),
      ),
    );
  }

  Widget _ratingBar(int mode) {
    return RatingBar.builder(
      initialRating: _initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 30.0,
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      itemBuilder: (context, _) => Icon(
        _selectedIcon ?? Icons.star,
        color: Colors.amber,
      ),
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      updateOnDrag: true,
    );
  }
}

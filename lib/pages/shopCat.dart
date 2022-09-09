import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mgmt/pages/Ratingshops.dart';
import 'package:url_launcher/url_launcher.dart';
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
  int _hide = 0;
  bool _visible = false;

  List<UserRegistration>? initialData;
  List<UserRegistration>? filteredByCatData;

  Future<List<UserRegistration>?> fetchData() async {
    try {
      http.Response response = await http.get(Uri.parse(
          widget.Cat == 'Select All'
              ? 'http://103.87.24.58/kdbmela/UserRegistration/'
              : 'http://103.87.24.58/kdbmela/UserRegistration/' + widget.Cat));
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

  void launchWhatsapp({
    required int phone,
    required String message,
  }) async {
    String url() {
      return "https://wa.me/$phone::/?text=${Uri.parse(message)}";
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }
  // launchWhatsApp({
  //   required int phone,
  //   required String message,
  // }) async {
  //   String url() {
  //     // if (Platform.isAndroid) {
  //     //   // add the [https]
  //     // return "https://wa.me/$phone/?text=${Uri.parse(message)}";
  //     return "https://wa.me/$phone/?text=${Uri.parse(message)}";
  //     // } else {
  //     //   // add the [https]
  //     // return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
  //     // }
  //   }

  //   if (await canLaunch(url())) {
  //     await launch(url());
  //   } else {
  //     throw 'Could not launch ${url()}';
  //   }
  // }

  _launchEmail(String email) async {
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      throw 'Could not launch';
    }
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
                  Text(
                      "Total Shops in this Category : ${filteredByCatData!.length.toString()}"),
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
                                    side: BorderSide(
                                      color: Color(0xFF4a4e69),
                                      width: 1,
                                    ),
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
                                        leading: Text(
                                          "Shop No :",
                                        ),
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
                                          visible:
                                              filteredByCatData![index].srno ==
                                                          _hide &&
                                                      _visible
                                                  ? true
                                                  : false,
                                          child: Column(
                                            children: [
                                              ListTile(
                                                horizontalTitleGap: 40,
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                leading: Text("How to Reach :"),
                                                trailing: Icon(
                                                  Icons.location_on_sharp,
                                                  color: Colors.redAccent,
                                                ),
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
                                                  title: ElevatedButton.icon(
                                                    icon: Icon(Icons
                                                        .whatsapp_outlined),
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary: Colors.green,
                                                    ),
                                                    label: Text(
                                                        filteredByCatData![
                                                                index]
                                                            .mobile),
                                                    onPressed: () {
                                                      launchWhatsapp(
                                                          phone: int.parse(
                                                            filteredByCatData![
                                                                    index]
                                                                .mobile,
                                                          ),
                                                          message: "Hello");
                                                    },
                                                  )),
                                              ListTile(
                                                horizontalTitleGap: 50,
                                                visualDensity: VisualDensity(
                                                    horizontal: 0,
                                                    vertical: -4),
                                                leading: Text("Email Us :"),
                                                title: ElevatedButton.icon(
                                                  icon: Icon(
                                                      Icons.email_outlined),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor:
                                                              Color.fromARGB(
                                                                  255,
                                                                  207,
                                                                  15,
                                                                  15)),
                                                  label: Text(
                                                      filteredByCatData![index]
                                                          .email),
                                                  onPressed: () {
                                                    launch(
                                                        'mailto:${filteredByCatData![index].email}?subject=This is Subject Title&body=This is Body of Email');
                                                    // _launchEmail(
                                                    //     filteredByCatData![
                                                    //             index]
                                                    //         .email);
                                                  },
                                                ),
                                              ),
                                              ListTile(
                                                leading: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.6,
                                                  child: Row(
                                                    children: [
                                                      _ratingBar(double.parse(
                                                          filteredByCatData![
                                                                      index]
                                                                  .gsTNo
                                                                  .isEmpty
                                                              ? '0'
                                                              : filteredByCatData![
                                                                      index]
                                                                  .gsTNo)),
                                                      Text(
                                                        "(${double.parse(filteredByCatData![index].gsTNo.isEmpty ? '0' : filteredByCatData![index].gsTNo)})",
                                                        style: TextStyle(
                                                            color: Colors.green,
                                                            fontSize: 20),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                //  _ratingBar(double
                                                //     .parse(filteredByCatData![
                                                //                 index]
                                                //             .gsTNo
                                                //             .isEmpty
                                                //         ? '0'
                                                //         : filteredByCatData![
                                                //                 index]
                                                //             .gsTNo)),
                                                //
                                                //     Text(
                                                //       "(${double.parse(filteredByCatData![index].gsTNo)})",
                                                //       style: TextStyle(
                                                //           color: Colors.green,
                                                //           fontSize: 20),
                                                //     )
                                                //   ],
                                                // ),

                                                trailing: ElevatedButton(
                                                  child: Text(
                                                    "Feedback",
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              RatingShops(
                                                                  shopNo: filteredByCatData![
                                                                          index]
                                                                      .srno)),
                                                    );
                                                  },
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    primary: Colors.orange,
                                                  ),
                                                ),
                                                // ListTile(
                                                //   //horizontalTitleGap: 50,
                                                //   visualDensity: VisualDensity(
                                                //       horizontal: 0,
                                                //       vertical: -4),
                                                //   leading: Text("Rate Us :"),
                                                //   trailing: Text(
                                                //     "($_rating)",
                                                //     style: TextStyle(
                                                //         color:
                                                //             Colors.orangeAccent),
                                                //   ),
                                                //   title:
                                                //       _ratingBar(_ratingBarMode),
                                                //   onTap: () {
                                                //     Navigator.push(
                                                //       context,
                                                //       MaterialPageRoute(
                                                //         builder: (context) =>
                                                //             _RatingShop(context),
                                                //       ),
                                                //     );
                                                //   },
                                                // ),
                                                // ListTile(
                                                //   horizontalTitleGap: 80,
                                                //   visualDensity: VisualDensity(
                                                //       horizontal: 0,
                                                //       vertical: -4),
                                                //   leading: Text("Address :"),
                                                //   title: Text(
                                                //       filteredByCatData![index]
                                                //           .address),
                                                //   dense: true,
                                                // ),
                                                // ListTile(
                                                //   visualDensity: VisualDensity(
                                                //       horizontal: 0,
                                                //       vertical: -4),
                                                //   leading: Text("View Photo"),
                                                //   trailing: Icon(
                                                //       Icons.camera_alt_outlined),
                                                //   // trailing: Image(image: initialData[index].photo.),
                                                //   dense: true,
                                                // ),
                                              )
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
                                                  color: Colors.green)),
                                          onTap: () {
                                            setState(() {
                                              if (_hide ==
                                                  filteredByCatData![index]
                                                      .srno) {
                                                _visible = !_visible;
                                              } else {
                                                _visible = true;
                                                _hide =
                                                    filteredByCatData![index]
                                                        .srno;
                                              }
                                            });
                                          },
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

  // Widget _RatingShop(BuildContext context) {
  //   return Directionality(
  //     textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
  //     child: SingleChildScrollView(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.center,
  //         mainAxisSize: MainAxisSize.min,
  //         children: <Widget>[
  //           SizedBox(
  //             height: 40.0,
  //           ),
  //           //_heading('Rate Our Shop'),
  //           _ratingBar(0),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // Widget _ratingBar(double value) {
  //   return RatingBar.builder(
  //     initialRating: value,
  //     //minRating: 1,
  //     tapOnlyMode: false,
  //     maxRating: value,
  //     direction: Axis.horizontal,
  //     allowHalfRating: true,
  //     unratedColor: Colors.amber.withAlpha(50),
  //     itemCount: 5,

  //     itemSize: 30.0,
  //     itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
  //     itemBuilder: (context, _) => Icon(
  //       _selectedIcon ?? Icons.star,
  //       color: Colors.amber,
  //     ),
  //     onRatingUpdate: (ratings) {
  //       // setState(() {
  //       //   _rating = ratings;
  //       // }
  //       //);
  //     },
  //   );
  // }
  Widget _ratingBar(double value) {
    return RatingBarIndicator(
      //unratedColor: Colors.red,
      rating: value,
      itemBuilder: (context, index) => Icon(
        _selectedIcon ?? Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: 40.0,
      direction: Axis.horizontal,
    );
  }
}

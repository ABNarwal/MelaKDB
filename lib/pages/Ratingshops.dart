import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mgmt/Models/shopRating.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:mgmt/pages/shopCat.dart';

class RatingShops extends StatefulWidget {
  int shopNo;
  RatingShops({Key? key, required this.shopNo}) : super(key: key);
  @override
  _RatingShopsState createState() => _RatingShopsState();
}

class _RatingShopsState extends State<RatingShops> {
  late final _ratingController;
  late final _nameController;
  //late final _shopCodeController = widget.shopNo;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  double _initialRating = 2.0;
  bool _isRTLMode = false;
  bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '');
    _nameController = TextEditingController(text: '');
    //_shopCodeController = TextEditingController(text: '');

    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
        appBarTheme: AppBarTheme(
          titleTextStyle: Theme.of(context)
              .textTheme
              .headline6
              ?.copyWith(color: Colors.white),
        ),
      ),
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text('Give Feedback'),
          ),
          body: Directionality(
            textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 40.0,
                  ),
                  _heading('Rate Shop No : ${widget.shopNo}'),
                  _ratingBar(_ratingBarMode),
                  SizedBox(height: 20.0),
                  Text(
                    'Rating: $_rating',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _nameController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Name',
                            labelText: 'Enter Your Name',
                          ),
                        ),
                        SizedBox(height: 20.0),
                        // TextFormField(
                        //   //controller: _shopCodeController,
                        //   keyboardType: TextInputType.number,
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(),
                        //     hintText: 'Enter shop No',
                        //     labelText: 'Enter Shop No',
                        //   ),
                        // ),
                        SizedBox(height: 20.0),
                        TextFormField(
                          controller: _ratingController,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Enter Remarks',
                            labelText: 'Enter Remarks',
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  ElevatedButton(
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      Welcome users = Welcome(
                        name: _nameController.text,
                        shopcode: widget.shopNo,
                        rate: _rating.toInt(),
                        remarks: _ratingController.text,
                      );
                      var res = await kdbmela(users).whenComplete(() => null);
                      if (res == 200) {
                        showdg(context, "Success", "Details Submitted");
                      } else {
                        showdg(context, "Failure", "Failed!!");
                      }
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ratingBar(int mode) {
    return RatingBar.builder(
      initialRating: _initialRating,
      minRating: 1,
      direction: _isVertical ? Axis.vertical : Axis.horizontal,
      allowHalfRating: true,
      unratedColor: Colors.amber.withAlpha(50),
      itemCount: 5,
      itemSize: 50.0,
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

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      );
}

Widget _iconButton(BuildContext context, IconData icon) => IconButton(
      icon: Icon(icon),
      onPressed: () => Navigator.pop(context, icon),
      splashColor: Colors.amberAccent,
      color: Colors.amber,
    );
Future kdbmela(Welcome users) async {
  Map<String, String> header = {
    'Content-type': 'application/json',
    'Accept': 'application/json'
  };
  var myUsers = users.toJson();
  var usersBody = convert.json.encode(myUsers);
  var res = await http.post(Uri.parse('http://103.87.24.58/kdbmela/ShopRate'),
      headers: header, body: usersBody);
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
          },
          child: Text("Ok"),
        )
      ],
    ),
  );
}

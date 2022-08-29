import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingShops extends StatefulWidget {
  @override
  _RatingShopsState createState() => _RatingShopsState();
}

class _RatingShopsState extends State<RatingShops> {
  late final _ratingController;
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
                  _heading('Rate Our Shop'),
                  _ratingBar(_ratingBarMode),
                  SizedBox(height: 20.0),
                  Text(
                    'Rating: $_rating',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 40.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: TextFormField(
                      controller: _ratingController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter Remarks',
                        labelText: 'Enter Remarks',
                        suffixIcon: MaterialButton(
                          onPressed: () {
                            _userRating =
                                double.parse(_ratingController.text ?? '0.0');
                            setState(() {});
                          },
                          child: Text('Rate'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
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

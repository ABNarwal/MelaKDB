import 'package:flutter/material.dart';
import '../main.dart';

class ShopAlloc extends StatefulWidget {
  ShopAlloc({Key? key}) : super(key: key);

  @override
  State<ShopAlloc> createState() => _ShopAllocState();
}

class _ShopAllocState extends State<ShopAlloc> {
  String dropdownvalue = 'Apple';
  var items = [
    'Apple',
    'Banana',
    'Grapes',
    'Orange',
    'Watermelon',
    'Pineapple'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop Allocation'),
        backgroundColor: primaryColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              FormField<String>(builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      //borderRadius: BorderRadius.circular(25.0),
                      borderSide:
                          BorderSide(color: Color(0xff565264), width: 3),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                  ),
                  child: DropdownButton(
                    isDense: true,
                    elevation: 16,
                    style: const TextStyle(
                        color: Color(0xff565264),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    isExpanded: true,
                    hint: const Text(
                      "Select Part",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              FormField<String>(builder: (FormFieldState<String> state) {
                return InputDecorator(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        //borderRadius: BorderRadius.circular(25.0),
                        borderSide:
                            BorderSide(color: Color(0xff565264), width: 3),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0))),
                  child: DropdownButton(
                    isDense: true,
                    elevation: 16,
                    style: const TextStyle(
                        color: Color(0xff565264),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                    underline: Container(
                      height: 2,
                      color: Colors.transparent,
                    ),
                    isExpanded: true,
                    hint: const Text(
                      "Select Section",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    value: dropdownvalue,
                    // ignore: prefer_null_aware_operators
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}

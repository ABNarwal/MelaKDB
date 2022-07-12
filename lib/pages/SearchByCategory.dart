import 'package:flutter/material.dart';

import '../Models/userRegistration.dart';
import 'package:http/http.dart' as http;

class SearchByCategory extends StatefulWidget {
  SearchByCategory({Key? key}) : super(key: key);

  @override
  State<SearchByCategory> createState() => _SearchByCategoryState();
}

class _SearchByCategoryState extends State<SearchByCategory> {
  String? dropdownvalue = 'Select All';
  final List<String> myItems = [
    'Select All',
    'food',
    'NZCC',
    'education',
    'cosmetics',
    'jewellery',
    'handicrafts',
    'handloom'
  ];

  List<UserRegistration>? initialData;
  List<UserRegistration>? filteredByCatData;

  Future<List<UserRegistration>?> fetchData() async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://103.87.24.58/kdbmela/UserRegistration'));
      if (response.statusCode == 200) {
        initialData = userRegistrationFromJson(response.body);
        return initialData;
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

    fetchData();
    super.initState();
  }

  void setFilter(String value) {
    filteredByCatData?.clear();
    if (value == 'Select All') {
      filteredByCatData = initialData;
      return;
    }
    filteredByCatData =
        initialData! ////! means if initial data is null then no need to move ahead just stop here,don't perform where action
            .where((element) => element.category == value)
            .toList(); //element is value we pass on to this method on changed of dropdown value
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff4a4e69),
        title: Text("Search By Category"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
              decoration: BoxDecoration(
                  border: Border.all(width: 5, color: Color(0xff4a4e69))),
              child: DropdownButton(
                  borderRadius: BorderRadius.circular(5),
                  alignment: Alignment.topCenter,
                  value: dropdownvalue,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: myItems.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      dropdownvalue = newValue as String?;
                      setFilter(dropdownvalue!);
                    });
                  }),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount:
                      filteredByCatData == null ? 0 : filteredByCatData?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          width: double.infinity,
                          child: Card(
                            elevation: 5,
                            color: Color(0xff4a4e69),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Text("Shop Name:" + "",
                                //     style:
                                //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ListTile(
                                  leading: Text("Shop No :"),
                                  title: Text((index + 1).toString()),
                                  dense: true,
                                ),
                                // Text("Shop Category:" + query,
                                //     style:
                                //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                ListTile(
                                  leading: Text("Shop Category :"),
                                  title:
                                      Text(filteredByCatData![index].category),
                                  dense: true,
                                ),
                                // Row(
                                //   children: [
                                //     Text("How to Reach:",
                                //         style: TextStyle(
                                //             fontSize: 16, fontWeight: FontWeight.bold)),
                                //     Icon(Icons.location_on),
                                //   ],
                                // ),
                                const ListTile(
                                  leading: Text("How to Reach :"),
                                  title: Icon(Icons.location_on),
                                  dense: true,
                                ),
                                // Text("Contact No:" + "",
                                //     style:
                                //         TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                                const ListTile(
                                  leading: Text("Contact Us :"),
                                  title: Icon(Icons.whatsapp_outlined),
                                  dense: true,
                                ),
                                const ListTile(
                                  leading: Text("Email Us :"),
                                  title: Text(""),
                                  dense: true,
                                ),
                                const ListTile(
                                  leading: Text("Address :"),
                                  title: Text(""),
                                  dense: true,
                                ),
                                const ListTile(
                                  leading: Text("View Photo"),
                                  title: Icon(Icons.camera_alt_outlined),
                                  dense: true,
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

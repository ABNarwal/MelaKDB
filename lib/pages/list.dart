import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mgmt/pages/partmodel.dart';
import 'package:mgmt/pages/sectionmodel.dart';
import 'package:mgmt/pages/chaptermodel.dart';
import 'package:mgmt/pages/yeardata.dart';

import 'dart:async';
import 'package:http/http.dart' as http;

class HomePagenew extends StatefulWidget {
  const HomePagenew({Key? key}) : super(key: key);

  @override
  State<HomePagenew> createState() => _HomePagenewState();
}

class _HomePagenewState extends State<HomePagenew> {
  List<PartData>? partResponse;
  List<SectionData>? sectionResponse;
  List<ChapterData>? chapterResponse;
  List<ChapterData>? chapterResponse1;
  String? partvalue;
  String? sectionvalue;
  String? chaptervalue;
  TextEditingController _txtsearch = TextEditingController();

  String _stateController = 'Haryana';
  String _catController = 'Categories';

  Future<List<PartData>?> fetchData() async {
    try {
      http.Response response =
          await http.get(Uri.parse('http://164.100.200.46/hiisapi/PartMas'));
      if (response.statusCode == 200) {
        partResponse = partDataFromJson(response.body);
        return partResponse;
      } else {
        return throw Exception('Failed to load ...');
      }
    } catch (e) {
      return throw Exception('Failed to load ...');
    }
  }

  Future<List<SectionData>?> fetchsectData(String id) async {
    try {
      http.Response response = await http
          .get(Uri.parse('http://164.100.200.46/hiisapi/SectionMas/' + id));
      if (response.statusCode == 200) {
        sectionResponse = sectionDataFromJson(response.body);
        return sectionResponse;
      } else {
        return throw Exception('Failed to load ...');
      }
    } catch (e) {
      return throw Exception('Failed to load ...');
    }
  }

  Future<List<ChapterData>?> fetchchepttData() async {
    try {
      http.Response response =
          await http.get(Uri.parse('http://164.100.200.46/hiisapi/Chapter'));
      if (response.statusCode == 200) {
        chapterResponse = chapterDataFromJson(response.body);
        //  chapterResponse1 = chapterResponse;
        return chapterResponse;
      } else {
        return throw Exception('Failed to load ...');
      }
    } catch (e) {
      return throw Exception('Failed to load ...');
    }
  }

  Future<void> setSection(String id) async {
    sectionvalue = null;
    var d = await fetchsectData(id);
    setState(() {});
  }

  void filter() {
    if (_txtsearch.text.trim().isNotEmpty) {
      setState(() {
        chapterResponse1 = chapterResponse
            ?.where((element) => element.chapterName.contains(_txtsearch.text))
            .toList();
      });
    } else {
      setState(() {
        chapterResponse1 = chapterResponse1
            ?.where((element) => element.sectionCode == sectionvalue)
            .toList();
      });
    }
  }

  Future<void> setchapter(String id) async {
    chaptervalue = null;
    // var d = await fetchchepttData(id);
    var d = await fetchchepttData().then((value) => chapterResponse1 =
        value?.where((element) => element.sectionCode == id).toList());
    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    fetchData().then((users) {
      setState(() {
        partResponse = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Page'),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            DropdownButtonFormField<String>(
              elevation: 16,
              isExpanded: true,
              hint: const Text(
                "Select Part",
              ),
              value: partvalue,
              // ignore: prefer_null_aware_operators
              items: sectionResponse != null
                  ? sectionResponse?.map(
                      (item) {
                        return DropdownMenuItem(
                          value: item.sectionCode.toString(),
                          child: Text(item.sectionName),
                        );
                      },
                    ).toList()
                  : null,
              onChanged: (item) {
                sectionvalue = item.toString();
                setchapter(
                  sectionvalue.toString(),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButtonFormField<String>(
              elevation: 16,
              isExpanded: true,
              hint: const Text(
                "Select Section",
              ),
              value: sectionvalue,
              // ignore: prefer_null_aware_operators
              items: sectionResponse != null
                  ? sectionResponse?.map(
                      (item) {
                        return DropdownMenuItem(
                          value: item.sectionCode.toString(),
                          child: Text(item.sectionName),
                        );
                      },
                    ).toList()
                  : null,
              onChanged: (item) {
                sectionvalue = item.toString();
                setchapter(
                  sectionvalue.toString(),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  side: BorderSide(
                    width: 3,
                    color: Color(0xff4a4e69),
                  ),
                ),
                child: ListTile(
                  leading: const Icon(Icons.search),
                  title: TextField(
                      controller: _txtsearch,
                      decoration: const InputDecoration(
                        hintText: 'Topic Search',
                        hintStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                        border: InputBorder.none,
                        // hintText: 'search here...',
                        // border: OutlineInputBorder(
                        //     borderRadius: BorderRadius.vertical())
                      ),
                      onChanged: (text) => filter()),
                  trailing: InkWell(
                    child: Icon(Icons.cancel),
                    onTap: () {
                      _txtsearch.clear();
                    },
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
              height: 600,
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount:
                      chapterResponse1 == null ? 0 : chapterResponse1?.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => yeardatacls(
                                // seccode: _txtsearch.toString()
                                // ignore: unrelated_type_equality_checks
                                seccode: chapterResponse1![index].sectionCode ==
                                        0
                                    ? chapterResponse1![index].sectionCode
                                    : chapterResponse1![index].sectionCode)));
                      },
                      child: Card(
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(
                          width: 1,
                          color: Colors.grey,
                        )),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            textColor: Colors.blueGrey,
                            title: Text(
                              "${chapterResponse1![index].chapterName}",
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}


//http://164.100.200.46/dsofiles/1994-95/f

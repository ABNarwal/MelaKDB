import 'package:flutter/material.dart';
import 'lib/main.dart';

class yeardatacls extends StatefulWidget {
  String seccode;
  yeardatacls({Key? key, required this.seccode}) : super(key: key);

  @override
  State<yeardatacls> createState() => _yeardataclsState();
}

class _yeardataclsState extends State<yeardatacls> {
  List<String> yearwisedata = [
    '1962-63',
    '1966-67',
    '1967-68',
    '1968-69',
    '1969-70',
    '1970-71',
    '1971-72',
    '1972-73',
    '1973-74',
    '1974-75',
    '1975-76',
    '1976-77',
    '1977-78',
    '1978-79',
    '1979-80',
    '1980-81',
    '1981-82',
    '1982-83',
    '1983-84',
    '1984-85',
    '1987-88',
    '1988-89',
    '1994-95',
    '2000-01',
    '2002-03',
    '2003-04',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        // leading: InkWell(
        //   child: Icon(Icons.arrow_back),
        //   onTap: () {},
        // ),
        title: const Text(
          'Yearwise Data',
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 700,
          child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemCount: yearwisedata == null ? 0 : yearwisedata.length,
              itemBuilder: (context, index) {
                return Container(
                    padding: const EdgeInsets.only(left: 5, right: 5, top: 7),
                    child: yearwisedata != null
                        ?
                        // GridView(
                        //     shrinkWrap: true,
                        //     padding: const EdgeInsets.only(
                        //         left: 24, right: 24, top: 24),
                        //     gridDelegate:
                        //         const SliverGridDelegateWithFixedCrossAxisCount(
                        //             crossAxisCount: 2,
                        //             crossAxisSpacing: 16,
                        //             mainAxisSpacing: 16),
                        //     children: [

                        InkWell(
                            onTap: () {},
                            child: Card(
                              shape: const RoundedRectangleBorder(
                                  side: BorderSide(
                                      width: 2,
                                      color: Colors.deepPurpleAccent)),
                              child: ListTile(
                                  trailing: Icon(
                                    Icons.arrow_forward,
                                    color: Colors.amber,
                                  ),
                                  leading: Icon(
                                    Icons.book_online_outlined,
                                    color: Colors.amber,
                                  ),
                                  title: Text(
                                    yearwisedata[index].toString(),
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          )
                        // ],
                        // )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ));
              }),
        ),
      ),
    );
  }
}

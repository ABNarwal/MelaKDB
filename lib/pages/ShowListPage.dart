import 'package:flutter/material.dart';
import 'package:mgmt/pages/login.dart';
import 'package:mgmt/pages/profile.dart';
import 'package:mgmt/pages/shopalloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class ShowListPage extends StatefulWidget {
  const ShowListPage({Key? key}) : super(key: key);

  @override
  State<ShowListPage> createState() => _ShowListPageState();
}

class _ShowListPageState extends State<ShowListPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Show List Page'),
          backgroundColor: Color(0xff4a4e69),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [],
          ),
        ),
      );
}

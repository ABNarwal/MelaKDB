import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

class Helpline extends StatefulWidget {
  const Helpline({Key? key}) : super(key: key);

  @override
  State<Helpline> createState() => _HelplineState();
}

class _HelplineState extends State<Helpline> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _KDBphone = '9876543210';
  String _ControlRoom = '9753186420';
  String _Emergency = '7896543210';

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Helpline Numbers"),
        backgroundColor: Color(0xff4a4e69),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.white),
            ),
            tileColor: Color.fromARGB(255, 200, 147, 209),
            leading: Icon(Icons.home_outlined),
            title: Text("KDB Office : " + _KDBphone),
            trailing: IconButton(
                onPressed: _hasCallSupport
                    ? () => setState(() {
                          _launched = _makePhoneCall(_KDBphone);
                        })
                    : null,
                icon: Icon(Icons.call)),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.white),
            ),
            tileColor: Colors.teal,
            leading: Icon(Icons.help_outline),
            title: Text("Control Room : " + _ControlRoom),
            trailing: IconButton(
                onPressed: _hasCallSupport
                    ? () => setState(() {
                          _launched = _makePhoneCall(_ControlRoom);
                        })
                    : null,
                icon: Icon(Icons.call)),
          ),
          SizedBox(
            height: 10,
          ),
          ListTile(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.white),
            ),
            tileColor: Color.fromARGB(255, 243, 187, 102),
            leading: Icon(Icons.emergency_outlined),
            title: Text("Emergency : " + _Emergency),
            trailing: IconButton(
                onPressed: _hasCallSupport
                    ? () => setState(() {
                          _launched = _makePhoneCall(_Emergency);
                        })
                    : null,
                icon: Icon(Icons.call)),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

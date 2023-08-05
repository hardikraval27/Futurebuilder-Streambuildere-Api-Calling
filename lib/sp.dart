import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sp extends StatefulWidget {
  const sp({Key? key}) : super(key: key);

  @override
  State<sp> createState() => _spState();
}
class _spState extends State<sp> {
  SharedPreferences? prefs;

  int a = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    eran();
  }
  Future<void> eran() async {
// Obtain shared preferences.
    prefs = await SharedPreferences.getInstance();
    a = prefs!.getInt("key") ?? 0;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("${a}"),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  a++;
                  prefs!.setInt("key", a);
                });
              },
              child: Icon(Icons.add))
        ],
      ),
    );
  }
}

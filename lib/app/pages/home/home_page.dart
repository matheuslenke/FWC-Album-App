import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: Center(
          child: ElevatedButton(
        child: Text("Logout"),
        onPressed: () async {
          final sp = await SharedPreferences.getInstance();
          sp.clear();
          Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
        },
      )),
    );
  }
}

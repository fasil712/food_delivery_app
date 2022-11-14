import 'package:flutter/material.dart';

class CheckUI extends StatelessWidget {
  const CheckUI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Check UI")),
      body: const SafeArea(
          child: Center(
        child: Text("Hello"),
      )),
    );
  }
}

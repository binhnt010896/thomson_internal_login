import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('You\'re signed in!\nRedirecting to your app.\nDon\'t move a muscle! :)'),
      ),
    );
  }
}

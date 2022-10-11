import 'package:flutter/material.dart';

class Base extends StatefulWidget {
  static const String route = 'base';
  const Base({Key? key}) : super(key: key);

  @override
  State<Base> createState() => _BaseState();
}

class _BaseState extends State<Base> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

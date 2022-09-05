import 'package:flutter/material.dart';

class nomina extends StatefulWidget {
  const nomina({super.key});

  @override
  State<nomina> createState() => _nominaState();
}

class _nominaState extends State<nomina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Nomina"),
      ),
    );
  }
}

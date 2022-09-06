import 'package:flutter/material.dart';
import 'package:erp/paginas/principal.dart';
import 'package:erp/paginas/rrhh.dart';
//import 'package:erp/paginas/rrhh/personal.dart';
import 'package:erp/paginas/rrhh/recursos/personal/PersonalCrear.dart';

void main() {
  runApp(MaterialApp(home: Principal(), routes: <String, WidgetBuilder>{
    '/rrhh': (BuildContext context) => rrhh(),
    '/rrhh/PersonalCrear': (BuildContext context) => PersonalCrear(),
  }));
}

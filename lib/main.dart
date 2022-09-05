import 'package:flutter/material.dart';
import 'package:erp/paginas/principal.dart';
import 'package:erp/paginas/rrhh.dart';
import 'package:erp/paginas/rrhh/personal.dart';
import 'package:erp/paginas/rrhh/personalcrear.dart';

void main() {
  runApp(new MaterialApp(home: Principal(), routes: <String, WidgetBuilder>{
    '/rrhh': (BuildContext context) => new rrhh(),
    '/rrhh/personalcrear': (BuildContext context) => new personalcrear(),
  }));
}

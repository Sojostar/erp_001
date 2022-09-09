import 'package:flutter/material.dart';
import 'package:erp/paginas/principal.dart';
import 'package:erp/paginas/rrhh.dart';
import 'package:erp/paginas/rrhh/PruebaCrear.dart';
import 'package:erp/paginas/rrhh/recursos/personal/PersonalCrear.dart';
import 'package:erp/paginas/rrhh/recursos/personal/PruebaVer.dart';

void main() {
  runApp(MaterialApp(home: Principal(), routes: <String, WidgetBuilder>{
    '/rrhh': (BuildContext context) => rrhh(),
    '/rrhh/PersonalCrear': (BuildContext context) => PersonalCrear(),
    '/rrhh/PruebaCrear': (BuildContext context) => PruebaCrear(),
    '/rrhh/PruebaVer': (BuildContext context) => PruebaVer(),
  }));
}

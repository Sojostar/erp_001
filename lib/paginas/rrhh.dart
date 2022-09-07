import 'package:flutter/material.dart';
import 'package:erp/paginas/rrhh/personal.dart';
import 'package:erp/paginas/rrhh/prueba.dart';
import 'package:erp/paginas/rrhh/prueba_2.dart';
//import 'package:proyecto_002/paginas/rrhh/personal.dart';

class rrhh extends StatefulWidget {
  const rrhh({super.key});

  @override
  State<rrhh> createState() => _rrhhState();
}

class _rrhhState extends State<rrhh> {
  int indexTab = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('RRHH'),
          bottom: const TabBar(
            isScrollable: true,
            tabs: <Widget>[
              Tab(
                text: 'Personal',
                icon: Icon(Icons.person),
              ),
              Tab(
                text: 'Departamentos',
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                text: 'Cargos',
                icon: Icon(Icons.brightness_5_sharp),
              ),
              Tab(
                text: 'Horarios',
                icon: Icon(Icons.brightness_5_sharp),
              ),
              Tab(
                text: 'Asistencias',
                icon: Icon(Icons.brightness_5_sharp),
              ),
              Tab(
                text: 'Vacaciones',
                icon: Icon(Icons.brightness_5_sharp),
              ),
              Tab(
                text: 'Calendario',
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            new Personal(),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
            Center(
              child: Text("It's cloudy here"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            new Prueba2(),
            new Prueba(),
          ],
        ),
      ),
    );
  }
}

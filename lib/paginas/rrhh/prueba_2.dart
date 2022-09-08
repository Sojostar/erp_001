import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:erp/paginas/rrhh.dart';
import 'dart:async';
import 'package:mysql1/mysql1.dart';
import 'package:erp/paginas/rrhh/PruebaCrear.dart';

var results;

Future fn_query() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  // Create a table
  // await conn.query( 'CREATE TABLE users (id int NOT NULL AUTO_INCREMENT PRIMARY KEY, name varchar(255), email varchar(255), age int)');

  // Insert some data
  /*
  var result = await conn.query(
      'insert into users (name, email, age) values (?, ?, ?)',
      ['Bob', 'bob@bob.com', 25]);
  print('Inserted row id=${result.insertId}');
  */

  // Query the database using a parameterized query
  results = await conn.query(
      'select rrhh_empleado_id, rrhh_empleado_nombre_a, rrhh_empleado_nombre_b, rrhh_empleado_apellido_a, rrhh_empleado_apellido_b, rrhh_empleado_identificacion,  rrhh_empleado_pais_nacimiento,  rrhh_empleado_nacionalidad from rrhh_empleado ');
  //'select id_prueba, prueba from prueba');

  users.clear();
  for (var row in results) {
    //print('id_prueba: ${row[0]}, prueba: ${row[1]} ');
    //debugPrint(results.toString());
    llenar_tabla(
        row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]);

    //users.add();
    //juan.primer_nombre = row[2];
    // users.add(juan);
  }

  // Update some data
  //await conn.query('update users set age=? where name=?', [26, 'Bob']);

  // Finally, close the connection
  await conn.close();
}

class User {
  int id_empleado;
  String primer_nombre;
  String segundo_nombre;
  String primer_apellido;
  String segundo_apellido;
  String identificacion;
  int pais_nacimiento;
  int pais_nacionalidad;
  //DateTime fecha_nacimiento;

  User({
    this.id_empleado = 0,
    this.primer_nombre = '',
    this.segundo_nombre = '',
    this.primer_apellido = '',
    this.segundo_apellido = '',
    this.identificacion = '',
    this.pais_nacimiento = 0,
    this.pais_nacionalidad = 0,
    //this.fecha_nacimiento = DateTime.toLocal(),
  });

  static List<User> getUsers() {
    return users;
  }

  addUsers(
      int id_empleado,
      String primer_nombre,
      String segundo_nombre,
      String primer_apellido,
      String segundo_apellido,
      String identificacion,
      int pais_nacimiento,
      int pais_nacionalidad) {
    var user = new User();
    //user.id_empleado = id_empleado;
    user.primer_nombre = primer_nombre;
    user.segundo_nombre = segundo_nombre;
    user.primer_apellido = primer_apellido;
    user.segundo_apellido = segundo_apellido;
    user.identificacion = identificacion;
    user.pais_nacimiento = pais_nacimiento;
    user.pais_nacionalidad = pais_nacionalidad;
    users.add(user);
  }
}

List<User> users = [];
List<User> duplicateusers = [];

class Prueba2 extends StatefulWidget {
  const Prueba2({super.key});

  @override
  State<Prueba2> createState() => _Prueba2State();
}

var var_juan = new User();

llenar_tabla(
    int id_usuario,
    String nombre_a,
    String nombre_b,
    String apellido_a,
    String apellido_b,
    String identificacion,
    int pais_nacimiento,
    int pais_nacionalidad) {
  var_juan.addUsers(id_usuario, nombre_a, nombre_b, apellido_a, apellido_b,
      identificacion, pais_nacimiento, pais_nacionalidad);
}

class _Prueba2State extends State<Prueba2> {
  final title = 'Long List';
  TextEditingController editingController = TextEditingController();
  bool sort = true;
/*
  void filterSearchResults(String query) {
    List<String> dummySearchList = [];
    dummySearchList.addAll(duplicateusers);
    if (query.isNotEmpty) {
      List<String> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        users.clear();
        users.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        users.clear();
        users.addAll(duplicateusers);
      });
    }
  }
*/

  void initState() {
    users.addAll(duplicateusers);
    setState(() {
      fn_query();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {},
                controller: editingController,
                decoration: InputDecoration(
                    labelText: "Busqueda",
                    hintText: "Busqueda",
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25.0)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: users.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: InkWell(
                      onTap: () {
                        print('Impreso');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage:
                                      AssetImage('assets/images/avatar_3.png'),
                                ),
                                title: Text('Sun'),
                                subtitle: Text('93 million miles away'),
                              ),
                            ),
                            Text('data'),
                            Text('data'),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

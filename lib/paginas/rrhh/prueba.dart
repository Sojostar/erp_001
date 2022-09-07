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
      // 'select rrhh_empleado_nombre_a, rrhh_empleado_nombre_b from rrhh_empleado where rrhh_empleado_id = ?', [result.insertId]);
      'select id_prueba, prueba from prueba');

  users.clear();
  for (var row in results) {
    print('id_prueba: ${row[0]}, prueba: ${row[1]} ');
    debugPrint(results.toString());
    llenar_tabla(row[0], row[1]);

    //users.add();
    //juan.lastName = row[2];
    // users.add(juan);
  }

  // Update some data
  //await conn.query('update users set age=? where name=?', [26, 'Bob']);

  // Finally, close the connection
  await conn.close();
}

class User {
  int firstName;
  String lastName;

  User({this.firstName = 0, this.lastName = ''});

  static List<User> getUsers() {
    return users;
  }

  addUsers(int firstName, String lastName) {
    var user = new User();
    user.firstName = firstName;
    user.lastName = lastName;
    users.add(user);
  }
}

List<User> users = [];

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

var var_juan = new User();

llenar_tabla(int nombre, String Apellido) {
  var_juan.addUsers(nombre, Apellido);
}

class _PruebaState extends State<Prueba> {
  List<User> users = User.getUsers();
  bool sort = true;

  @override
  void initState() {
    users = User.getUsers();
    //   fn_query();
    //   setState(() {
    //     print("despues");
    //   });
    getLista();
    super.initState();
  }

  getLista() async {
    await fn_query();
    setState(() {
      print("despues");
    });
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          setState(() {
            Navigator.of(context).pushNamed("/rrhh/PruebaCrear");
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: new Container(
        width: MediaQuery.of(context).size.width,
        child: new DataTable(
          sortColumnIndex: 0,
          sortAscending: true,
          columns: const <DataColumn>[
            DataColumn(
              label: Expanded(
                child: Text(
                  'Foto',
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'id',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
            DataColumn(
              label: Expanded(
                child: Text(
                  'prueba',
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          ],
          rows: users
              .map(
                (user) => DataRow(
                  cells: <DataCell>[
                    DataCell(FlutterLogo()),
                    DataCell(Text((user.firstName).toString())),
                    DataCell(Text(user.lastName)),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

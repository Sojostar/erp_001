import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:erp/paginas/rrhh.dart';
import 'dart:async';
import 'package:mysql1/mysql1.dart';
import 'package:erp/paginas/rrhh/PruebaCrear.dart';

final items = List<String>.generate(10000, (i) => "Item $i");

final duplicateItems = List<String>.generate(10000, (i) => "Item $i");

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

class Prueba2 extends StatefulWidget {
  const Prueba2({super.key});
/*
  void filterSearchResults(String query) {
    List<String> dummySearchList = List<String>();
    dummySearchList.addAll(duplicateItems);
    if (query.isNotEmpty) {
      List<String> dummyListData = List<String>();
      dummySearchList.forEach((item) {
        if (item.contains(query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(duplicateItems);
      });
    }
  }
*/
  @override
  State<Prueba2> createState() => _Prueba2State();
}

var var_juan = new User();

llenar_tabla(int nombre, String Apellido) {
  var_juan.addUsers(nombre, Apellido);
}

class _Prueba2State extends State<Prueba2> {
  final title = 'Long List';
  TextEditingController editingController = TextEditingController();
  bool sort = true;

  void initState() {
    items.addAll(duplicateItems);
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
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('${items[index]}'),
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

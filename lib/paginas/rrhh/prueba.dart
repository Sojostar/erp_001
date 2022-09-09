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
  dummyListData.clear();
  for (var row in results) {
    // print('id_prueba: ${row[0]}, prueba: ${row[1]} ');
    //debugPrint(results.toString());
    llenar_tabla(
        row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]);
    llenar_tablo(
        row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7]);

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

  static List<User> getUsera() {
    return dummyListData;
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
    user.id_empleado = id_empleado;
    user.primer_nombre = primer_nombre;
    user.segundo_nombre = segundo_nombre;
    user.primer_apellido = primer_apellido;
    user.segundo_apellido = segundo_apellido;
    user.identificacion = identificacion;
    user.pais_nacimiento = pais_nacimiento;
    user.pais_nacionalidad = pais_nacionalidad;
    users.add(user);
  }

  addUsera(
      int id_empleado,
      String primer_nombre,
      String segundo_nombre,
      String primer_apellido,
      String segundo_apellido,
      String identificacion,
      int pais_nacimiento,
      int pais_nacionalidad) {
    var usera = new User();
    usera.id_empleado = id_empleado;
    usera.primer_nombre = primer_nombre;
    usera.segundo_nombre = segundo_nombre;
    usera.primer_apellido = primer_apellido;
    usera.segundo_apellido = segundo_apellido;
    usera.identificacion = identificacion;
    usera.pais_nacimiento = pais_nacimiento;
    usera.pais_nacionalidad = pais_nacionalidad;
    dummyListData.add(usera);
  }
}

List<User> users = [];
List<User> dummyListData = [];

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _PruebaState();
}

var var_juan = new User();
var var_juan_2 = new User();

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

llenar_tablo(
    int id_usuario,
    String nombre_a,
    String nombre_b,
    String apellido_a,
    String apellido_b,
    String identificacion,
    int pais_nacimiento,
    int pais_nacionalidad) {
  var_juan_2.addUsera(id_usuario, nombre_a, nombre_b, apellido_a, apellido_b,
      identificacion, pais_nacimiento, pais_nacionalidad);
}

class _PruebaState extends State<Prueba> {
  List<User> users = User.getUsers();
  List<User> duplicateItems = User.getUsers();
  bool sort = true;
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    // users = User.getUsers();
    // dummyListData.clear;
    getLista();
    //users.addAll(duplicateItems);
    super.initState();
  }

  getLista() async {
    await fn_query();
    setState(() {
      print("despues");
    });
  }

  onSearchTextChanged(String text) async {
    users.clear();

    if (text.isEmpty) {
      setState(() {});
      return;
    }

    print(dummyListData.length);
    dummyListData.forEach((var_juan_2) {
      //print(var_juan_2.lastName);
      //print('3');
      if (var_juan_2.primer_nombre.contains(text) ||
          var_juan_2.segundo_nombre.contains(text) ||
          var_juan_2.primer_apellido.contains(text) ||
          var_juan_2.segundo_apellido.contains(text) ||
          var_juan_2.identificacion.contains(text)) {
        //var_juan_2.addUsers(var_juan_2.firstName, var_juan_2.lastName);
        llenar_tabla(
            var_juan_2.id_empleado,
            var_juan_2.primer_nombre,
            var_juan_2.segundo_nombre,
            var_juan_2.primer_apellido,
            var_juan_2.segundo_apellido,
            var_juan_2.identificacion,
            var_juan_2.pais_nacimiento,
            var_juan_2.pais_nacionalidad);
      }
      //
    });

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          setState(() {
            Navigator.of(
              context,
            ).pushNamed("/rrhh/PruebaCrear");
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  onSearchTextChanged(value);
                  print(value);
                },
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
                        print(users[index].id_empleado);
                        Navigator.of(
                          context,
                        ).pushNamed("/rrhh/PruebaVer",
                            arguments: {'nombre': 'juan'});
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
                                title: Text(users[index].primer_nombre +
                                    ' ' +
                                    users[index].segundo_nombre +
                                    ' ' +
                                    users[index].primer_apellido +
                                    ' ' +
                                    users[index].segundo_apellido),
                                subtitle: Text(
                                    'C.I.: ' + users[index].identificacion),
                              ),
                            ),
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

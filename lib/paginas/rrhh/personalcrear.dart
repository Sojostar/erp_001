import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysql1/mysql1.dart';

var results;

Future fn_query_pais() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results =
      await conn.query('select id_pais,nombre_pais from gen_paises order by 1');

  listUserType.clear();
  for (var row in results) {
    print('nombre_pais: ${row[1]}');
    print('id_pais: ${row[0]}');
    listUserType.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

class personalcrear extends StatefulWidget {
  ///const personalcrear({super.key});

  @override
  State<personalcrear> createState() => _personalcrearState();
}

class _personalcrearState extends State<personalcrear> {
  final _formKey = GlobalKey<FormState>();

  final primer_nombre = Container(
    child: Column(
      children: <Widget>[
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          decoration: const InputDecoration(
              hintText: 'Introduzca Primer Nombre', labelText: 'Primer Nombre'),
        )
      ],
    ),
  );
  final segundo_nombre = Container(
    child: Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Introduzca Segundo Nombre',
              labelText: 'Segundo Nombre'),
        )
      ],
    ),
  );
  final primer_apellido = Container(
    child: Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Introduzca Primer Apellido',
              labelText: 'Primer Apellido'),
        )
      ],
    ),
  );
  final segundo_apellido = Container(
    child: Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
              hintText: 'Introduzca Primer Apellido',
              labelText: 'Segundo Apellido'),
        )
      ],
    ),
  );

  final pais = Container(
    child: Column(
      children: <Widget>[
        DropdownButtonExample(),
      ],
    ),
  );

//
//
//

  final identificacion = Container(
    child: Column(
      children: <Widget>[
        TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          decoration: const InputDecoration(
              hintText: 'Introduzca Numero de Identificacion',
              labelText: 'Identificacion'),
        )
      ],
    ),
  );
/*
  final pais_nacimiento =  Container(
    child:  Column(
      children: <Widget>[
         DropdownButton(
          value: 'selectedValue',
          icon: const Icon(Icons.keyboard_arrow_down),
          items: items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
        )
      ],
    ),
  );
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          setState(() {});
        },
        child: const Icon(Icons.check),
        backgroundColor: Colors.deepOrange,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      appBar: AppBar(
        title: Text("Agregar Personal"),
      ),
      body: Container(
        //width: MediaQuery.of(context).size.width,
        child: Form(
          key: _formKey,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[
                      primer_nombre,
                      identificacion,
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[
                      segundo_nombre,
                      pais,
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[
                      primer_apellido,
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[
                      segundo_apellido,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

int value = 0;
String nombre = ' ';

List list = [];

List listUserType = [];

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    getLista();
    super.initState();
  }

  getLista() async {
    await fn_query_pais();
    setState(() {
      print(listUserType.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.settings),
        hintText: 'Pais de Nacimiento',
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(color: Colors.yellow),
      ),
      isExpanded: true,
      // value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (Map) {
        // This is called when the user selects an item.
        setState(() {
          // dropdownValue = 'value';
        });
      },
      items: listUserType.map((map) {
        return DropdownMenuItem(
          child: Text(
            map['nombre'],
          ),
          value: map['value'],
        );
      }).toList(),
    );
  }
}

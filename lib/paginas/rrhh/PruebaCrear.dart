import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

Future fn_query_pais(texto) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  var result =
      await conn.query('insert into prueba (prueba) values (?)', [texto]);

  await conn.close();
}

class PruebaCrear extends StatefulWidget {
  const PruebaCrear({super.key});

  @override
  State<PruebaCrear> createState() => _PruebaCrearState();
}

class _PruebaCrearState extends State<PruebaCrear> {
  final _formKey = GlobalKey<FormState>();
  final textoController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          setState(() {
            fn_query_pais((textoController.text));
          });
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
                      Container(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              controller: textoController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Porfavor Ingrese Texto';
                                }
                                return null;
                              },
                              decoration: const InputDecoration(
                                  //border: OutlineInputBorder(),
                                  hintText: 'Introduzca Primer Nombre',
                                  labelText: 'Primer Nombre'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(40.0),
                  child: Column(
                    children: <Widget>[],
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

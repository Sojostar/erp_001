import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mysql1/mysql1.dart';

var results;
var results_sexo;
var results_dominancia;
var results_estado_civil;
var results_nivel_instruccion;
var results_discapacidad;
var result_operadora;
var results_parentesco;
var results_Estados;

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

  listPaisNacionalidad.clear();
  listPaisNacimiento.clear();
  listUbicacionPais.clear();
  listPaisResidencia.clear();
  for (var row in results) {
    print('nombre_pais: ${row[1]}');
    print('id_pais: ${row[0]}');
    listPaisNacionalidad.add({'value': row[0], 'nombre': row[1]});
    listPaisNacimiento.add({'value': row[0], 'nombre': row[1]});
    listUbicacionPais.add({'value': row[0], 'nombre': row[1]});
    listPaisResidencia.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

// Operadora

Future fn_query_operadoras() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results = await conn.query(
      'select gen_operadoras_telefonicas,gen_operadoras_telefonicas_numeros from gen_operadoras_telefonicas order by 1');

  listTelefonoEmpleadoOper.clear();
  listTelefonoEmpleadoOperSec.clear();
  listTelefonoReferenciaAOper.clear();
  listTelefonoReferenciaBOper.clear();
  listTelefonoReferenciaEmergenciaOper.clear();
  for (var row in results) {
    print('gen_operadoras_telefonicas: ${row[0]}');
    print('gen_operadoras_telefonicas_numeros: ${row[1]}');
    listTelefonoEmpleadoOper.add({'value': row[0], 'nombre': row[1]});
    listTelefonoEmpleadoOperSec.add({'value': row[0], 'nombre': row[1]});
    listTelefonoReferenciaAOper.add({'value': row[0], 'nombre': row[1]});
    listTelefonoReferenciaBOper.add({'value': row[0], 'nombre': row[1]});
    listTelefonoReferenciaEmergenciaOper
        .add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

//Sexo
Future fn_query_sexo() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results_sexo =
      await conn.query('select gen_sexo_id,gen_sexo from gen_sexo order by 1');

  listSexo.clear();
  for (var row in results_sexo) {
    print('gen_sexo_id: ${row[0]}');
    print('gen_sexo: ${row[1]}');
    listSexo.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

//Dominancia
Future fn_query_dominancia() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results_dominancia = await conn.query(
      'select gen_dominancia_id,gen_dominancia from gen_dominancia order by 1');

  listDominancia.clear();
  for (var row in results_dominancia) {
    print('gen_dominancia_id: ${row[0]}');
    print('gen_dominancia: ${row[1]}');
    listDominancia.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

//Estado Civil
Future fn_query_estado_civil() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results_estado_civil = await conn.query(
      'select gen_estado_civil_id,gen_estado_civil from gen_estado_civil order by 1');

  listEstadoCivil.clear();
  for (var row in results_estado_civil) {
    print('gen_estado_civil_id: ${row[0]}');
    print('gen_estado_civil: ${row[1]}');
    listEstadoCivil.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

//Discapacidad
Future fn_query_discapacidad() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results_discapacidad = await conn.query(
      'select gen_discapacidad_id,gen_discapacidad from gen_discapacidad order by 1');

  listDiscapacidad.clear();
  for (var row in results_discapacidad) {
    print('gen_discapacidad_id: ${row[0]}');
    print('gen_discapacidad: ${row[1]}');
    listDiscapacidad.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

//Nivel de Instruccion
Future fn_query_nivel_instruccion() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results_nivel_instruccion = await conn.query(
      'select gen_nivel_instruccion_id,gen_nivel_instruccion from gen_nivel_instruccion order by 1');

  listNivelInstruccion.clear();
  for (var row in results_nivel_instruccion) {
    print('gen_nivel_instruccion_id: ${row[0]}');
    print('gen_nivel_instruccion: ${row[1]}');
    listNivelInstruccion.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

//Dominancia
Future fn_query_parentesco() async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results_parentesco = await conn.query(
      'select gen_parentesco_id,gen_parentesco from gen_parentesco order by 1');

  listEmergenciaParentesco.clear();
  for (var row in results_dominancia) {
    print('gen_parentesco_id: ${row[0]}');
    print('gen_parentesco: ${row[1]}');
    listEmergenciaParentesco.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

//Ciudad
Future fn_query_ciudad(int valor) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results_sexo = await conn
      .query('select gen_sexo_id,gen_sexo from gen_ciudades where order by 1');

  listSexo.clear();
  for (var row in results_sexo) {
    print('gen_sexo_id: ${row[0]}');
    print('gen_sexo: ${row[1]}');
    listSexo.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

//Estado
Future fn_query_estado(valor) async {
  // Open a connection (testdb should already exist)
  final conn = await MySqlConnection.connect(ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'avila',
      db: 'avila',
      password: 'avila'));

  results_Estados = await conn.query(
      'select id_estado,estado from gen_estados where id_pais=? order by 1',
      [valor]);

  listEstados.clear();
  for (var row in results_Estados) {
    print('id_estado: ${row[0]}');
    print('estado: ${row[1]}');
    listEstados.add({'value': row[0], 'nombre': row[1]});
  }

  await conn.close();
}

class PersonalCrear extends StatefulWidget {
  ///const PersonalCrear({super.key});

  @override
  State<PersonalCrear> createState() => _PersonalCrearState();
}

class _PersonalCrearState extends State<PersonalCrear> {
  final _formKey = GlobalKey<FormState>();
  final firstDate = DateTime(DateTime.now().year - 120);
  final lastDate = DateTime.now();

  final primer_nombre = Container(
    child: Column(
      children: <Widget>[
        TextFormField(
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
  );
  final segundo_nombre = Container(
    child: Column(
      children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(
              //border: OutlineInputBorder(),
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
              //border: OutlineInputBorder(),
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
              //border: OutlineInputBorder(),
              hintText: 'Introduzca Primer Apellido',
              labelText: 'Segundo Apellido'),
        )
      ],
    ),
  );

  final pais_nacimiento = Container(
    child: Column(
      children: <Widget>[
        DropdownPaisNacimiento(),
      ],
    ),
  );

  final pais_nacionalidad = Container(
    child: Column(
      children: <Widget>[
        DropdownPaisNacionalidad(),
      ],
    ),
  );

  final pais_ubicacion = Container(
    child: Column(
      children: <Widget>[
        DropdownUbicacionPais(),
      ],
    ),
  );

  final pais_residencia = Container(
    child: Column(
      children: <Widget>[
        DropdownPaisUbicacion(),
      ],
    ),
  );

  final estados = Container(
    child: Column(
      children: <Widget>[
        DropdownEstadoResidencia(),
      ],
    ),
  );

  final fecha_nacimiento = Container(
    child: Column(
      children: <Widget>[
        InputDatePickerFormField(
          firstDate: DateTime(DateTime.now().year - 120),
          lastDate: DateTime.now(),
          fieldLabelText: 'Fecha de Nacimiento',
          //fieldHintText: 'Juan',
        )
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
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(9),
          ],
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

  final rif = Container(
    child: Column(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(9),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          decoration: const InputDecoration(
            hintText: 'Introduzca Rif del Empleado',
            labelText: 'RIF',
          ),
        )
      ],
    ),
  );

  final estatura = Container(
    child: Column(
      children: <Widget>[
        TextFormField(
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: <TextInputFormatter>[
            //FilteringTextInputFormatter.digitsOnly,
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
            //FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            LengthLimitingTextInputFormatter(4),
          ],
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter some text';
            }
            return null;
          },
          decoration: const InputDecoration(
            hintText: 'Introduzca Estatura del Empleado',
            labelText: 'Estatura',
          ),
        )
      ],
    ),
  );
  final sexo = Container(
    child: Column(
      children: <Widget>[
        DropdownSexo(),
      ],
    ),
  );

  final dominancia = Container(
    child: Column(
      children: <Widget>[
        DropdownDominancia(),
      ],
    ),
  );

  final estado_civil = Container(
    child: Column(
      children: <Widget>[
        DropdownEstadoCivil(),
      ],
    ),
  );

  final discapacidad = Container(
    child: Column(
      children: <Widget>[
        DropdownDiscapacidad(),
      ],
    ),
  );

  final nivel_instruccion = Container(
    child: Column(
      children: <Widget>[
        DropdownNivelInstruccion(),
      ],
    ),
  );

  final telefono_empleado_a_oper = Container(
    child: Column(
      children: <Widget>[
        DropdownOperadoraEmpleadoA(),
      ],
    ),
  );

  final telefono_empleado_b_oper = Container(
    child: Column(
      children: <Widget>[
        DropdownOperadoraEmpleadoB(),
      ],
    ),
  );

  final telefono_empleado_oper_emergencia = Container(
    child: Column(
      children: <Widget>[
        DropdownOperadoraEmergencia(),
      ],
    ),
  );

  final telefono_empleado_oper_ref_a = Container(
    child: Column(
      children: <Widget>[
        DropdownOperadoraReferenciaA(),
      ],
    ),
  );

  final telefono_empleado_oper_ref_b = Container(
    child: Column(
      children: <Widget>[
        DropdownOperadoraReferenciaB(),
      ],
    ),
  );

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
                      sexo,
                      pais_residencia,
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
                      rif,
                      pais_nacimiento,
                      estados,
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
                      estatura,
                      pais_nacionalidad,
                      pais_nacimiento,
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
                      fecha_nacimiento,
                      dominancia,
                      pais_nacimiento,
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

List listPaisNacimiento = [];
List listPaisNacionalidad = [];
List listPaisResidencia = [];
List listUbicacionPais = [];
List listUbicacionCiudad = [];
List listUbicacionEstado = [];
List listUbicacionMunicipio = [];
List listUbicacionParroquia = [];
List listSexo = [];
List listDominancia = [];
List listEstadoCivil = [];
List listDiscapacidad = [];
List listNivelInstruccion = [];
List listTelefonoEmpleadoOper = [];
List listTelefonoEmpleadoOperSec = [];
List listTelefonoReferenciaAOper = [];
List listTelefonoReferenciaBOper = [];
List listTelefonoReferenciaEmergenciaOper = [];
List listEmergenciaParentesco = [];
List listEstados = [];

// Pais de Nacimiento
class DropdownPaisNacimiento extends StatefulWidget {
  const DropdownPaisNacimiento({super.key});

  @override
  State<DropdownPaisNacimiento> createState() => _DropdownPaisNacimientoState();
}

class _DropdownPaisNacimientoState extends State<DropdownPaisNacimiento> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_pais();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_pin),
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
      items: listPaisNacionalidad.map((map) {
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

// Pais de Ubicacion
class DropdownPaisUbicacion extends StatefulWidget {
  const DropdownPaisUbicacion({super.key});

  @override
  State<DropdownPaisUbicacion> createState() => _DropdownPaisUbicacionState();
}

class _DropdownPaisUbicacionState extends State<DropdownPaisUbicacion> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  @override
  void didUpdateWidget(DropdownPaisUbicacion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (DropdownPaisUbicacion != oldWidget) {
      setState(() {});
      // TODO: start a transition between the previous and new value
    }
  }

  _getLista() async {
    await fn_query_pais();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    DropdownEstadoResidencia juan = DropdownEstadoResidencia();
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_pin),
        hintText: 'Pais de Residencia',
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(color: Colors.yellow),
      ),
      isExpanded: true,
      // value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (map) {
        // This is called when the user selects an item.
        setState(() {
          fn_query_estado(map);
          // dropdownValue = 'value';
        });
      },
      items: listUbicacionPais.map((map) {
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

//Nacionalidad

class DropdownPaisNacionalidad extends StatefulWidget {
  const DropdownPaisNacionalidad({super.key});

  @override
  State<DropdownPaisNacionalidad> createState() =>
      _DropdownPaisNacionalidadState();
}

class _DropdownPaisNacionalidadState extends State<DropdownPaisNacionalidad> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_pais();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_pin),
        hintText: 'Pais de Nacionalidad',
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(color: Colors.yellow),
      ),
      isExpanded: true,
      // value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (map) {
        // This is called when the user selects an item.
        setState(() {
          // dropdownValue = 'value';
        });
      },
      items: listPaisNacionalidad.map((map) {
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

//Estado

class DropdownEstadoResidencia extends StatefulWidget {
  const DropdownEstadoResidencia({super.key});

  @override
  State<DropdownEstadoResidencia> createState() =>
      _DropdownEstadoResidenciaState();
}

class _DropdownEstadoResidenciaState extends State<DropdownEstadoResidencia> {
  // String dropdownValue = [{999,'jose'}];
  recarga_estado() {
    setState(() {});
  }

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_estado(0);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_pin),
        hintText: 'Estado de Residencia',
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(color: Colors.yellow),
      ),
      isExpanded: true,
      // value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (map) {
        // This is called when the user selects an item.
        //fn_query_estado(map);
        print(map);
        setState(() {
          // dropdownValue = 'value';
        });
      },
      items: listEstados.map((map) {
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

// Ubicacion Pais
class DropdownUbicacionPais extends StatefulWidget {
  const DropdownUbicacionPais({super.key});

  @override
  State<DropdownUbicacionPais> createState() => _DropdownUbicacionPaisState();
}

class _DropdownUbicacionPaisState extends State<DropdownUbicacionPais> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_pais();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.location_pin),
        hintText: 'Pais de Ubicacion',
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
      items: listUbicacionPais.map((map) {
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
//Sexo

class DropdownSexo extends StatefulWidget {
  const DropdownSexo({super.key});

  @override
  State<DropdownSexo> createState() => _DropdownSexoState();
}

class _DropdownSexoState extends State<DropdownSexo> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_sexo();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.male),
        hintText: 'Sexo',
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
      items: listSexo.map((map) {
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

//Discapacidad

class DropdownDiscapacidad extends StatefulWidget {
  const DropdownDiscapacidad({super.key});

  @override
  State<DropdownDiscapacidad> createState() => _DropdownDiscapacidadState();
}

class _DropdownDiscapacidadState extends State<DropdownDiscapacidad> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_discapacidad();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.accessibility),
        hintText: 'Discapacidad',
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
      items: listDiscapacidad.map((map) {
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

//Nivel de Instruccion

class DropdownNivelInstruccion extends StatefulWidget {
  const DropdownNivelInstruccion({super.key});

  @override
  State<DropdownNivelInstruccion> createState() =>
      _DropdownNivelInstruccionState();
}

class _DropdownNivelInstruccionState extends State<DropdownNivelInstruccion> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_nivel_instruccion();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.school),
        hintText: 'Nivel de Instruccion',
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
      items: listNivelInstruccion.map((map) {
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

//Dominancia

class DropdownDominancia extends StatefulWidget {
  const DropdownDominancia({super.key});

  @override
  State<DropdownDominancia> createState() => _DropdownDominanciaState();
}

class _DropdownDominanciaState extends State<DropdownDominancia> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_dominancia();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.man),
        hintText: 'Dominancia',
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(color: Colors.yellow),
      ),
      isExpanded: true,
      // value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (map) {
        // This is called when the user selects an item.
        setState(() {
          print(map);
          // dropdownValue = 'value';
        });
      },
      items: listDominancia.map((map) {
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

//Estado Civil

class DropdownEstadoCivil extends StatefulWidget {
  const DropdownEstadoCivil({super.key});

  @override
  State<DropdownEstadoCivil> createState() => _DropdownEstadoCivilState();
}

class _DropdownEstadoCivilState extends State<DropdownEstadoCivil> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_estado_civil();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.family_restroom),
        hintText: 'Estado Civil',
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
      items: listEstadoCivil.map((map) {
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

//Operadora A

class DropdownOperadoraEmpleadoA extends StatefulWidget {
  const DropdownOperadoraEmpleadoA({super.key});

  @override
  State<DropdownOperadoraEmpleadoA> createState() =>
      _DropdownOperadoraEmpleadoAState();
}

class _DropdownOperadoraEmpleadoAState
    extends State<DropdownOperadoraEmpleadoA> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_operadoras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: 'Oper. Telefono Principal',
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
      items: listTelefonoReferenciaAOper.map((map) {
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

//Operadora B

class DropdownOperadoraEmpleadoB extends StatefulWidget {
  const DropdownOperadoraEmpleadoB({super.key});

  @override
  State<DropdownOperadoraEmpleadoB> createState() =>
      _DropdownOperadoraEmpleadoBState();
}

class _DropdownOperadoraEmpleadoBState
    extends State<DropdownOperadoraEmpleadoB> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_operadoras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: 'Oper. Telefono Secundario',
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
      items: listTelefonoEmpleadoOperSec.map((map) {
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

//Operadora Emergencia

class DropdownOperadoraEmergencia extends StatefulWidget {
  const DropdownOperadoraEmergencia({super.key});

  @override
  State<DropdownOperadoraEmergencia> createState() =>
      _DropdownOperadoraEmergenciaState();
}

class _DropdownOperadoraEmergenciaState
    extends State<DropdownOperadoraEmergencia> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_operadoras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: 'Oper. Contacto Emergencia',
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
      items: listTelefonoReferenciaBOper.map((map) {
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

//Operadora Referencia A

class DropdownOperadoraReferenciaA extends StatefulWidget {
  const DropdownOperadoraReferenciaA({super.key});

  @override
  State<DropdownOperadoraReferenciaA> createState() =>
      _DropdownOperadoraReferenciaAState();
}

class _DropdownOperadoraReferenciaAState
    extends State<DropdownOperadoraReferenciaA> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_operadoras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: 'Oper. Telefono Referencia A',
        filled: true,
        fillColor: Colors.white,
        errorStyle: TextStyle(color: Colors.yellow),
      ),
      isExpanded: true,
      // value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      onChanged: (map) {
        // This is called when the user selects an item.

        setState(() {});
      },
      items: listTelefonoReferenciaAOper.map((map) {
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

//Operadora Referencia B

class DropdownOperadoraReferenciaB extends StatefulWidget {
  const DropdownOperadoraReferenciaB({super.key});

  @override
  State<DropdownOperadoraReferenciaB> createState() =>
      _DropdownOperadoraReferenciaBState();
}

class _DropdownOperadoraReferenciaBState
    extends State<DropdownOperadoraReferenciaB> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_operadoras();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.phone),
        hintText: 'Oper. Telefono Referencia B',
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
      items: listTelefonoReferenciaBOper.map((map) {
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

// Pais de Residencia
class DropdownResidencia extends StatefulWidget {
  const DropdownResidencia({super.key});

  @override
  State<DropdownResidencia> createState() => _DropdownResidenciaState();
}

class _DropdownResidenciaState extends State<DropdownResidencia> {
  // String dropdownValue = [{999,'jose'}];

  @override
  void initState() {
    _getLista();
    super.initState();
  }

  _getLista() async {
    await fn_query_pais();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.map),
        hintText: 'Pais de Residencia',
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
      items: listPaisResidencia.map((map) {
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

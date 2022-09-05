import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  const Principal({super.key});

  @override
  State<Principal> createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  ListTile _obtenerItems(Icon icono, String descripcion, String ruta) {
    return new ListTile(
      leading: icono,
      title: new Text(descripcion),
      onTap: () {
        setState(() {
          Navigator.of(context).pushNamed(ruta);
        });
      },
    );
  }

  ListView listView = new ListView(
    children: <Widget>[
      // obtenerItems(new Icon(Icons.person), "lo que va", "/perfil"),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Principal"),
        backgroundColor: Color.fromARGB(255, 113, 195, 233),
      ),
      drawer: new Drawer(
          child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("AppMaking.co"),
            accountEmail: Text("sundar@appmaking.co"),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/images/avatar_3.png'),
              backgroundColor: Colors.transparent,
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/fondo.jpg'),
              fit: BoxFit.fill,
            )),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Principal"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.account_box),
            title: Text("RRHH"),
            onTap: () {
              setState(() {
                Navigator.of(context).pushNamed("/rrhh");
              });
            },
          ),
          ListTile(
            leading: Icon(Icons.people),
            title: Text("Nomina"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.money_rounded),
            title: Text("Asignaciones"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configuracion"),
            onTap: () {},
          )
        ],
      )),
      body: new Container(),
    );
  }
}

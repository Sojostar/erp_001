import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

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

  final String title = "Upload Image Demo";
  @override
  State<PruebaCrear> createState() => _PruebaCrearState();
}

class _PruebaCrearState extends State<PruebaCrear> {
  final _formKey = GlobalKey<FormState>();
  final textoController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textoController.dispose();
    super.dispose();
  }

/*
final FilePickerResult? result = await FilePicker.platform.pickFiles( 
  type: FileType.custom,
  allowedExtensions: ['jpg', 'pdf', 'doc'],) ;
*/

  static final String uploadEndPoint =
      'http://localhost/flutter_test/upload_image.php';
  Future<XFile>? file;
  String status = '';
  String base64Image = '';
  XFile? tmpFile;
  String errMessage = 'Error Uploading Image';

  void _setImageFileListFromFile(XFile? value) {
    final file = value == null ? null : <XFile>[value];
  }

  chooseImage() {
    setState(() {
      final file = _picker.pickImage(source: ImageSource.gallery);
    });
    setStatus('');
  }

  setStatus(String message) {
    setState(() {
      status = message;
    });
  }

  startUpload() {
    setStatus('Uploading Image...');
    if (null == tmpFile) {
      setStatus(errMessage);
      return;
    }
    String fileName = 'juan';
    upload(fileName);
  }

  upload(String fileName) {
    http.post(Uri.parse(uploadEndPoint), body: {
      "image": base64Image,
      "name": fileName,
    }).then((result) {
      setStatus(result.statusCode == 200 ? result.body : errMessage);
    }).catchError((error) {
      setStatus(error);
    });
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
                    children: <Widget>[
                      TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          chooseImage();
                        },
                        child: Text('TextButton'),
                      )
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
            ],
          ),
        ),
      ),
    );
  }
}

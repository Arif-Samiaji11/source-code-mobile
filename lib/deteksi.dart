import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Silahkan Unggah Foto',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const Test1(),
    );
  }
}

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  _TestState createState() => _TestState();
}

class _TestState extends State<Test1> {
  File? _file;
  String? prediction = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(146, 146, 189, 1),
        title: const Text('Silahkan Unggah Foto'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _file == null
                  ? const Text("Foto Tidak Ditemukan", style: TextStyle(fontSize: 18, color: Colors.grey))
                  : Image.file(_file!, height: 200, width: 200),
              const SizedBox(height: 16),
              Text(prediction ?? "", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              _buildButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      children: <Widget>[
        ElevatedButton(
          onPressed: () => uploadImage(),
          child: const Text("Unggah"),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () async {
            await predict();
            print(" Hasil Prediksi: $prediction");
          },
          child: const Text("Mulai Prediksi"),
        ),
      ],
    );
  }

  Future<void> uploadImage() async {
    final myfile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (myfile == null) return;

    setState(() {
      _file = File(myfile.path);
      prediction = "";
    });
  }

  Future<void> predict() async {
    if (_file == null) return;

    var uri = Uri.parse("/");

    var request = http.MultipartRequest("POST", uri);
    var multipartFile = http.MultipartFile(
      'file',
      http.ByteStream(Stream.castFrom(_file!.openRead())),
      _file!.lengthSync(),
      filename: _file!.path.split("/").last,
      contentType: MediaType('image', 'jpeg'),
    );

    request.files.add(multipartFile);

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        setState(() {
          prediction = responseBody;
        });
      } else {
        print("Gagal Unggah Gambar.");
      }
    } catch (e) {
      print("Error Unggah Gambar: $e");
    }
  }
}

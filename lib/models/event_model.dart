import 'package:http/http.dart' as http;
import 'dart:convert';

class DocumentRepository {
  final _baseUrl = 'https://web-kg2.herokuapp.com/api/dokumen';
  // final _baseUrl = 'https://kg.bisakode.com/api/dokumen';
  // final _baseUrl = 'https://618c2bc6ded7fb0017bb9463.mockapi.io/dokumen';

  Future getData() async {
    try {
      final response = await http.get(Uri.parse(_baseUrl));

      if (response.statusCode == 200) {
        Iterable it = jsonDecode(response.body);
        List<DocumentModel> documentmodel =
            it.map((e) => DocumentModel.fromJson(e)).toList();
        return documentmodel;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class DocumentModel {
  final int id;
  final String judul;
  final String deskripsi;

  DocumentModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
  });

  factory DocumentModel.fromJson(Map<String, dynamic> json) {
    return DocumentModel(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
    );
  }
}

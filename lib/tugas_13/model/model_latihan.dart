import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ModelLatihan {
  final String id;
  final String namaLatihan;
  final String jumlahHari;
  final String imageUrl;
  bool isFavorite; // <- tambahkan ini

  ModelLatihan({
    required this.id,
    required this.namaLatihan,
    required this.jumlahHari,
    required this.imageUrl,
    this.isFavorite = false,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'namaLatihan': namaLatihan,
      'jumlahHari': jumlahHari,
      'imageUrl': imageUrl,
      'isFavorite': isFavorite,
    };
  }

  factory ModelLatihan.fromMap(Map<String, dynamic> map) {
    return ModelLatihan(
      id: map['id'] as String,
      namaLatihan: map['namaLatihan'] as String,
      jumlahHari: map['jumlahHari'] as String,
      imageUrl: map['imageUrl'] as String,
      isFavorite: map['isFavorite'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelLatihan.fromJson(String source) =>
      ModelLatihan.fromMap(json.decode(source) as Map<String, dynamic>);
}

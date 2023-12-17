// MacbookModel.dart

class MacbookModel {
  final String id;
  final String gambar;
  final double harga;
  final String spesifikasi;
  final String tglrilis;
  final String typeiphone;

  MacbookModel({
    required this.id,
    required this.gambar,
    required this.harga,
    required this.spesifikasi,
    required this.tglrilis,
    required this.typeiphone,
  });

  factory MacbookModel.fromJson(String id, Map<String, dynamic> json) {
    return MacbookModel(
      id: id,
      gambar: json['gambar'],
      harga: json['harga'].toDouble(),
      spesifikasi: json['spesifikasi'],
      tglrilis: json['tglrilis'],
      typeiphone: json['typeiphone'],
    );
  }
}

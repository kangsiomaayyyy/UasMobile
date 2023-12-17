class IphoneModel {
  final String id;
  final String gambar;
  final int harga;
  final String spesifikasi;
  final String tglrilis;
  final String typeiphone;

  IphoneModel({
    required this.id,
    required this.gambar,
    required this.harga,
    required this.spesifikasi,
    required this.tglrilis,
    required this.typeiphone,
  });

  factory IphoneModel.fromJson(String id, Map<String, dynamic> json) {
    return IphoneModel(
      id: id,
      gambar: json['gambar'],
      harga: json['harga'],
      spesifikasi: json['spesifikasi'],
      tglrilis: json['tglrilis'],
      typeiphone: json['typeiphone'],
    );
  }
}

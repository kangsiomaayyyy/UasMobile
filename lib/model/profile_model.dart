class ProfileModel {
  final String alamat;
  final String kelamin;
  final String gambar;
  final String nama;
  final String notelp;

  ProfileModel({
    required this.alamat,
    required this.kelamin,
    required this.gambar,
    required this.nama,
    required this.notelp,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      alamat: json['Alamat'],
      kelamin: json['Kelamin'],
      gambar: json['gambar'],
      nama: json['nama'],
      notelp: json['notelp'],
    );
  }
}

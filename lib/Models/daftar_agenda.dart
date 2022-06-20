class Agenda {
  int id;
  String nama_kegiatan;
  String tanggal_kegiatan;
  String imageURL;
  String isi_kegiatan;

  Agenda(
      {required this.id,
      required this.nama_kegiatan,
      required this.tanggal_kegiatan,
      required this.imageURL,
      required this.isi_kegiatan});

  factory Agenda.fromJson(Map<String, dynamic> json) {
    return Agenda(
        id: int.parse(json['id']),
        nama_kegiatan: json['nama_kegiatan'],
        tanggal_kegiatan: json['tanggal_kegiatan'],
        imageURL: json['imageURL'],
        isi_kegiatan: json['isi_kegiatan']);
  }
}

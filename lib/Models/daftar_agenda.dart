class Agenda {
  String nama_tempat;
  String deskripsi;
  String imageURL;
  String tanggal;

  Agenda(
      // ignore: non_constant_identifier_names
      {required this.nama_tempat,
      required this.deskripsi,
      required this.imageURL,
      required this.tanggal});
}

List<Agenda> agendalist = [
  Agenda(
      nama_tempat: 'Saung Ujo',
      deskripsi: 'Saung ujo adalah tempat yang bukan berwarna hijau',
      imageURL: 'assets/images/banneragendakegiatan.jpeg',
      tanggal: '1 januari - 2 Februari'),
  Agenda(
      nama_tempat: 'Pasar Malam',
      deskripsi: 'Pasar malam bukan hiburan malam',
      imageURL: 'assets/images/banneragendakegiatan.jpeg',
      tanggal: '2 januari - 3 Februari'),
  Agenda(
      nama_tempat: 'Pasar Induk',
      deskripsi: 'Pasar Induk tidak memiliki kewajiban menafkahi anak pasar',
      imageURL: 'assets/images/banneragendakegiatan.jpeg',
      tanggal: '3 januari - 4 Februari'),
  Agenda(
      nama_tempat: 'Curug Pelangi',
      deskripsi: 'Curug pelangi bukan buat orang homo',
      imageURL: 'assets/images/banneragendakegiatan.jpeg',
      tanggal: '4 januari - 5 Februari'),
  Agenda(
      nama_tempat: 'Curug Maribaya',
      deskripsi: 'Saung ujo adalah tempat yang bukan berwarna hijau',
      imageURL: 'assets/images/banneragendakegiatan.jpeg',
      tanggal: '5 januari - 6 Februari'),
  Agenda(
      nama_tempat: 'Saung Ujo',
      deskripsi: 'Saung ujo adalah tempat yang bukan berwarna hijau',
      imageURL: 'assets/images/banneragendakegiatan.jpeg',
      tanggal: '6 januari - 7 Februari'),
];

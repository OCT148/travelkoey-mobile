import 'package:flutter/material.dart';
import 'package:travelkoey/Models/daftar_agenda.dart';

class AgendaKegiatanDetailsScreen extends StatelessWidget {
  final Agenda agenda;

  AgendaKegiatanDetailsScreen(this.agenda);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(agenda.imageURL),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  agenda.nama_kegiatan,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  agenda.tanggal_kegiatan,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17.0, fontStyle: FontStyle.italic),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  agenda.isi_kegiatan,
                  textAlign: TextAlign.justify,
                  style: TextStyle(fontSize: 22.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

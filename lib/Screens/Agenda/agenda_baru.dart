import 'package:travelkoey/Models/daftar_agenda.dart';
import 'package:travelkoey/Screens/Agenda/agenda_details_screen.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class Agenda_Baru extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: agendalist.length,
            itemBuilder: (context, index) {
              Agenda agenda = agendalist[index];
              return Card(
                child: ListTile(
                  title: Text(agenda.nama_tempat),
                  subtitle: Text(agenda.deskripsi),
                  leading: Image.asset(agenda.imageURL),
                  trailing: const Icon(Icons.arrow_forward_rounded),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AgendaKegiatanDetailsScreen(agenda)));
                  },
                ),
              );
            }));
  }
}

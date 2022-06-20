// @dart=2.9
import 'package:travelkoey/Models/daftar_agenda.dart';
import 'package:travelkoey/Screens/Agenda/agenda_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:travelkoey/Services/services.dart';

class Agenda_Baru extends StatefulWidget {
  Agenda_Baru() : super();

  @override
  Agenda_BaruState createState() => Agenda_BaruState();
}

class Agenda_BaruState extends State<Agenda_Baru> {
  Future<List<Agenda>> futureAgenda;

  @override
  void initState() {
    super.initState();
    futureAgenda = Services.getAgenda();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Agenda>>(
        future: futureAgenda,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Agenda> data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  Agenda agenda = data[index];
                  return Card(
                    child: ListTile(
                      title: Text(agenda.nama_kegiatan),
                      subtitle: Text(agenda.tanggal_kegiatan),
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
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          // By default show a loading spinner.
          return CircularProgressIndicator();
        },
      ),
    );
  }
}

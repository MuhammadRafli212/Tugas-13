import 'package:flutter/material.dart';
import 'package:jim_dedi/tugas_13/date_pick.dart';
import 'package:jim_dedi/tugas_13/hal_login.dart';
import 'package:jim_dedi/tugas_13/pilih_latihan.dart';
import 'package:jim_dedi/tugas_13/preferences/preferences.dart';
import 'package:jim_dedi/tugas_13/time_pick.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _beranda();
}

class _beranda extends State<Beranda> {
  int _selectedIndex = 2;
  List<Widget> listScreen = [
    TimePickerPage(),
    PilihLatihan(),
    DatePickerPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout', style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff697565),
      ),
      body: listScreen[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff697565)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: AssetImage('assets/images/unnamed.jpg'),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Asbun Jim',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Hidup Sehat Dan Berurat',
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.date_range_rounded),
              title: Text('Alarm', style: TextStyle(fontSize: 14)),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.sports_gymnastics_sharp),
              title: Text(
                'Pilih Kategori Latihan',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.date_range_outlined),
              title: Text(
                'Pilih Tanggal Latihan',
                style: TextStyle(fontSize: 14),
              ),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout, color: Color(0xffFF204E)),
              title: Text("Keluar", style: TextStyle(fontSize: 14)),
              onTap: () {
                Preferences.clearLogin();
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HalLogin()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

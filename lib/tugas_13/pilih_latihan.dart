import 'package:flutter/material.dart';
import 'package:jim_dedi/tugas_13/list_latihan.dart';
import 'package:jim_dedi/tugas_13/tambah_latihan.dart';

class PilihLatihan extends StatelessWidget {
  const PilihLatihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: double.infinity,
              child: Image.network(
                'https://c4.wallpaperflare.com/wallpaper/397/368/879/sports-mixed-martial-arts-mma-wallpaper-preview.jpg',
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Image.network(
                      'https://awsimages.detik.net.id/customthumb/2013/08/30/849/deddydietdlm.jpeg?w=600&q=90',
                    ),
                    SizedBox(width: 5),
                    Image.network(
                      'https://thumb.viva.co.id/media/frontend/thumbs3/2013/09/03/220446_deddy-corbuzier_1265_711.jpg',
                    ),
                    SizedBox(width: 3),
                    Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdWmud5IDqmz7I4w--kvv_1UGteeeBTmqgGY5rZUo41eaIS0mjfp3Onw0jG-7XeyS1_tM&usqp=CAU',
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ListLatihan()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff697565),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Text('Daftar Target Latihan'),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TambahLatihan()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff697565),
                foregroundColor: Colors.white,
                minimumSize: Size(double.infinity, 100),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Text('Tambah Latihan'),
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

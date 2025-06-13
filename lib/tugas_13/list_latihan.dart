import 'package:flutter/material.dart';
import 'package:jim_dedi/tugas_13/model/model_latihan.dart';

class ListLatihan extends StatefulWidget {
  const ListLatihan({super.key});

  @override
  State<ListLatihan> createState() => _listLatihan();
}

class _listLatihan extends State<ListLatihan> {
  List<ModelLatihan> dataLatihan = [
    ModelLatihan(
      id: '1',
      namaLatihan: 'Push Up',
      jumlahHari: '100x',
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0595/4270/0185/files/Pump_Up_Your_Chest_With_This_Brutal_Pushup_Challenge_480x480.gif?v=1713351342',
    ),
    ModelLatihan(
      id: '2',
      namaLatihan: 'Squat Jump',
      jumlahHari: '190x',
      imageUrl:
          'https://cdn.shopify.com/s/files/1/0595/4270/0185/files/The_30_Best_Squat_Variations_for_Every_Exerciser_and_Piece_of_Equipment___Livestrong_com_480x480.gif?v=1705401357',
    ),
    ModelLatihan(
      id: '3',
      namaLatihan: 'Jumping Jack',
      jumlahHari: '125x',
      imageUrl:
          'https://hips.hearstapps.com/hmg-prod/images/workouts/2016/03/jumpingjack-1457045563.gif?crop=1xw:0.75xh;center,top&resize=1200:*',
    ),
    ModelLatihan(
      id: '4',
      namaLatihan: 'Pull Up',
      jumlahHari: '120x',
      imageUrl:
          'https://homeworkouts.org/wp-content/uploads/anim-rear-pull-ups.gif',
    ),
    ModelLatihan(
      id: '5',
      namaLatihan: 'Dead Lift',
      jumlahHari: '230x',
      imageUrl:
          'https://www.kettlebellkings.com/cdn/shop/articles/barbell-deadlift-movement.gif?v=1692228918',
    ),
    ModelLatihan(
      id: '6',
      namaLatihan: 'Bench Press',
      jumlahHari: '250x',
      imageUrl:
          'https://www.inspireusafoundation.org/wp-content/uploads/2022/04/barbell-bench-press.gif',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Latihan'),
        backgroundColor: Color(0xff697565),
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: dataLatihan.length,
        itemBuilder: (BuildContext context, int index) {
          final listLatihan = dataLatihan[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(listLatihan.imageUrl),
            ),
            title: Text(listLatihan.namaLatihan),
            subtitle: Text('per set ${listLatihan.jumlahHari}'),
            trailing: IconButton(
              onPressed: () {
                setState(() {
                  listLatihan.isFavorite = !listLatihan.isFavorite;
                });
              },
              icon: Icon(
                listLatihan.isFavorite
                    ? Icons.check_box_sharp
                    : Icons.check_box_outline_blank,
                color: listLatihan.isFavorite ? Colors.grey : null,
              ),
            ),
          );
        },
      ),
    );
  }
}

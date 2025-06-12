import 'package:flutter/material.dart';
import 'package:jim_dedi/tugas_13/beranda.dart';

class HomeProfil extends StatefulWidget {
  const HomeProfil({super.key});

  @override
  State<HomeProfil> createState() => _homeprofil();
}

class _homeprofil extends State<HomeProfil> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [const Beranda(), const AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          const SizedBox(height: 20),

          // Foto profil di tengah
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS1D2u3JdKjCa9_M6aoljW20JrM8ZmHDwZ9mrvhbDHBslouVUV7DkyqOueaRYsS1IwNLsQ&usqp=CAU',
              ),
            ),
          ),

          const SizedBox(height: 12),

          const Center(
            child: Column(
              children: [
                Text(
                  'Dedi Cahyadi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Corbuziero@gmail.com',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          const Divider(),

          const SizedBox(height: 20),

          const Text(
            'Profil',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 20),

          const Text(
            'Mens sana in corpore sano" is a Latin phrase meaning "a healthy mind in a healthy body". It emphasizes the interconnectedness of physical and mental well-being. The phrase is often used in sports, education, and other contexts to highlight the importance of physical activity for overall health, including mental health. .',
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.justify,
          ),

          const SizedBox(height: 30),

          const Text(
            'Pembuat: Muhammad Rafli Iskandar',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),

          const Text('Versi: 1.0.0', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}

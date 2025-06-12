import 'package:flutter/material.dart';
import 'package:jim_dedi/tugas_13/hal_login.dart';
import 'package:jim_dedi/tugas_13/preferences/preferences.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void changePage() {
    Future.delayed(Duration(seconds: 3), () async {
      bool isLogin = await Preferences.getLogin();
      print('isLogin: $isLogin');
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HalLogin()),
      );
    });
  }

  @override
  void initState() {
    changePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),

            Image.network(
              'https://cdn.idntimes.com/content-images/post/20190622/50035353-2213423698917257-8036134146179238833-n-c673f07225b5cb7391f7858ca6347f95.jpg',
            ),
            Text('Asbun Jim', style: TextStyle(fontSize: 30)),
            Spacer(),
            SafeArea(child: Text('V.1.0.0', style: TextStyle(fontSize: 10))),
          ],
        ),
      ),
    );
  }
}

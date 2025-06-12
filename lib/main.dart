import 'package:flutter/material.dart';
import 'package:jim_dedi/tugas_13/hal_login.dart';
import 'package:jim_dedi/tugas_13/hal_register.dart';
import 'package:jim_dedi/tugas_13/pilih_latihan.dart';
import 'package:jim_dedi/tugas_13/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      // home: LoginScreenApp(),
      routes: {
        '/': (context) => Splash(),
        "/login": (context) => HalLogin(),
        "/Homescreen": (context) => PilihLatihan(),
        //"/Tujuh": (context) => Tugas7flutter(),
        HalLogin.id: (context) => HalLogin(),
        HalRegister.id: (context) => HalRegister(),
      },
      title: "PPKD B 2",

      theme: ThemeData(
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xffBBD8A3)),
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder()},
        ),
      ),
    );
  }
}

import 'package:delivery_app/pages/introduction_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MaterialApp(

      builder: (context, child) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: child!,);},
      debugShowCheckedModeBanner: false,
    theme: ThemeData(
      fontFamily: 'Vazir',
    ),

    home:SplashScreen(),)
  );
}



class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

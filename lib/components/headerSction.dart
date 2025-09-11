import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Column headerSction(Size size) {
  return Column(
    children: [
      Center(
        child: Image.asset(
          "assets/images/logo.png",
          width: size.width * 0.4,
          height: size.width * 0.4,
        ),
      ),
      SizedBox(height: size.height * 0.00),
      ShaderMask(
        shaderCallback:
            (bounds) => LinearGradient(
              colors: [Color(0xff306A89), Color(0xff0C1B23)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height)),
        child: Text(
          "به اقصی دلیوری خوش آمدید!",
          style: TextStyle(
            fontSize: size.width * 0.05,
            fontFamily: 'Shabnam',
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}

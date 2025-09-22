import 'package:delivery_app/pages/auth/signUpPage.dart';

import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textScale = MediaQuery.of(context).textScaleFactor;

    return Scaffold(
      body: Stack(
        children: [
          Container(color: Colors.white),

          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * 0.25,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Color(0xFF1F4E68), Colors.white],
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: Image.asset(
                      "assets/images/logo.png",
                      width: size.width * 0.45,
                      height: size.width * 0.45,
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(height: size.height * 0.015),

                  ShaderMask(
                    shaderCallback:
                        (bounds) => textGradeint.createShader(
                          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                        ),
                    child: Text(
                      "نرم افزار دلیوری اقصی",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: size.width * 0.08 * textScale,
                        fontFamily: 'DimaFantasy',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(gradient: textGradeint),
                    margin: const EdgeInsets.only(top: 6),
                    height: 2,
                    width: size.width * 0.5,
                  ),

                  SizedBox(height: size.height * 0.12),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen()
                            // SignUpScreen(),
                          ),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Color(0xff306A89)),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.02,
                        ),
                      ),
                      child: Text(
                        "ورود",
                        style: TextStyle(
                          color: const Color(0xFF1F4E68),
                          fontSize: size.width * 0.045 * textScale,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../components/dividerSection.dart';
import '../../components/gradienBotton.dart';
import '../../components/headerSction.dart';

import 'package:delivery_app/constants/colors.dart';

import '../MainPages/home/homePage.dart';


class PasswordChangedScreen extends StatelessWidget {
  const PasswordChangedScreen({super.key});

  final Color darkBlue = const Color(0xFF1F4E68);
  final Color lightBlue = const Color(0xFF4CA9DF);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kBackColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.05),
                headerSection(size),
                SizedBox(height: size.height * 0.012),
                divider(),
                SizedBox(height: size.height * 0.03),
                const Text(
                  "رمز شما موفقانه تعویض گردید",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: size.height * 0.012),
                Container(
                  width: double.infinity,
                  child: const Text(
                    "برای ادامه استفاده از اپلیکیشن دکمه تایید را کلیک کنید",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: size.height * 0.04),
                Image.asset(
                  'assets/images/fingerprint.png',
                  width: size.width * 0.50,
                  height: size.width * 0.50,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: size.height * 0.05),
                GradientButton(
                  text: "تأیید",
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                  },
                  verticalPadding: size.height * 0.018,
                  borderRadius: 12,
                  colors: [darkBlue, lightBlue],
                ),
                SizedBox(height: size.height * 0.06),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
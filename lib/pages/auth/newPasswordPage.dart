import 'package:flutter/material.dart';
import 'package:delivery_app/pages/auth/passwordChangedPage.dart';
import 'package:delivery_app/components/signUpComponent/textField.dart';
import '../../components/dividerSection.dart';
import '../../components/gradienBotton.dart';
import '../../components/headerSction.dart';

import 'package:delivery_app/constants/colors.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});

  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  bool passwordError = false;

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
                SizedBox(height: size.height * 0.02),
                divider(),
                SizedBox(height: size.height * 0.02),
                const Text(
                  "رمز جدید",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: size.height * 0.01),
                Container(
                  width: double.infinity,
                  child: const Text(
                    "لطفا رمز جدید خود را بسازید.",
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.right,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                buildTextField(
                  Tcontroller: phoneController,
                  hint: "شماره تماس خود را وارد نمایید...",
                  label: "شماره تماس",
                  keyboardType: TextInputType.phone,
                  prefixSvg: 'assets/svg/call.svg',
                ),
                SizedBox(height: size.height * 0.02),
                buildTextField(
                  Tcontroller: passwordController,
                  hint: "رمز عبور جدید را وارد نمایید...",
                  label: "رمز جدید",
                  prefixSvg: 'assets/svg/lock.svg',
                  suffixSvg: obscurePassword
                      ? 'assets/svg/eye-slash.svg'
                      : 'assets/svg/eye.svg',
                  onSuffixTap: () {
                    setState(() {
                      obscurePassword = !obscurePassword;
                    });
                  },
                  obscureText: obscurePassword,
                  error: passwordError,
                  errorText: passwordError ? "رمز معتبر نیست" : null,
                ),
                SizedBox(height: size.height * 0.05),
                GradientButton(
                  text: "تأیید",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PasswordChangedScreen(),
                      ),
                    );
                  },
                  verticalPadding: size.height * 0.018,
                  borderRadius: 12,
                ),
                SizedBox(height: size.height * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
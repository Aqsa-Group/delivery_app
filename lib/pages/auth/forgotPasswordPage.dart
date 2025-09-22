import 'package:flutter/material.dart';
import 'package:delivery_app/components/signUpComponent/textField.dart';
import '../../components/dividerSection.dart';
import '../../components/gradienBotton.dart';
import '../../components/headerSction.dart';
import 'newPasswordPage.dart';
import 'package:delivery_app/constants/colors.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
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
                "فراموشی رمز",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              Text(
                "لطفاً شماره تماس خود را وارد کنید تا کد تاییدیه به آن ارسال شود برای ساخت رمز جدید.",
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              buildTextField(
                Tcontroller: phoneController,
                hint: "شماره تماس خود را وارد نمایید...",
                label: "شماره تماس",
                prefixSvg: "assets/icons/user.svg",
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: size.height * 0.04),
              GradientButton(
                text: "تأیید",
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPasswordScreen()));
                },
                verticalPadding: size.height * 0.018,
                borderRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
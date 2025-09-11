import 'package:delivery_app/constants/colors.dart';
import 'package:delivery_app/pages/loginPage.dart';
import 'package:flutter/material.dart';
import '../components/dividerSection.dart';
import '../components/gradienBotton.dart';
import '../components/headerSction.dart';
import '../components/signUpComponent/textField.dart';
import 'OtpVerificationPage.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool agree = false;
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;
  bool passwordError = false;

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmController = TextEditingController();

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
              headerSction(size),
              SizedBox(height: size.height * 0.02),
              divider(),
              SizedBox(height: size.height * 0.02),
              const Text(
                "ثبت نام",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: size.height * 0.02),
              buildTextField(
                Tcontroller: nameController,
                hint: "نام خود را وارد نمایید...",
                label: "نام کاربر",
                prefixSvg: 'assets/svg/user.svg',
              ),
              SizedBox(height: size.height * 0.01),
              buildTextField(
                Tcontroller: phoneNumberController,
                hint: "شماره تماس خود را وارد نمایید...",
                label: "شماره تماس",
                keyboardType: TextInputType.phone,
                prefixSvg: 'assets/svg/call.svg',
              ),
              SizedBox(height: size.height * 0.01),
              buildTextField(
                Tcontroller: passwordController,
                hint: "رمز عبور خود را وارد نمایید...",
                label: "رمز عبور",
                prefixSvg: "assets/svg/lock.svg",
                suffixSvg: "assets/svg/eye-slash.svg",
                onSuffixTap: () {
                  setState(() {
                    obscurePassword = !obscurePassword;
                  });
                },
                obscureText: obscurePassword,
              ),
              SizedBox(height: size.height * 0.01),
              buildTextField(
                Tcontroller: passwordConfirmController,
                hint: "رمز عبور خود را تایید نمایید...",
                label: "تایید رمز عبور",
                prefixSvg: "assets/svg/lock.svg",
                suffixSvg: "assets/svg/eye-slash.svg",
                onSuffixTap: () {
                  setState(() {
                    obscureConfirmPassword = !obscureConfirmPassword;
                  });
                },
                obscureText: obscureConfirmPassword,
                error: passwordError,
                errorText: "رمز عبور اشتباه وارد کرده اید",
              ),
              SizedBox(height: size.height * 0.01),
              Row(
                children: [
                  Checkbox(
                    activeColor: const Color(0xFF1F4E68),
                    value: agree,
                    onChanged: (val) {
                      setState(() {
                        agree = val ?? false;
                      });
                    },
                  ),
                  const Expanded(
                    child: Text.rich(
                      TextSpan(
                        text: "با ",
                        children: [
                          TextSpan(
                            text: "قوانین و مقررات ",
                            style: TextStyle(color: Colors.blue),
                          ),
                          TextSpan(
                            text: "دلیوری اقصی موافق هستم",
                          ),
                        ],
                      ),
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              GradientButton(
                text: "ثبت نام",
                onPressed: () {
                  setState(() {
                    if (passwordController.text !=
                        passwordConfirmController.text) {
                      passwordError = true;
                    } else {
                      passwordError = false;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OtpVerificationScreen(
                            phoneNumber: phoneNumberController.text,
                          ),
                        ),
                      );
                    }
                  });
                },
                verticalPadding: size.height * 0.018,
                borderRadius: 10,
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                child: const Text.rich(
                  TextSpan(
                    text: "قبلا ثبت نام کرده اید؟ ",
                    style: TextStyle(color: Colors.black87),
                    children: [
                      TextSpan(
                        text: "ورود",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
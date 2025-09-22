import 'package:delivery_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:delivery_app/components/signUpComponent/textField.dart';
import '../../components/gradienBotton.dart';
import '../../components/headerSction.dart';

import 'forgotPasswordPage.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool obscurePassword = true;
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    phoneNumber.dispose();
    passwordController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  // widget for both email and phone form
  Widget _buildLoginForm({required bool isEmail, required Size size}) {
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: size.height * 0.02),
          buildTextField(
            Tcontroller: phoneNumber,
            hint:
                isEmail
                    ? "ایمیل خود را وارد نمایید..."
                    : "شماره تماس خود را وارد نمایید...",
            label: isEmail ? "ایمیل" : "شماره تماس",
            prefixSvg: isEmail ? "assets/svg/sms.svg" : "assets/svg/call.svg",
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.phone,
          ),
          SizedBox(height: size.height * 0.015),
          buildTextField(
            Tcontroller: passwordController,
            hint: "رمز عبور خود را وارد نمایید...",
            label: "رمز عبور",
            prefixSvg: "assets/svg/lock.svg",
            suffixSvg:
                obscurePassword
                    ? "assets/svg/eye-slash.svg"
                    : "assets/svg/eye.svg",
            onSuffixTap: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
            obscureText: obscurePassword,
          ),
          SizedBox(height: size.height * 0.001),
          // For forgetting password text
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ForgotPasswordPage()),
                );
              },
              child: const Text(
                "رمز خود را فراموش کرده‌اید؟",
                style: TextStyle(color: Colors.blue),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.015),

          // Ok bottom
          GradientButton(
            text: "ورود",
            onPressed: () {},
            verticalPadding: size.height * 0.018,
            borderRadius: 10,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final double tabHeight = size.height * 0.55;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: kBackColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: size.height * 0.05),

                //Header Section that contain logo and welcome text
                headerSection(size),
                SizedBox(height: size.height * 0.02),
                // Tab bar section
                TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  controller: _tabController,
                  indicatorColor: const Color(0xFF1F4E68),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    //Tab for login with phone section
                    Tab(text: "ورود با شماره تماس"),

                    //Tab for login with email section
                    Tab(text: "ورود با ایمیل"),
                  ],
                ),
                SizedBox(height: size.height * 0.02),
                SizedBox(
                  height: tabHeight,
                  child:
                  //Tab view that show as tabs
                  TabBarView(
                    controller: _tabController,
                    children: [
                      SingleChildScrollView(
                        child: _buildLoginForm(isEmail: false, size: size),
                      ),
                      SingleChildScrollView(
                        child: _buildLoginForm(isEmail: true, size: size),
                      ),
                    ],
                  ),
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

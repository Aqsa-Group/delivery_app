import 'package:delivery_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'dart:async';
import '../components/dividerSection.dart';
import '../components/gradienBotton.dart';
import '../components/headerSction.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  const OtpVerificationScreen({super.key, required this.phoneNumber});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpController = TextEditingController();
  int _seconds = 120;
  Timer? _timer;
  bool hasError = false;
  bool isVerified = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _seconds = 120;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        setState(() {
          _seconds--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _verifyCode() {
    if (otpController.text == "123456") {
      setState(() {
        isVerified = true;
        hasError = false;
      });
      print("کد تأیید شnه");
    } else {
      setState(() {
        hasError = true;
        isVerified = false;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final minutes = (_seconds ~/ 60).toString().padLeft(1, '0');
    final seconds = (_seconds % 60).toString().padLeft(2, '0');

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
                "کد تأییدیه",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.015),
              Text.rich(
                TextSpan(
                  text: "کد تأییدیه 6 رقمی به شماره ",
                  style: const TextStyle(fontSize: 14),
                  children: [
                    TextSpan(
                      text: widget.phoneNumber,
                      style: const TextStyle(color: Colors.blue),
                    ),
                    const TextSpan(text: " ارسال شده را وارد نمایید."),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
              SizedBox(height: size.height * 0.03),
              Directionality(
                textDirection: TextDirection.ltr,
                child: PinCodeTextField(
                  appContext: context,
                  length: 6,
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  animationType: AnimationType.scale,

                  pinTheme: PinTheme(
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(10),
                    fieldHeight: size.width * 0.12,
                    fieldWidth: size.width * 0.12,
                    inactiveColor:
                        hasError
                            ? Colors.red
                            : isVerified
                            ? Colors.green
                            : Colors.grey,
                    activeColor:
                        hasError
                            ? Colors.red
                            : isVerified
                            ? Colors.green
                            : const Color(0xFF1F4E68),
                    selectedColor:
                        hasError
                            ? Colors.red
                            : isVerified
                            ? Colors.green
                            : Colors.blue,
                    errorBorderColor: Colors.red,
                  ),
                  onChanged: (value) {
                    print("OTP Changed: $value");
                    if (hasError) {
                      setState(() {
                        hasError = false;
                      });
                    }
                    if (value.length == 6) {
                      _verifyCode();
                    }
                  },
                ),
              ),
              SizedBox(height: size.height * 0.02),

              Align(
                alignment: Alignment.centerRight,
                child:
                    _seconds > 0
                        ? Text(
                          "$minutes:$seconds ارسال مجدد کد",
                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        )
                        : GestureDetector(
                          onTap: () {
                            print("ارسال مجدد کد کلیک شد");
                            _startTimer();
                          },
                          child: const Text(
                            "ارسال مجدد کد",
                            style: TextStyle(color: Colors.blue, fontSize: 14),
                          ),
                        ),
              ),

              SizedBox(height: size.height * 0.03),
              GradientButton(
                text: "تأیید",
                onPressed: () {
                  _verifyCode();
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

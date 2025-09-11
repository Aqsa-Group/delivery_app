import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget buildTextField({
  required TextEditingController Tcontroller,
  required String hint,
  required String label,
  required String prefixSvg,
  String? suffixSvg,
  VoidCallback? onSuffixTap,
  bool obscureText = false,
  TextInputType keyboardType = TextInputType.text,
  bool error = false,
  String? errorText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: error ? Colors.red : Colors.black,
        ),
      ),
      const SizedBox(height: 6),
      TextField(
        controller: Tcontroller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        style: TextStyle(color: error ? Colors.red : Colors.black),
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Padding(
            padding: const EdgeInsets.all(12.0),
            child: SvgPicture.asset(
              prefixSvg,
              colorFilter: ColorFilter.mode(

                error ? Colors.red : const Color(0xFF1F4E68),
                BlendMode.srcIn,
              ),
              width: 20,
              height: 20,
            ),
          ),
          suffixIcon:
              suffixSvg != null
                  ? GestureDetector(
                    onTap: onSuffixTap,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SvgPicture.asset(
                        suffixSvg,
                        colorFilter: ColorFilter.mode(
                          error ? Colors.red : const Color(0xFF1F4E68),
                          BlendMode.srcIn,
                        ),
                        width: 20,
                        height: 20,
                      ),
                    ),
                  )
                  : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: error ? Colors.red : Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: error ? Colors.red : const Color(0xFF1F4E68),
              width: 1.5,
            ),
          ),
        ),
      ),
      if (error && errorText != null)
        Padding(
          padding: const EdgeInsets.only(top: 5, right: 4),
          child: Text(
            errorText,
            style: const TextStyle(color: Colors.red, fontSize: 12),
          ),
        ),
    ],
  );
}

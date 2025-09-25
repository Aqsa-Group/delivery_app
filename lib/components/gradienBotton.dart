import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final double? verticalPadding;
  final bool isSubmitting;
  final List<Color>? colors;
  final double borderRadius;
  final double? width;

  const GradientButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.verticalPadding,
    this.isSubmitting = false,
    this.colors,
    this.borderRadius = 12,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      width: width ?? double.infinity,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          gradient: LinearGradient(
            colors: colors ?? [Color(0xFF1F4E68), Color(0xFF4CA9DF)],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 3),
            )
          ],
        ),
        child: ElevatedButton(
          onPressed: isSubmitting ? null : onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: EdgeInsets.symmetric(
              vertical: verticalPadding ?? size.height * 0.018,
            ),
          ),
          child: isSubmitting
              ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
              strokeWidth: 2.2,
            ),
          )
              : Text(
            text,
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
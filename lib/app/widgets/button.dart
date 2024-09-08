import 'package:flutter/material.dart';
import 'package:rivinha_fitness/app/theme/my_colors.dart';

class Button extends StatefulWidget {
  const Button(
      {super.key,
      this.onPressed,
      required this.title,
      this.titleColor = MyColors.white,
      this.bgColor = MyColors.green500});

  final void Function()? onPressed;
  final String title;
  final Color? titleColor;
  final Color? bgColor;

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.bgColor,
        minimumSize: const Size.fromHeight(60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
      child: Text(
        widget.title,
        style: TextStyle(color: widget.titleColor, fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
  }
}

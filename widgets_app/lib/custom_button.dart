import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String msg;
  final Function onPressed;

   const CustomButton({Key? key, required this.msg, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      child: Text(msg),
    );
  }
}

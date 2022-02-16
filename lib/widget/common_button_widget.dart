import 'dart:ffi';

import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String? text;
  final Color? bgColor, textColor;
  final void Function()? onPressed;

  const CommonButton(
      {Key? key, this.text, this.bgColor, this.textColor, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
          minimumSize: const Size(200, 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(26))),
      onPressed:onPressed,
      child: Text(
        text ?? '',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}

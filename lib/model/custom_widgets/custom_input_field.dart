import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  CustomInputField({@required this.hint, @required this.controller});

  final String hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
          width: MediaQuery.of(context).size.width * 60 / 100,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black), color: Colors.grey[200]),
          child: TextField(
            textAlign: TextAlign.center,
            controller: this.controller,
            decoration:
                InputDecoration(border: InputBorder.none, hintText: this.hint),
          )),
    );
  }
}

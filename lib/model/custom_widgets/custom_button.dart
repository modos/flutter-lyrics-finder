import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({@required this.text, @required this.onPressed});

  final String text;
  final GestureTapCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 60 / 100,
      child: RawMaterialButton(
          fillColor: Colors.blue[900],
          splashColor: Colors.blue[500],
          child: Center(
              child: Text(
            this.text,
            style: TextStyle(color: Colors.white),
          )),
          onPressed: this.onPressed),
    );
  }
}

import 'package:flutter/material.dart';

class buttonForm extends StatefulWidget {
  final String nombre;
  final Function function;
  const buttonForm({super.key, required this.nombre, required this.function});

  @override
  State<buttonForm> createState() => _buttonFormState();
}

class _buttonFormState extends State<buttonForm> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff0071BC),
          padding: EdgeInsets.only(top: 12, left: 22, right: 22, bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
      onPressed: () {
        widget.function(context);
      },
      child: Text(
        widget.nombre,
        style: TextStyle(fontFamily: "Nunito", fontSize: 24.0),
      ),
    );
  }
}
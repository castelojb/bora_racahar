import 'package:flutter/material.dart';


class NumericInput extends StatefulWidget {

  final String hint;
  final void Function(String) callback;
  NumericInput(this.hint, this.callback);


  @override
  _NumericInputState createState() => _NumericInputState();
}

class _NumericInputState extends State<NumericInput> {

  final txtCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(

      controller: txtCtrl,
      keyboardType: TextInputType.number,
      style: TextStyle(
        color: Colors.blueAccent,
        fontSize: 18
      ),
      decoration: InputDecoration(
        labelText: widget.hint,
        labelStyle: TextStyle(
          color: Colors.blueAccent
        )
      ),
      onChanged: widget.callback,
    );
  }
}

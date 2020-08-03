import 'package:flutter/material.dart';

class MyTextInput extends StatelessWidget {
  final FocusNode focusNode;
  final String label;
  final Function submitHandler;
  final TextInputType keyboardType;
  final Function onSavedHandler;
  final Function validator;

  const MyTextInput({
    @required this.focusNode,
    @required this.label,
    this.submitHandler,
    this.keyboardType = TextInputType.text, // Default Value
    this.onSavedHandler,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: TextFormField(
        decoration: InputDecoration(labelText: label),
        focusNode: focusNode,
        onFieldSubmitted: submitHandler,
        keyboardType: keyboardType,
        onSaved: onSavedHandler,
        validator: validator,
      ),
    );
  }
}

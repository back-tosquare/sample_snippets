import 'package:flutter/material.dart';

import './MyTextInput.dart';

class BasicForm extends StatefulWidget {
  @override
  _BasicFormState createState() => _BasicFormState();
}

class _BasicFormState extends State<BasicForm> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  final GlobalKey<FormState> _myFormKey = GlobalKey<FormState>();

  Map<String, String> myFormValue = {
    "name": "",
    "description": "",
    "age": "",
  };

  void dispose() {
    _nameFocusNode.dispose();
    _ageFocusNode.dispose();

    super.dispose();
  }

  void formSaveHandler() {
    _myFormKey.currentState.save();
    debugPrint("$myFormValue");
  }

  void focusChangeTo(BuildContext context, FocusNode toFocus) {
    FocusScope.of(context).requestFocus(toFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _myFormKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyTextInput(
              label: "Enter Name",
              focusNode: _nameFocusNode,
              submitHandler: (_) {
                focusChangeTo(context, _descriptionFocusNode);
              },
              onSavedHandler: (value) {
                myFormValue["name"] = value;
              },
            ),
            MyTextInput(
              label: "Enter Description",
              focusNode: _descriptionFocusNode,
              submitHandler: (_) {
                focusChangeTo(context, _ageFocusNode);
              },
              onSavedHandler: (value) {
                myFormValue["description"] = value;
              },
            ),
            MyTextInput(
              label: "Enter Age",
              focusNode: _ageFocusNode,
              keyboardType: TextInputType.number,
              submitHandler: (_) {
                formSaveHandler();
              },
              onSavedHandler: (value) {
                myFormValue["age"] = value;
              },
            ),
          ],
        ),
      ),
    );
  }
}

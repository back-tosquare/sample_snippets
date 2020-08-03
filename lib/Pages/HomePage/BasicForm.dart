import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../../models/providers/FormValue.dart';

import './MyTextInput.dart';

class BasicForm extends StatefulWidget {
  @override
  _BasicFormState createState() => _BasicFormState();
}

class _BasicFormState extends State<BasicForm> {
  final FocusNode _nameFocusNode = FocusNode();
  final FocusNode _ageFocusNode = FocusNode();
  final FocusNode _descriptionFocusNode = FocusNode();

  void dispose() {
    _nameFocusNode.dispose();
    _ageFocusNode.dispose();
    _descriptionFocusNode.dispose();

    super.dispose();
  }

  String genericValidator(String value) {
    return (value.isEmpty) ? "Enter a Value" : null;
  }

  @override
  Widget build(BuildContext context) {
    FormValue formProvider = Provider.of<FormValue>(context, listen: false);

    return Form(
      key: formProvider.formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MyTextInput(
              label: "Enter Name",
              focusNode: _nameFocusNode,
              submitHandler: (_) {
                formProvider.focusChangeTo(context, _descriptionFocusNode);
              },
              onSavedHandler: (value) => formProvider.setValue("name", value),
              validator: (value) => genericValidator(value),
            ),
            MyTextInput(
              label: "Enter Description",
              focusNode: _descriptionFocusNode,
              submitHandler: (_) =>
                  formProvider.focusChangeTo(context, _ageFocusNode),
              onSavedHandler: (value) =>
                  formProvider.setValue("description", value),
              validator: (value) => genericValidator(value),
            ),
            MyTextInput(
              label: "Enter Age",
              focusNode: _ageFocusNode,
              keyboardType: TextInputType.number,
              submitHandler: (_) => formProvider.formSubmitHandler(),
              onSavedHandler: (value) => formProvider.setValue("age", value),
              validator: (value) => genericValidator(value),
            ),
          ],
        ),
      ),
    );
  }
}

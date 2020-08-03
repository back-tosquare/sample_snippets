import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import '../../models/providers/FormValue.dart';

import './BasicForm.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                FormValue formProvider =
                    Provider.of<FormValue>(context, listen: false);
                formProvider.formSubmitHandler();
              }),
        ],
      ),
      body: BasicForm(),
    );
  }
}

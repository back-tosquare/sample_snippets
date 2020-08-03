import 'package:flutter/material.dart';

class FormValue with ChangeNotifier {
  final Map<String, String> _myFormValue = {
    "name": "",
    "description": "",
    "age": "",
  };

  final GlobalKey<FormState> _myFormKey = GlobalKey<FormState>();

  void setValue(String key, String value) {
    _myFormValue[key] = value;
    notifyListeners();
  }

  void focusChangeTo(BuildContext context, FocusNode toFocus) {
    FocusScope.of(context).requestFocus(toFocus);
  }

  Map<String, String> get formValue {
    return _myFormValue;
  }

  GlobalKey<FormState> get formKey {
    return _myFormKey;
  }

  void formSubmitHandler() {
    bool validateStatus = _myFormKey.currentState.validate();

    if (validateStatus) {
      _myFormKey.currentState.save();
    }

    if (validateStatus) {
      debugPrint("$_myFormValue");
    }
  }
}

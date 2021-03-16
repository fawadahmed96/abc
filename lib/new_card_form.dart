import 'dart:math';
import 'package:intl/intl.dart';
import 'package:blog_app/custom_widgets/custom_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pattern_formatter/pattern_formatter.dart';

class NewCardForm extends StatefulWidget {
  @override
  _NewCardFormState createState() => _NewCardFormState();
}

class _NewCardFormState extends State<NewCardForm> {
  String valueChoose1;
  List listItem = ["Customer 1", "Customer 2", "Customer 3"];

  final formKey = GlobalKey<FormState>();
  final textController = TextEditingController();
  final passwordController = TextEditingController();

  void validate() {
    if (formKey.currentState.validate()) {
      print("validate");
    } else
      print("not validated");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            autovalidate: false,
//            autovalidateMode: AutovalidateMode.disabled,
            key: formKey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Text(
                    "Add New Card",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  DropdownButton(
                    hint: Text("choose customer: "),
                    value: valueChoose1,
                    onChanged: (newValue) {
                      setState(() {
                        valueChoose1 = newValue;
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  TextFormField(
                    inputFormatters: [
                      MaskedTextInputFormatter(
                        mask: 'xxxx-xxxx-xxxx-xxxx',
                        separator: '-',
                      ),
                    ],
                    decoration: InputDecoration(
                      labelText: "card number",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "can't be empty!!";
                      } else if (value.length != 19) {
                        return "19 digits required";
                      } else {
                        return null;
                      }
                    },
                    controller: textController,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    inputFormatters: [
                      MaskedDateTextInputFormatter(
                        mask: 'xx/xxxx',
                        separator: '/',
                      ),
                    ],
                    decoration: InputDecoration(
                        labelText: "expiry", hintText: "MM/YYYY"),
                    keyboardType: TextInputType.datetime,
                    onChanged: (value) {},
                    validator: (value) {
                      RegExp date =
                          RegExp(r'^[1-9]+\/([2000-9999]+)$'); //mm/dd/yyyy
                      List<String> sp = value.split("/");
                      if (date.hasMatch(value)) {
                        if (int.parse(sp[0]) >= 12 || int.parse(sp[0]) < 1) {
                          if (int.parse(sp[1]) < 2000) {
                            return "InValid Expiry";
                          }
                        }

                        if (value.isEmpty) {
                          return "Can't be empty";
                        } else {
                          return null;
                        }
                      } else {
                        return "InValid Pattern";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "Name On Card",
                    ),
                    keyboardType: TextInputType.name,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "cvv/cvc number",
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Can't be empty";
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RaisedButton(
                    onPressed: validate,
                    child: Text("Submit"),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100.0, vertical: 15.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MaskedTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedTextInputFormatter({
    @required this.mask,
    @required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

class MaskedDateTextInputFormatter extends TextInputFormatter {
  final String mask;
  final String separator;

  MaskedDateTextInputFormatter({
    @required this.mask,
    @required this.separator,
  }) {
    assert(mask != null);
    assert(separator != null);
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length > 0) {
      //  newValue.text.replaceAll("-", " ");
      print("gg " + newValue.text);
      if (newValue.text.length > oldValue.text.length) {
        if (newValue.text.length > mask.length) return oldValue;
        if (newValue.text.length < mask.length &&
            mask[newValue.text.length - 1] == separator) {
          return TextEditingValue(
            text:
                '${oldValue.text}$separator${newValue.text.substring(newValue.text.length - 1)}',
            selection: TextSelection.collapsed(
              offset: newValue.selection.end + 1,
            ),
          );
        }
      }
    }
    return newValue;
  }
}

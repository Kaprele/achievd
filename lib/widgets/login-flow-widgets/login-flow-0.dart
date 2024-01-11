import 'package:achievd/widgets/login-flow-widgets/flow-content.dart';
import 'package:achievd/widgets/login-flow-widgets/phonenumber-textfield.dart';
import 'package:flutter/material.dart';

class LoginFlow0 extends StatefulWidget {
  LoginFlow0(
      {super.key,
      required this.handlePhoneNumber,
        required this.country,
        required this.number,
      });

  String country;
  String number;
  final void Function(String) handlePhoneNumber;
  @override
  State<LoginFlow0> createState() => _LoginFlow0State();
}

class _LoginFlow0State extends State<LoginFlow0> {
  RegExp phoneNumberRegex = RegExp(r'\+[0-9]{12}');

  //todo remove debug values
  String? error;

  void checkNumber(String value) {
    widget.number = value;
    print(widget.country + widget.number );
    if (phoneNumberRegex.hasMatch(widget.country + widget.number)) {
      setState(() {
        error = null;
      });
      print('${widget.country} ${widget.number}');
      widget.handlePhoneNumber('${widget.country} ${widget.number}');
    } else {
      setState(() {
        error = "Please enter a valid phone number";
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return FlowContent(
      title: 'Welcome back then!',
      description: 'Please enter your Phonenumber',
      buttonText: 'Verify',
      callback: () => checkNumber(widget.number),
      content: PhonenumberTextfield(
         number: widget.number,
          country:widget.country,
        checkNumber: checkNumber,
        error: error,
        enabled: true,
      ),
    );
  }
}

import 'package:achievd/widgets/login-flow-widgets/phonenumber-textfield.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'flow-content.dart';

class RegistrationFlow1 extends StatefulWidget {
  RegistrationFlow1(
      {super.key, required this.name, required this.handlePhoneNumber});

  final String name;
  final void Function(String) handlePhoneNumber;

  @override
  State<RegistrationFlow1> createState() => _RegistrationFlow1State();
}

class _RegistrationFlow1State extends State<RegistrationFlow1> {
  String country = '';
  String number = '';

  RegExp phoneNumberRegex = RegExp(r'\+[0-9]*');

  String? error;

  void checkNumber(String value) {
    if (phoneNumberRegex.hasMatch(country + number)) {
      print("valid number");
      setState(() {
        error = null;
      });
      widget.handlePhoneNumber('$country $number');
    } else {
      setState(() {
        error = "Please enter a valid phone number";
      });
    }
  }

  void handleNumber(String value) {
    print(value);
    setState(() {
      number = value;
    });
  }

  void handleCountry(String value) {
    print('submitted: $value');
    setState(() {
      country = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlowContent(
      title: 'Hi ${widget.name}!',
      description: 'Please enter your phone number to create an account',
      buttonText: 'Send me a code',
      callback: () => checkNumber(country + number),
      content: PhonenumberTextfield(
        enabled: true,
        handleNumber: handleNumber,
        handleCountry: handleCountry,
        country: country,
        number: number,
        error: error,
      ),
    );
  }
}

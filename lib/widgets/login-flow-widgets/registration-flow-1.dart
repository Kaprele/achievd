import 'package:achievd/widgets/login-flow-widgets/phonenumber-textfield.dart';
import 'package:flutter/material.dart';
import '../FlowContent.dart';

class RegistrationFlow1 extends StatefulWidget {
  RegistrationFlow1(
      {super.key, required this.name, required this.handlePhoneNumber});

  final String name;
  final void Function(String) handlePhoneNumber;

  @override
  State<RegistrationFlow1> createState() => _RegistrationFlow1State();
}

class _RegistrationFlow1State extends State<RegistrationFlow1> {
  //todo remove debug values
  String country = '+44';
  String number = '7123123456';

  RegExp phoneNumberRegex = RegExp(r'\+[0-9]{12}');

  String? error;

  void checkNumber(String value) {
    number = value;
    print(country + number );
    if (phoneNumberRegex.hasMatch(country + number)) {
      setState(() {
        error = null;
      });
      print('$country $number');
      widget.handlePhoneNumber('$country $number');
    } else {
      setState(() {
        error = "Please enter a valid phone number";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlowContent(
      title: 'Hi ${widget.name}!',
      description: 'Please enter your phone number to create an account',
      buttonText: 'Send me a code',
      callback: () => checkNumber(number),
      content: PhonenumberTextfield(
        enabled: true,
        checkNumber: checkNumber,
        country: country,
        number: number,
        error: error,
      ),
    );
  }
}

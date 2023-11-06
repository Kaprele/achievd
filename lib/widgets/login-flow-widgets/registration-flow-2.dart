import 'package:achievd/widgets/login-flow-widgets/phonenumber-textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../FlowContent.dart';

class RegistrationFlow2 extends StatelessWidget {
  RegistrationFlow2(
      {super.key,
      required this.name,
      required this.handleVerificationCode,
      required this.number,
      required this.countryCode,
      required this.verificationCode});

  final String name;
  final void Function(String) handleVerificationCode;
  String verificationCode;
  final String number;
  final String countryCode;

  @override
  Widget build(BuildContext context) {
    return FlowContent(
      title: 'Hi $name!',
      description: 'Please enter your phone number to create an account',
      buttonText: 'Verify',
      callback: () => handleVerificationCode(verificationCode),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PhonenumberTextfield(
            checkNumber: (value) => {},
              country: countryCode,
              number: number,
              enabled: false,
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'We\'ve sent you a code to $countryCode $number. \nPlease enter it below',
              textAlign: TextAlign.left,
            ),
            //todo make this dynamic
          ),
          TextField(
            //todo: make this to 6 digits
            onChanged: (value) => verificationCode = value,
            onSubmitted: (value) => handleVerificationCode(value),
            inputFormatters: [
              FilteringTextInputFormatter(RegExp("[0-9]"), allow: true),
            ],
            controller: TextEditingController(text: verificationCode),
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your code',
            ),
          ),
        ],
      ),
    );
  }
}

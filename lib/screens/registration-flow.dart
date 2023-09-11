import 'package:achievd/util/constants.dart';
import 'package:achievd/widgets/full-width-button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widgets/FlowContent.dart';
import '../widgets/custom-scaffold.dart';

class RegistrationFlow extends StatefulWidget {
  const RegistrationFlow({super.key});

  static const String route = '/registration-flow';

  @override
  State<RegistrationFlow> createState() => _RegistrationFlowState();
}

class _RegistrationFlowState extends State<RegistrationFlow> {
  String name = '';

  String countryCode = '';

  String phoneNumber = '';

  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    nextStep(value) {
      value = name;
      if (name != '') {
        controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      }
    }



    return PageView(
      controller: controller,
      children: <Widget>[
        FlowContent(
          title: 'Let\'s get started!',
          description:
              'Firstly, how should we call you? \n This is not your username',
          first: true,
          buttonText: 'Next Step',
          callback: () => nextStep(name),
          content: TextField(
            onChanged: (value) => name = value,
            onSubmitted: (value) => nextStep(value),
            autofocus: true,
            controller: TextEditingController(text: name),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your name',
            ),
          ),
        ),
        FlowContent(
          title: 'Hi John',
          description: 'Please enter your phone number to create an account',
          buttonText: 'Send me a code',
          callback: () => {},
          content: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 66, //todo make this dynamic
                child: TextField(
                  onChanged: (value) => countryCode = value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16,  ),
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Code',
                  ),
                ),
              ),
              const SizedBox(width: 16),
              SizedBox(
                width: MediaQuery.of(context).size.width -32 - 72  - 16, //todo make this dynamic
                child: TextField(
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Your phone number',
                  ),
                ),
              ),
            ],
          ),
        ),
        FlowContent(
          title: 'Enter the code',
          description: 'We\'ve sent you a code to verify your phone number',
          buttonText: 'Verify',
          callback: () => {},
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your code',
            ),
          ),
        ),
        FlowContent(
          title: 'Let\'s find a username for you',
          description: 'It\'s a unique identifier for your friends to find you',
          buttonText: 'Take me to the last step',
          callback: () => {},
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your phone number',
            ),
          ),
        ),
        FlowContent(
          title: 'Sorry about the legal stuff',
          description: 'For legal reasons we need your birthday. \n Just to make sure you\'re old enough to use achievd',
          buttonText: 'Let\'s goooo!',
          callback: () => {},
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Your phone number',
            ),
          ),
        ),
      ],
    );
  }
}

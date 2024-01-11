import 'package:achievd/screens/main-screen.dart';
import 'package:achievd/widgets/login-flow-widgets/registration-flow-2.dart';
import 'package:achievd/widgets/login-flow-widgets/registration-flow-0.dart';
import 'package:achievd/widgets/login-flow-widgets/registration-flow-1.dart';
import 'package:achievd/widgets/login-flow-widgets/registration-flow-4.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../widgets/login-flow-widgets/registration-flow-3.dart';

class RegistrationFlow extends StatefulWidget {
  const RegistrationFlow({super.key});

  static const String route = '/registration-flow';

  @override
  State<RegistrationFlow> createState() => _RegistrationFlowState();
}

class _RegistrationFlowState extends State<RegistrationFlow> {
  String name = 'Gabi';
  String phoneNumber = '';
  String verificationCode = '';
  String username = 'kaprele';
  DateTime birthday = DateTime.now();
  RegExp phoneNumberRegex = RegExp(r'\+[0-9]{12}');
  //todo remove debug values
  String number = '7123123456';
  String country = '+44';

  String verificationId = '';

  bool reachedUsername = false;

  PageController controller = PageController(
    initialPage: 0,
  );

  // change goBack behaviour
  //todo: make things responsive
  //todo: do the whole authentification thing
  // make go back impossible
  //todo: make scrolling without values impossible
  //todo: save user in db
  //todo:

  @override
  Widget build(BuildContext context) {
    void handleName(String value) {
      name = value;
      if (name != '') {
        controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
        //todo: save name of user
      }
    }

    handlePhoneNumber(String value) async {
      phoneNumber = value;
      country = value.substring(0, 3);
      number = value.substring(3);
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        //todo: remove debug value
        verificationCompleted: (PhoneAuthCredential credential) async {
          //android only
          print(' verification completed');
          await FirebaseAuth.instance.signInWithCredential(credential);
          print('signed in');
          controller.animateToPage(3,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e);
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          print('code sent');
          controller.animateToPage(2,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print('code auto retrieval timeout');
        },
      );
    }

    handleVerificationCode(value) async {
      verificationCode = value;
      if (verificationCode != '') {
        print(verificationCode); //todo: remove debug value
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: verificationId, smsCode: verificationCode);

        await FirebaseAuth.instance.signInWithCredential(credential);
        if (FirebaseAuth.instance.currentUser != null) {
          controller.animateToPage(3,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
        } else {
          print('something went wrong');
        }
      }
    }

    handleUsername(value) {
      value = username;
      if (username != '') {
        FirebaseAuth.instance.currentUser!.updateDisplayName(username);
        //todo: what happens with double usernames?
        controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
      }
    }

    handleBirthday(value) {
      birthday = value;
      Navigator.removeRouteBelow(context, ModalRoute.of(context)!);
      Navigator.pushReplacementNamed(context, MainScreen.route);
    }

    return PageView(
      controller: controller,
      onPageChanged: (value) {
        if (value == 3) reachedUsername = true;
        if (reachedUsername && value < 3) {
          controller.animateToPage(3,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeIn);
          if (value == 2) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You can\'t go back there'),
                duration: Duration(milliseconds: 500),
              ),
            );
          }
        }
      },
      children: <Widget>[
        RegistrationFlow0(
          handleName: (name) => handleName(name),
          name: name,
        ),
        RegistrationFlow1(
          name: name,
          handlePhoneNumber: (phoneNumber) => handlePhoneNumber(phoneNumber),
        ),
        RegistrationFlow2(
          name: name,
          handleVerificationCode: handleVerificationCode,
          number: number,
          countryCode: country,
          verificationCode: verificationCode,
        ),
        RegistrationFlow3(handleUsername: handleUsername,username: username),
        RegistrationFlow4(handleBirthday: handleBirthday, ),
      ],
    );
  }
}

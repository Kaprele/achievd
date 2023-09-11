import 'package:flutter/cupertino.dart';

class LoginFlow extends StatelessWidget {
  const LoginFlow({super.key});
  static const String route = '/login-flow';

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: <Widget>[
        Center(
          child: Text('Login'),
        ),
        Center(
          child: Text('Register'),
        ),
      ],
    );
  }
}

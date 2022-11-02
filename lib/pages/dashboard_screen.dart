import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard';

  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  Future<void> _goToLogin(BuildContext context) {
    return Navigator.of(context).pushReplacementNamed('/login').then((_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesomeIcons.rightFromBracket),
            onPressed: () async {
              if (await confirm(
                context,
                title: const Text('Logout'),
                content: const Text('Would you like to logout?'),
                textOK: const Text('Logout'),
                textCancel: const Text('No'),
              )) {
                _goToLogin(context);
              }
            },
          )
        ]));
  }
}

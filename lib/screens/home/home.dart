import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/brew.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/screens/home/settings_form.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:flutter_firebase/services/database.dart';
import 'package:provider/provider.dart';

import 'brew_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: StreamProvider<UserData>.value(
                value: DatabaseService(uid: user.uid).userData,
                child: SettingsForm(),
              ),
            );
          });
    }

    return StreamProvider<List<Brew>>.value(
      value: DatabaseService().brows,
      child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Brew Crew'),
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
                onPressed: () => _showSettingsPanel(),
                icon: Icon(Icons.settings),
                label: Text('settings'))
          ],
        ),
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/coffee_bg.png'),
              fit: BoxFit.cover,
              ),
            ),
            child: brewList()),
      ),
    );
  }
}

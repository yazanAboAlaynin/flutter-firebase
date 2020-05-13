import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/user.dart';
import 'package:flutter_firebase/screens/authenticate/authenticate.dart';
import 'package:provider/provider.dart';
import 'authenticate/sign_in.dart';
import 'home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    // return either home or auth widget
    if(user == null) {
      return Authenticate();
    }
    else{
      return Home();
    }
  }
}

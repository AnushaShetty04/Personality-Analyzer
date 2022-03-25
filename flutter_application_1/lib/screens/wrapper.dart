
import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/myuser.dart';
import 'package:flutter_application_1/screens/authenticate/authenticate.dart';
import 'package:flutter_application_1/screens/home/home.dart';

import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // final user = Provider.of<MyUser?>(context);
    // print(user);
    
    // // return either the Home or Authenticate widget
    // if (user == null){
    //   return Authenticate();
    // } else {
    //   return Home();
    // }
    
    final user =Provider.of<MyUser?>(context);
     if (user== null){
      return Authenticate();
    } else {
      return Home();
    }
    
  }
}
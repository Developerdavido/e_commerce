import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/pages/splash.dart';
import 'package:ecommerce/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(builder: (_) => UserProvider.initialize(),
       child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.red.shade900
          ),
          home: ScreensController(),
       ),));
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    switch(user.status){
      case Status.Uninitialized:
      case Status.Unauthenticated:
      case Status.Authenticated:
        return Login();
      case Status.Authenticated:
        return HomePage();
      default: return Login();
    }
  }
}





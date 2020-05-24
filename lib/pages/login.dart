import 'package:ecommerce/commons/common.dart';
import 'package:ecommerce/commons/loading.dart';
import 'package:ecommerce/pages/signup.dart';
import 'package:ecommerce/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/pages/home.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  //creating a form key for the form
  final formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  // creating the textEditController to handle inputs
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      key: _key,
      body: user.status == Status.Authenticating ? Loading() : Stack(

        children: <Widget>[
//          Image.asset(
//            'images/back.jpg',
//          fit: BoxFit.cover,
//          width: double.infinity,
//          ),
          Container(
            color: Colors.black.withOpacity(0.4),
            width: double.infinity,
            height: double.infinity,
          ),

          Container(
            alignment: Alignment.topCenter,
            child: Image.asset('images/lg.png', width: 280.0, height: 240.0,),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 200.0),
              child: Center(
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white.withOpacity(0.8),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                hintText: "Email",
                                icon: Icon(Icons.email),
                            ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value){
                                if(value.isEmpty) {
                                  Pattern pattern =
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                  RegExp regex = new RegExp(pattern);
                                  if(!regex.hasMatch(value))
                                    return 'Please make sure your email address is valid';
                                  else
                                    return null;
                                }
                                return null;
                              },
                          ),
                        ),
                      )
                      ),

                      Padding(
                          padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white.withOpacity(0.8),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: TextFormField(
                                controller: password,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value){
                                  if(value.isEmpty) {
                                    return "The password field cannot be empty";
                                  }else if(value.length < 6) {
                                    return "The password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: deepOrange,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () async{
                              if(formKey.currentState.validate()){
                              if(!await user.signIn(email.text, password.text))
                                _key.currentState.showSnackBar(SnackBar(content: Text("Sign in failed"),));
                              }
                            },
                            minWidth: MediaQuery.of(context).size.width,
                            child: Text(
                                "Login", textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Forgot Password", textAlign: TextAlign.center, style: TextStyle(color: Colors.white),),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
                            },
                            child: Text("Sign up", textAlign: TextAlign.center, style: TextStyle(color: Colors.red),))
                      ),
                      Divider(color: Colors.grey,),
                      Text("other sign in options",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16.0,)
                      ),
                    ],
                  )
                ),
                ),
            ),
            ),
          Visibility(
            visible: true,
            child: Center(
              child: Container(
                alignment: Alignment.center,
                color: Colors.white.withOpacity(0.7),
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }





}

import 'package:ecommerce/commons/common.dart';
import 'package:ecommerce/commons/loading.dart';
import 'package:ecommerce/db/auth.dart';
import 'package:ecommerce/pages/home.dart';
import 'package:ecommerce/pages/login.dart';
import 'package:ecommerce/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/db/users.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  // creating google signin and auth state
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  //creating a form key for the form
  final formKey = GlobalKey<FormState>();
  final _key = GlobalKey<ScaffoldState>();
  UserServices userServices = UserServices();

  // creating the textEditController to handle inputs
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController name = TextEditingController();
  bool hidePass = true;
  Auth auth = Auth();

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Scaffold(
      key: _key,
      backgroundColor: Colors.white,
      body: user.status == Status.Authenticating ? Loading() : Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Center(
              child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.topCenter,
                              child: Image.asset(
                                'images/lg.png',
                                width: 120.0,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: name,
                                decoration: InputDecoration(
                                  hintText: "Full name",
                                  icon: Icon(Icons.person_outline),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The name field cannot be empty";
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(
                              14.0, 8.0, 14.0, 8.0),
                          child: Material(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey.withOpacity(0.2),
                            elevation: 0.0,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: ListTile(
                                title: TextFormField(
                                  controller: email,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    icon: Icon(Icons.email),
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      Pattern pattern =
                                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                      RegExp regex = new RegExp(pattern);
                                      if (!regex.hasMatch(value))
                                        return 'Please make sure your email address is valid';
                                      else
                                        return null;
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          )
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: password,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "The password has to be at least 6 characters long";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye,),
                                onPressed: () {
                                  setState(() {
                                    hidePass = false;
                                  });
                                },
                              ),
                            ),
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.withOpacity(0.2),
                          elevation: 0.0,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: ListTile(
                              title: TextFormField(
                                controller: confirmPassword,
                                obscureText: hidePass,
                                decoration: InputDecoration(
                                  hintText: "Confirm password",
                                  icon: Icon(Icons.lock_outline),
                                  border: InputBorder.none,
                                ),
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "The password field cannot be empty";
                                  } else if (value.length < 6) {
                                    return "The password has to be at least 6 characters long";
                                  } else
                                  if (password.text != value) {
                                    return "the passwords do not match";
                                  }
                                  return null;
                                },
                              ),
                              trailing: IconButton(
                                icon: Icon(Icons.remove_red_eye,),
                                onPressed: () {
                                  setState(() {
                                    hidePass = false;
                                  });
                                },

                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(
                            14.0, 8.0, 14.0, 8.0),
                        child: Material(
                          borderRadius: BorderRadius.circular(20.0),
                          color: deepOrange,
                          elevation: 0.0,
                          child: MaterialButton(
                            onPressed: () async {
                              if(formKey.currentState.validate()){
                                if(!await user.signUp(name.text, email.text, password.text))
                                  _key.currentState.showSnackBar(SnackBar(content: Text("Sign up failed"),));
                              }
                            },
                            minWidth: MediaQuery
                                .of(context)
                                .size
                                .width,
                            child: Text(
                              "Sign up", textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0),),
                          ),
                        ),
                      ),

                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                              onTap: () {
                                // pop context removes the screen from the pile and sends it back to the previous screen
                                Navigator.pop(context);
                              },
                              child: Text("I already have an account",
                                textAlign: TextAlign.center, style: TextStyle(
                                    color: Colors.deepOrange, fontSize: 16),))
                      ),

                      Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                14.0, 8.0, 14.0, 8.0),
                            child: Material(
                              child: MaterialButton(
                                onPressed: () async {
                                  FirebaseUser user = await auth.googleSignIn();
                                  if (user == null) {
                                    userServices.createUser({
                                      "name": user.displayName,
                                      "photo": user.photoUrl,
                                      "email": user.email,
                                      "userId": user.uid
                                    });
                                    changeScreenReplacement(
                                        context, HomePage());
                                  }
                                },
                                child: Image.asset(
                                  "images/google.png", height: 40.0,
                                  width: 40.0,),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
              ),
            ),
          ),
          Visibility(
            visible:true,
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

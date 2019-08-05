import 'package:class_project/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'provider.dart';
import 'signup.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'home_page.dart';


class LogInClass extends StatefulWidget {
  LogInClass({Key key}) : super(key: key);

  _LogInClassState createState() => _LogInClassState();
}

class _LogInClassState extends State<LogInClass> {
  final loginkey = GlobalKey<FormState>();
  final email = TextEditingController();
  final password = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  String _email, _password;
  //FormType _formType = FormType.login;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
        // Main Container
        SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
// Main Column
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * .2,
                  width: MediaQuery.of(context).size.width * .5,
                  child: Image.asset('datafolder/logo.png'),
                ),

// Fields Container

                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(20)),
                  padding: EdgeInsets.only(left: 20, right: 20, top: 5,),

                  // height: MediaQuery.of(context).size.height * .7,
                  // Card Column
                  child: Form(
                    key: loginkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                        // Sign navigation row
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an account? ",
                              style: TextStyle(fontSize: 18),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpClass()),
                                );
                              },
                              child: Text(
                                'Join us',
                                style: TextStyle(
                                    color: Color(0xff8BD5E1), fontSize: 22),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 20,),

// Email Field
                        Container(
                          child: Column(
                            children: <Widget>[
                              Container(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Email',
                                      hintText: 'Enter Email Here'),
                                  validator: validateEmail,
                                  controller: email,
                                  onSaved: (value) => _email=value,
                                ),
                              ),

                              SizedBox(
                                height: 20,
                              ),
// Password Field
                              Container(
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: 'Password',
                                      hintText: 'Enter Password Here'),
                                  validator: (value) {
                                    if (value.length < 8) {
                                      return 'Password must be 8 charactors';
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: password,
                                  onSaved: (value) => _password=value,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.bottomRight,
                          child: RaisedButton(
                            onPressed: (){},

                            color: Colors.green,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              'Log in',
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                'Lost Your Password?',
                                style: TextStyle(
                                    color: Color(0xff8BD5E1), fontSize: 22),
                              ),
// Social Media Button Row
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      'datafolder/facebook.png',
                                      height: 60,
                                      width: 60,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {},
                                    child: Image.asset(
                                      'datafolder/google.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }






  /*Future<void> signInWithEmailPassword()async {
    final formstate = loginkey.currentState;
    // validate failed
    if (formstate.validate()){
      formstate.save();
      try {
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePageClass()));
        print('Email is $email + Password is $password');
      } catch (e) {
        print(e.message);
      }
    }
  }*/

}

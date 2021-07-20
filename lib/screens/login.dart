
import 'package:e_commerce/screens/signup.dart';
import 'package:e_commerce/widgets/changescreen.dart';
import 'package:e_commerce/widgets/mybutton.dart';
import 'package:e_commerce/widgets/mytextformfield.dart';
import 'package:e_commerce/widgets/passwordtextformfiled.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
String pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = new RegExp(pattern);
bool obserText = true;
String email;
String password;


class _LoginState extends State<Login> {
  void vaildation()  async{
    final FormState _form = _formKey.currentState;
    if (!_form.validate()) {
      try{
        AuthResult result = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        print(result.user.uid);
      }on PlatformException catch(e){
        print(e.message.toString());
        // ignore: deprecated_member_use
        _scaffoldKey.currentState.showSnackBar(SnackBar(content: Text(e.message)));
      }
    } else {
      print("No");
    }
  }

  Widget _buildAllPart(){
    return SingleChildScrollView(
      child: Container(
        color: Colors.lightBlue,
        height: 300,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("LOGIN",
                style: TextStyle(
                    fontSize: 40, fontWeight: FontWeight.bold)),
            MyTextFormField(
              onChanged: (value){
                email = value;
                print(email);
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill Email";
                } else if (!regExp.hasMatch(value)) {
                  return "Email Is Invaild";
                }
                return "";
              },
              name: "Email",
            ),
            PasswordTextFormField(
              obserText: obserText,
              onChanged: (value){
                password = value;
                print(password);
              },
              validator: (value) {
                if (value == "") {
                  return "Please Fill Password";
                } else if (value.length < 6) {
                  return "Password Is Too Short";
                }
                return "";
              },
              name: "Password",
              onTap: () {
                setState(() {
                  obserText = !obserText;
                });
                FocusScope.of(context).unfocus();
              },
            ),


            MyButton(
              name: "LOGIN",
              onPressed: () {
                vaildation();
              },
            ),
            ChangeScreen(
              name: "SignUp",
              whichAccount: "I Have Not Account!",
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (cxt) => SignUp()));
              },
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildAllPart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'todo.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
    //Firebase fb=new Firebase();

  Authen n=new Authen();
  User?u;
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async{
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    String ans=await n.signin(data.name, data.password);
    if(ans=="y") {
      Navigator.popAndPushNamed(context, '/todo');
    }
    else{
      Navigator.popAndPushNamed(context, '/');
    }
      return null;

  }

  Future<String?> _signupUser(SignupData data) async{
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    //return Future.delayed(loginTime).then((_) {

    //Navigator.popAndPushNamed(context,'/todo0');
    String ans=await n.signup(data.name!, data.password!);
    if(ans=="y") {
      Navigator.popAndPushNamed(context, '/todo');
    }
    else{
      Navigator.popAndPushNamed(context, '/');
    }
     return null;

  }

  Future<String> _recoverPassword(String name) async{
    debugPrint('Name: $name');
    return "";
  }
  Future<void> asingin() async{
    u=await FirebaseAuth.instance.currentUser;
    print(u);
    if(u==null){
      //Navigator.pushNamed(context, '/');
     //Navigator.pushNamed(context,'/')
    }
    else{
      Navigator.popAndPushNamed(context, '/todo');
      print(u?.email);
    }

  }
  @override
  void initState(){
    super.initState();
    asingin();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: FlutterLogin(
      title: 'Todo List',
      //logo: AssetImage('assets/images/ecorp-lightblue.png'),
      onLogin: _authUser,
      onSignup: _signupUser,
      theme: LoginTheme(
        primaryColor: Colors.deepPurpleAccent,
        //buttonTheme: LoginButtonTheme(backgroundColor: Colors.purple),
      ),
      loginProviders: <LoginProvider>[
        LoginProvider(
          icon:FontAwesomeIcons.google,
          // label: 'Google',
          callback: () async {
            debugPrint('start google sign in');
            try {
              String ans;
              ans=await Authen().gsignin();
              if(ans=="n"){
                Navigator.popAndPushNamed(context, '/');
                return;
              }
              Navigator.popAndPushNamed(context, '/todo');
            }
            catch(e){
              print(e);
              Navigator.popAndPushNamed(context,'/');
            }
            debugPrint('stop google sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.facebookF,
          // label: 'Facebook',
          callback: () async {
            debugPrint('start facebook sign in');
            await Future.delayed(loginTime);
            debugPrint('stop facebook sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.linkedinIn,
          callback: () async {
            debugPrint('start linkdin sign in');
            await Future.delayed(loginTime);
            debugPrint('stop linkdin sign in');
            return null;
          },
        ),
        LoginProvider(
          icon: FontAwesomeIcons.githubAlt,
          callback: () async {
            debugPrint('start github sign in');
            await Future.delayed(loginTime);
            debugPrint('stop github sign in');
            return null;
          },
        ),
      ],
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Todo(),
        ));
      },
      onRecoverPassword: _recoverPassword,
    ),
    );
  }
}

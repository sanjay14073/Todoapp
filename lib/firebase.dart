import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'modeltodo.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Authen{
  User? curr=FirebaseAuth.instance.currentUser;
  late UserCredential u;
  FirebaseAuth auth=FirebaseAuth.instance;
  bool issg(){
    if (curr==null) {
      return false;
    } else {
      return true;
    }
  }
  Future<String>signup(String email,String password)async{
    //UserCredential u;
    try{
    u=await auth.createUserWithEmailAndPassword(email: email, password: password);

    curr=u.user;
    }
    catch(e){
      return "n";
    }
    return "y";
  }
  Future<String>signin(String email,String password)async{
    try {
      u = await auth.signInWithEmailAndPassword(email: email, password: password);
      curr=u.user;
    }
    catch(e){
      return "n";
    }
    return "y";
  }
  Future<String>signout()async{
    try{
      curr=null;
      await auth.signOut();
      print(FirebaseAuth.instance);
    }
    catch(e){

      return "n";
    }
    return "y";
  }
  Future<String> gsignin()async{
    try{
      //u=await auth.signInWithProvider(GoogleAuthProvider());
      //u=await GoogleSignIn().signIn()
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      print(credential);
      u=await auth.signInWithCredential(credential);
    }
    catch(e){
      print(e);
      return "n";
    }
    if(u==null){
      print(null);
      return "n";
    }
    return "y";
  }
  Future<String> adddata(Model m)async{
    if(curr!=null) {
      try {
        String? s=curr?.email;
        await FirebaseFirestore.instance.collection(s!).add(m.toMap());
      }
      catch (e) {
        return "n";
        print(e);
      }
    }
    else{
      return "n";
    }
    return "y";
  }
}
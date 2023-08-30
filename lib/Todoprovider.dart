//import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'modeltodo.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class TodoProvider with ChangeNotifier{
   List<Model>model=<Model>[];
   List<String>id=<String>[];
  void add(Model m){
   model.add(m);
   notifyListeners();
  }
  void delete(int index)async{
    User? curr=FirebaseAuth.instance.currentUser;
    String? s=curr?.email;
    model.removeAt(index);
    await FirebaseFirestore.instance.collection(s!).doc(id[index]).delete();
    notifyListeners();
  }
  void display(){
    print(model.length);
    for(int i=0;i<model.length;i++){
      print(model[i]);
    }
  }
  Future<void>update(int index,Model m)async{
    User? curr=FirebaseAuth.instance.currentUser;
    String? s=curr?.email;
    model.removeAt(index);
    await FirebaseFirestore.instance.collection(s!).doc(id[index]).update(m.toMap());
    //await fetch();
    notifyListeners();
  }
   Future<void>fetch()async{
    model.clear();
    id.clear();
    final db=FirebaseFirestore.instance;
    User? curr=FirebaseAuth.instance.currentUser;
    String? s=curr?.email;
    db.collection(s!).get().then(
          (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
          Model m1=Model(docSnapshot.data()['title'],docSnapshot.data()['task'],DateTime.now(),DateTime.now());
          id.add(docSnapshot.id);
          add(m1);
        }
      },
      onError: (e) => print("Error completing: $e"),
    );

   }
 }
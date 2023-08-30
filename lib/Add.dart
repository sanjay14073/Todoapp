import 'package:flutter/material.dart';
import 'modeltodo.dart';
import 'package:todoapp/Todoprovider.dart';
import 'package:provider/provider.dart';
import 'firebase.dart';
class Add extends StatefulWidget {
  const Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  TextEditingController t1=new TextEditingController();
  TextEditingController t2=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title:Text("Add Tasks",style: TextStyle(color:Colors.white),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: t1,decoration: InputDecoration(hintText: "Enter the tasks",focusColor: Colors.deepPurpleAccent),),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(controller: t2,decoration: InputDecoration(hintText: "Enter the note",focusColor: Colors.deepPurpleAccent),),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: ()async{
        DateTime d=DateTime(2005,14,06);
        Model m=new Model(t1.text,t2.text,d,d);
        //Provider.of<TodoProvider>(context,listen: false).add(m);
        Provider.of<TodoProvider>(context,listen: false).display();
        await Authen().adddata(m);
        await Provider.of<TodoProvider>(context,listen: false).fetch();
        Navigator.pop(context);
      },child: Icon(Icons.save_alt),),
    );
  }
}

import 'package:flutter/material.dart';
import 'modeltodo.dart';
import 'package:todoapp/Todoprovider.dart';
import 'package:provider/provider.dart';
import 'firebase.dart';
class Update extends StatefulWidget {
 // const Update({Key? key}) : super(key: key);
  String?task;
  String?name;
  late int index;
  Update(this.task,this.name,this.index, {super.key});
  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {

  //UpdateState(this.task,this.name,this.index, {super.key});
  TextEditingController t1=new TextEditingController();
  TextEditingController t2=new TextEditingController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   t1.text=super.task!;
  //   t2.text=name;
  // }
  @override
  Widget build(BuildContext context) {
    t1.text=widget.task!;
    t2.text=widget.name!;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title:Text("Update Tasks",style: TextStyle(color:Colors.white),),
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
        await Provider.of<TodoProvider>(context,listen: false).update(widget.index, m);
        await Provider.of<TodoProvider>(context,listen: false).fetch();
        Navigator.pop(context);
      },child: Icon(Icons.save_alt),),
    );
  }
}
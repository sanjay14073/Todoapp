import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:todoapp/Update.dart';
import 'Todoprovider.dart';
import 'firebase.dart';
class Todo extends StatefulWidget {
  const Todo({Key? key}) : super(key: key);

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  bool ans=false;
  Future<void>get()async{
    ans=true;
    await Provider.of<TodoProvider>(context).fetch();
  }
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    //Provider.of<TodoProvider>(context).fetch();
    //get();
  }
  @override
  Widget build(BuildContext context) {
    TodoProvider todo=Provider.of<TodoProvider>(context);
    if(!ans){
      get();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text("Profile"),
              onTap: () {


              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async{
                // Update the state of the app.
                // ...
                String ans;
                ans=await Authen().signout();
                if(ans=="y"){
                  Navigator.popAndPushNamed(context, '/');
                }
              },
            ),
          ],
        ),
      ),
      body: Consumer<TodoProvider>(
      builder: (context,data,index) {
      return ListView.builder(
        itemCount: todo.model.length,
        itemBuilder: (context, index) {


          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: GestureDetector(
              onLongPress: ()async{
                showDialog(context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Do you want to delete this note'),
                        content: const Text(
                        "Deletion will be a permanent action"
                        ),
                        actions: <Widget>[
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('No'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              textStyle: Theme.of(context).textTheme.labelLarge,
                            ),
                            child: const Text('Yes'),
                            onPressed: () {
                              todo.delete(index);
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    }
                );
              },
              onTap: ()async{
                //Navigator.popAndPushNamed(context, MaterialPageRoute(builder: (context)=>Update()));
                //Navigator.pushNamed(context, MaterialPageRoute(builder:(context)=>Update()));
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Update(todo.model[index].Lname,todo.model[index].task,index)));
              },
              child: Card(
                elevation: 5.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(todo.model[index].Lname,style: TextStyle(color: Colors.black,fontSize: 24,fontWeight: FontWeight.bold,fontStyle:FontStyle.italic),),
                    ),
                    //SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(todo.model[index].task,style: TextStyle(color:Colors.black,fontSize: 16),),
                    ),
                  ],
                ),
              ),

            ),
          );
        });
      },
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pushNamed(context, '/add');
      },child: Icon(Icons.add),
      backgroundColor: Colors.deepPurpleAccent,
        elevation: 5.0,
      ),
    );
  }
}

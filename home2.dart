import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DBManager.dart';
import 'add.dart';

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {

  final DBManager dbtodomanager = DBManager();
  final _task = TextEditingController();
  final _desc = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  Todo? todo;
  late int updateindex;

  late List<Todo> todolist;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
body:FutureBuilder(
  future: dbtodomanager.getTodoList(),
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      todolist = snapshot.data as List<Todo>;
      return ListView.builder(
        shrinkWrap: true,
        itemCount: todolist == null ? 0 : todolist.length,
        itemBuilder: (BuildContext context, int index) {
         Todo td = todolist[index];
          return ListTile(
            leading: Icon(Icons.person),
            title: Text('Task: ${td.task}',),
            subtitle: Text('Bldgroup:${td.description}',),
            trailing: Row(
              children: [
                IconButton(onPressed: () async {

                  }, icon: Icon(Icons.edit),
                ),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete))
              ],
            ),


          );
        },
      );
    }
    return CircularProgressIndicator();
  },
),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) =>
                Add()));
          }
      ),
    );
    }
}

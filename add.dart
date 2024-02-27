import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'DBManager.dart';











class Add extends StatefulWidget {
  const Add({super.key});

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
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
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              SizedBox(height: 125,),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: _task,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Task',
                    hintStyle: const TextStyle(fontSize: 14),
                    icon: const Icon(Icons.square_outlined, color: Colors.brown),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),


              ),

              SizedBox(height: 40,),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextFormField(
                  controller: _desc,
                  style: const TextStyle(fontSize: 14),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    hintText: 'Description',
                    hintStyle: const TextStyle(fontSize: 14),
                    icon: const Icon(CupertinoIcons.square_list, color: Colors.brown),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),


              ),




              SizedBox(height: 40,),


              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.grey,
                ),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  submitTodo(context);


                },
                child:  Text('Save'),
              ),
            ],

          ),
        )
        

      ),


    );
  }
  void submitTodo(BuildContext context) {
    if (_formkey.currentState!.validate()) {
      if (todo == null) {
        Todo td = Todo(
            task: _task.text,
            description: _desc.text,

        ) ;
        dbtodomanager.insertTodo(td).then((value) =>
        {
          _task.clear(),
          _desc.clear(),

          print("todo Data Add to database $value"),
        });
      }
      else {
        todo?.task = _task.text;
        todo?.description = _desc.text;


        dbtodomanager.updateTodo(todo!).then((value) {
          setState(() {
            todolist[updateindex].task = _task.text;
            todolist[updateindex].description = _desc.text;

          });
          _task.clear();
          _desc.clear();


          todo = null;
        });
      }
    }
  }




}








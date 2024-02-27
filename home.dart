import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mytodo/add.dart';
import 'package:mytodo/home2.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: Padding(padding:EdgeInsets.all(8),
        child: CircleAvatar(radius: 15,)),
        title: Text("TO DO",style: TextStyle(fontSize: 20,color: Colors.white),),

      ),
      body: Center(
          child: GridView.extent(
            primary: false,
            padding: const EdgeInsets.all(16),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            maxCrossAxisExtent: 200.0,
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(8),
                child:  TextButton( onPressed: () {
                  Navigator.push(context,MaterialPageRoute(builder: (context) =>Home2()));


                }, child: Text('Home', style: TextStyle(fontSize: 20)),),
                color: Colors.yellow,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child:  TextButton( onPressed: () {  }, child: Text('office', style: TextStyle(fontSize: 20)),),
                color: Colors.blue,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child:  TextButton( onPressed: () {  }, child: Text('Kitchen', style: TextStyle(fontSize: 20)),),
                color: Colors.blue,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: TextButton( onPressed: () {  }, child: Text('School', style: TextStyle(fontSize: 20)),),
                color: Colors.yellow,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child:  TextButton( onPressed: () {  }, child: Text('library', style: TextStyle(fontSize: 20)),),
                color: Colors.yellow,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child:  TextButton( onPressed: () {  }, child: Text('workout', style: TextStyle(fontSize: 20)),),
                color: Colors.blue,
              ),
            ],

          )),


    );
  }
}

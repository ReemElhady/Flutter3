import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/db/DbHelper.dart';
import 'package:todo/models/DbModel.dart';
import 'package:todo/ui/viewTasks.dart';

class addNewTask extends StatefulWidget {
  @override
  _addNewTaskState createState() => _addNewTaskState();
}

class _addNewTaskState extends State<addNewTask> {
  var controllerName = TextEditingController();
  var controllerLabel = TextEditingController();
  var controllerColor = TextEditingController();
  var controllerDate = TextEditingController();
  var controllerDescription = TextEditingController();
  DbHelper db;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    db= DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.black,
        shape: ContinuousRectangleBorder(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(200.0),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            'Sign up',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Name"),
              controller: controllerName,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Label"),
              controller: controllerLabel,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Description"),
              controller: controllerDescription,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Date"),
              controller: controllerDate,
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Color"),
              controller: controllerColor,
            ),
            ElevatedButton(onPressed: () {
              insert();
              print("inserted");
              Navigator.push(context, MaterialPageRoute(builder: (context)=> viewTasks()));
            }, child: Text("Add Task")),


            ElevatedButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> viewTasks()));
            }, child: Text("Show All Tasks")),
          ],
        ),
      ),
    );
  }

  void insert() async {
    print("insert here" + controllerName.text.toString());
    var json = {
      "name": controllerName.text,
      "label": controllerLabel.text,
      "description": controllerDescription.text,
      "color": controllerColor.text,
      "date": controllerDate.text
    };
    DbModel course = DbModel.fromJson(json);
    int response= await db.insert(course);
    print("insert again" + controllerName.text.toString());

    print("response" + response.toString());
  }
}

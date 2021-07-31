import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/db/DbHelper.dart';
import 'package:todo/models/DbModel.dart';

class viewTasks extends StatefulWidget {

  @override
  _viewTasksState createState() => _viewTasksState();
}

class _viewTasksState extends State<viewTasks> {
  DbHelper dbh;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dbh=DbHelper();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("DB retrieve"),
      ),
      body: Center(
        child: FutureBuilder<List<DbModel>>(
          future: dbh.selectAll(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CircularProgressIndicator();
            } else
            if (snapshot.hasData) {
              List<DbModel> courses = snapshot.data;
              return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context,index){
                  DbModel course=courses[index];
                  return ListTile(
                    title: Text(course.name),
                    subtitle: Text(course.description),
                    trailing: Text(course.label),

                  );
                },);
            }else{
              return Text("No data");
            }
          },
        ),
      ),
    );
  }
}

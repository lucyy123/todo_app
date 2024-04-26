// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/listTile.dart';
import 'package:todo_app/utils/taskDialogue.dart';

class MyHomepage extends StatefulWidget {
  MyHomepage({super.key});

  @override
  State<MyHomepage> createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
//*------------------- Controller ------------------------------/
  final _controller = TextEditingController();

  //*-------------- instance of todd list -----------------
  final _mybox = Hive.box("myBox");
  ToDoDataBase db = ToDoDataBase();

//*----------------------- handle for on tap checkbox -------------------------/
  void handlecheckBox(bool? value, int index) {
    setState(() {
      db.todolist[index][1] = !db.todolist[index][1];
    });
    db.updateData();
  }

//*------------------------- handle for add new task ------------------------/
  void handleAddNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return MyDialogue(
            controller: _controller,
            OnSave: handleSave,
            OnCancel: () => {Navigator.of(context).pop()},
          );
        });
  }

//*------------------------- Hanle to save new task ---------------------------/

  void handleSave() {
    print("on save clicked");
    setState(() {
      db.todolist.add([_controller.text, false]);
      _controller.clear();
    });
    db.updateData();

    Navigator.of(context).pop();
  }

//!------------------------- Hanle to delete task ---------------------------/
  void handleDelete(int index) {
    setState(() {
      db.todolist.removeAt(index);
    });
    db.updateData();
  }

  //?-------------------- init state------------------------------/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final _mybox = Hive.box("myBox");

    if (_mybox.get("TODOLIST") == null) {
      db.initialData();
    } else {
      db.loadData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TO DO"),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            color: Colors.white,
            tooltip: 'Open shopping cart',
            onPressed: () {
              //!------------------------ handle the press to exit from application----------------------------/
            },
          )
        ],
        elevation: 0, //* TO REMOVE THE BOTTOM MARGIN OF APP BAR
      ),
      backgroundColor: Color.fromARGB(255, 59, 65, 70),
      floatingActionButton: FloatingActionButton(
        onPressed: handleAddNewTask,
        child: Icon(Icons.add),
        backgroundColor: const Color.fromARGB(255, 2, 255, 230),
        foregroundColor: Color.fromARGB(255, 32, 31, 31),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: ListView.builder(
          itemCount: db.todolist.length,
          itemBuilder: (context, index) {
            return MyTodoTile(
                taskName: db.todolist[index][0],
                isTasCompleted: db.todolist[index][1],
                handleChakecBox: (value) {
                  handlecheckBox(value, index);
                },
                handleDelete: (context) {
                  handleDelete(index);
                });
          },
        ),
      ),
    );
  }
}

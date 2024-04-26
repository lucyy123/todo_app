// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class MyTodoTile extends StatelessWidget {
  final String taskName;
  final bool isTasCompleted;
  Function(bool?)? handleChakecBox;
  Function(BuildContext)? handleDelete;

  MyTodoTile({
    super.key,
    required this.taskName,
    required this.isTasCompleted,
    required this.handleChakecBox,
    required this.handleDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 13),
      child: Slidable(
        //* slide from right side
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: handleDelete,
            borderRadius: BorderRadius.circular(13),
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: "Delete",
          ),
        ]),
        child: Container(
          // margin: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              //* Checkbox
              Checkbox(
                value: isTasCompleted,
                onChanged: handleChakecBox,
                activeColor: Colors.transparent,
                shape: CircleBorder(),
                side: BorderSide(color: const Color.fromARGB(255, 3, 255, 230)),
                checkColor: Color.fromARGB(255, 6, 253, 228),
                // fillColor: MyColor()
              ),
              SizedBox(
                width: 20,
              ),
              //* Task Name
              Text(
                taskName,
                style: TextStyle(
                    color: Color.fromARGB(255, 218, 214, 214),
                    decoration: isTasCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    fontSize: 18,
                    fontWeight: FontWeight.w400),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Color.fromARGB(248, 69, 71, 71),
              borderRadius: BorderRadius.circular(13)),
        ),
      ),
    );
  }
}

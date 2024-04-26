// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:todo_app/utils/MyButtons.dart';

class MyDialogue extends StatelessWidget {
  final controller;
  VoidCallback OnSave;
  VoidCallback OnCancel;
  MyDialogue(
      {super.key,
      required this.controller,
      required this.OnSave,
      required this.OnCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.grey,
      content: Container(
        height: 150,
        decoration: BoxDecoration(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //*---------------- Textfield----------------------/
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Add New Task",
              ),
            ),
            SizedBox(
              height: 15,
            ),

            //*--------------------------- Buttons==> Save + Cancel ----------------*/
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //? -------S A V E    B U T T O  N -------------------
                MyButton(
                    text: "Save",
                    onPressed: () {
                      OnSave();
                    }),
                SizedBox(
                  width: 10,
                ),
                //? --------- C A N C E L   B U T T O N---------------
                MyButton(
                    text: "Cancel",
                    onPressed: () {
                      OnCancel();
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}

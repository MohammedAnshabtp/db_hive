import 'package:db_hive/db/function/db_functions.dart';
import 'package:db_hive/screen/home/widget/add_Student.dart';
import 'package:db_hive/screen/home/widget/list_students.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screenhome extends StatelessWidget {
  const Screenhome({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          AddStudents(),
          Expanded(child: ListStudents()),
        ],
      )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../models/data_model.dart';

ValueNotifier<List<StudentModel>> studentListNotifier = ValueNotifier([]);

Future<void> addStudent(StudentModel value) async {
  final studentDB =
      await Hive.openBox<StudentModel>('student_db'); //database open
  final _id = await studentDB.add(value);
  value.id = _id; // added to database
  studentListNotifier.value.add(value); //added to list
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents() async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentDB.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int id) async {
  final studentDB = await Hive.openBox<StudentModel>('student_db');
  await studentDB.delete(id);
  getAllStudents();
}

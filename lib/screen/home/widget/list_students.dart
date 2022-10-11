import 'package:db_hive/db/function/db_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../db/models/data_model.dart';

class ListStudents extends StatelessWidget {
  const ListStudents({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: studentListNotifier,
        builder:
            (BuildContext ctx, List<StudentModel> studentList, Widget? child) {
          return ListView.separated(
            itemBuilder: (context, index) {
              final data = studentList[index];
              return ListTile(
                title: Text(data.name),
                subtitle: Text(data.age),
                trailing: IconButton(
                  onPressed: () {
                    if (data.id != null) {
                      deleteStudent(data.id!);
                    } else {
                      print('Student id is null. Unable to delete');
                    }
                  },
                  icon: Icon(Icons.delete),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemCount: studentList.length,
          );
        });
  }
}

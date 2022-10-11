import 'package:db_hive/db/function/db_functions.dart';
import 'package:db_hive/db/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class AddStudents extends StatelessWidget {
  AddStudents({super.key});

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Subject',
            ),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            controller: _ageController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Work',
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton.icon(
            onPressed: () {
              AddStudentButton();
            },
            icon: Icon(Icons.add),
            label: Text('Add Student'),
          )
        ],
      ),
    );
  }

  Future<void> AddStudentButton() async {
    final _name = _nameController.text.trim();
    final _age = _ageController.text.trim();

    if (_name.isEmpty || _age.isEmpty) {
      return;
    }
    print('$_name $_age');
    final _student = StudentModel(name: _name, age: _age);

    addStudent(_student);
  }
}

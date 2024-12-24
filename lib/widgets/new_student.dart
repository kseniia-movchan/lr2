import 'package:flutter/material.dart';
import 'students.dart';

// Оновлений екран NewStudent
class NewStudent extends StatefulWidget {
  final Student? student; // Можливість отримати існуючого студента для редагування

  const NewStudent({Key? key, this.student}) : super(key: key);

  @override
  _NewStudentState createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController gradeController = TextEditingController();

  Department? selectedDepartment;
  Gender? selectedGender;

  @override
  void initState() {
    super.initState();
    if (widget.student != null) {
      firstNameController.text = widget.student!.firstName;
      lastNameController.text = widget.student!.lastName;
      gradeController.text = widget.student!.grade.toString();
      selectedDepartment = widget.student!.department;
      selectedGender = widget.student!.gender;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add Student' : 'Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNameController,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: lastNameController,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: gradeController,
              decoration: const InputDecoration(labelText: 'Grade'),
              keyboardType: TextInputType.number,
            ),
            DropdownButton<Department>(
              value: selectedDepartment,
              onChanged: (Department? newValue) {
                setState(() {
                  selectedDepartment = newValue;
                });
              },
              items: Department.values.map<DropdownMenuItem<Department>>((Department value) {
                return DropdownMenuItem<Department>(
                  value: value,
                  child: Text(value.toString().split('.').last),
                );
              }).toList(),
            ),
            DropdownButton<Gender>(
              value: selectedGender,
              onChanged: (Gender? newValue) {
                setState(() {
                  selectedGender = newValue;
                });
              },
              items: Gender.values.map<DropdownMenuItem<Gender>>((Gender value) {
                return DropdownMenuItem<Gender>(
                  value: value,
                  child: Text(value.toString().split('.').last),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (firstNameController.text.isNotEmpty && lastNameController.text.isNotEmpty && gradeController.text.isNotEmpty && selectedDepartment != null && selectedGender != null) {
                  final newStudent = Student(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    department: selectedDepartment!,
                    grade: int.parse(gradeController.text),
                    gender: selectedGender!,
                  );
                  
                  if (widget.student != null) {
                    Navigator.pop(context, newStudent);
                  } else {
                    Navigator.pop(context, newStudent);
                  }
                } else {
                
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please fill all fields')),
                  );
                }
              },
              child: Text(widget.student == null ? 'Add Student' : 'Update Student'),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'student_item.dart';
import 'new_student.dart';

enum Department { finance, law, it, medical }
enum Gender { male, female }

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  _StudentsScreenState createState() => _StudentsScreenState();
}
// Клас Student
class Student {
  final String firstName;
  final String lastName;
  final Department department;
  final int grade;
  final Gender gender;

  Student({
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.grade,
    required this.gender,
  });
}

//StudentsScreen
class _StudentsScreenState extends State<StudentsScreen> {

  final List<Student> students = [
    Student(
      firstName: 'Liza',
      lastName: 'Minnelli',
      department: Department.it,
      grade: 85,
      gender: Gender.female,
    ),
    Student(
      firstName: 'Michael',
      lastName: 'York',
      department: Department.finance,
      grade: 90,
      gender: Gender.male,
    ),
    Student(
      firstName: 'Joel',
      lastName: 'Grey',
      department: Department.law,
      grade: 88,
      gender: Gender.male,
    ),
    Student(
      firstName: 'Helmut',
      lastName: 'Griem',
      department: Department.medical,
      grade: 92,
      gender: Gender.male,
    ),
  ];
Future<void> _addNewStudent(BuildContext context) async {
    final newStudent = await showModalBottomSheet<Student>(
      context: context,
      builder: (ctx) => NewStudent(),
    );
    if (newStudent != null) {
      setState(() {
        students.add(newStudent);
      });
    }
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Students'),
      actions: [
        IconButton(
          onPressed: () {
            _addNewStudent(context);
          },
          icon: const Icon(Icons.add),
        ),
      ],
    ),
    body: ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];

        return Dismissible(
          key: Key(student.firstName + student.lastName),
          direction: DismissDirection.endToStart,
          onDismissed: (direction) {
            final removedStudent = student;

            setState(() {
              students.removeAt(index);
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${removedStudent.firstName} ${removedStudent.lastName} removed'),
                action: SnackBarAction(
                  label: 'Undo',
                  onPressed: () {
                    setState(() {
                      students.insert(index, removedStudent);
                    });
                  },
                ),
              ),
            );
          },
          background: Container(
            color: Colors.red,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20.0),
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          child: InkWell(
            onTap: () {
              _editStudent(context, student, index);
            },
            child: StudentItem(student: student),
          ),
        );
      },
    ),
  );
}


void _editStudent(BuildContext context, Student student, int index) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NewStudent(student: student),
    ),
  ).then((updatedStudent) {
    if (updatedStudent != null && updatedStudent is Student) {
      setState(() {
        students[index] = updatedStudent;
      });
    }
  });
}}



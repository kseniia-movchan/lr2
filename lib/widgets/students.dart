import 'package:flutter/material.dart';
import 'student_item.dart';

// Enum для департаменту
enum Department { finance, law, it, medical }

// Enum для статі
enum Gender { male, female }

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
class StudentsScreen extends StatelessWidget {

  final List<Student> students = [
    Student(
      firstName: 'Liza',
      lastName: 'Minnelli',
      department: Department.it,
      grade: 85,
      gender: Gender.male,
    ),
    Student(
      firstName: 'Michael',
      lastName: 'York',
      department: Department.finance,
      grade: 90,
      gender: Gender.female,
    ),
    Student(
      firstName: 'Joel',
      lastName: 'Grey',
      department: Department.law,
      grade: 88,
      gender: Gender.female,
    ),
    Student(
      firstName: 'Helmut',
      lastName: 'Griem',
      department: Department.medical,
      grade: 92,
      gender: Gender.male,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return StudentItem(student: student);
        },
      ),
    );
  }
}

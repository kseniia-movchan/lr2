import 'package:flutter/material.dart';
import 'widgets/students.dart'; 


// Глобальна змінна з іконками для кожної спеціальності
final Map<Department, IconData> departmentIcons = {
  Department.finance: Icons.attach_money,
  Department.law: Icons.gavel,
  Department.it: Icons.computer,
  Department.medical: Icons.local_hospital,
};

void main() {
  runApp(MyApp());
}

// Головний клас додатку
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Students',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: StudentsScreen(),
    );
  }
}

class StudentListScreen extends StatelessWidget {

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


  // Вибір кольору залежно від статі
  Color _getGenderColor(Gender gender) {
    return gender == Gender.male ? Colors.blue : Colors.pink;
  }

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
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Container(
              decoration: BoxDecoration(
                color: _getGenderColor(student.gender), // Насичений колір
                borderRadius: BorderRadius.circular(12.0), // Круглі кути
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    departmentIcons[student.department] ?? Icons.help,
                    color: Colors.blue,
                  ),
                ),
                title: Text(
                  '${student.firstName} ${student.lastName}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  'Grade: ${student.grade}',
                  style: const TextStyle(
                    color: Colors.white70,
                  ),
                ),
                trailing: Text(
                  student.grade.toString(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

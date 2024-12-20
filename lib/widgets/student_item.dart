import 'package:flutter/material.dart';
import 'students.dart'; 

class StudentItem extends StatelessWidget {
  final Student student; 

  const StudentItem({Key? key, required this.student}) : super(key: key);

  Color _getGenderColor(Gender gender) {
    return gender == Gender.male ? Colors.blue : Colors.pink;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: _getGenderColor(student.gender), 
        borderRadius: BorderRadius.circular(12.0), 
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
    );
  }
}

// Глобальна змінна для іконок департаментів
final Map<Department, IconData> departmentIcons = {
  Department.finance: Icons.attach_money,
  Department.law: Icons.gavel,
  Department.it: Icons.computer,
  Department.medical: Icons.local_hospital,
};

import 'package:flutter/material.dart';

class ProjectWidget extends StatelessWidget {
  ProjectWidget({
    super.key,
    required this.onTap,
  });

  VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 3),
              color: Color(0xff453984),
              blurRadius: 3,
            ),
          ],
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.blueAccent],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CircleAvatar(
              child: Icon(Icons.add),
              backgroundColor: Colors.white,
            ),
            Text(
              'Add New Project',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

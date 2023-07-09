import 'package:flutter/material.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 18,
            ),
            child: FloatingActionButton.extended(
                onPressed: () {},
                label: const Row(
                  children: [Icon(Icons.folder_open), Text('Import')],
                )),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                color: Colors.red,
              )),
          Expanded(
              child: Container(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: FloatingActionButton.extended(
                    onPressed: () {}, label: Text('Create')),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

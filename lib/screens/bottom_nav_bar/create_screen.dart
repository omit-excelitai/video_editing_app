import 'package:flutter/material.dart';
import 'package:video_editing_app/models/dummy.dart';
import 'package:video_editing_app/screens/create_project/create_project_page.dart';
import '../../widgets/project_widget.dart';

class CreateScreen extends StatelessWidget {
  const CreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B4461),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  /// For Add Project
                  ProjectWidget(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateProjectPage()));
                    },
                  ),

                  SizedBox(
                    height: 10,
                  ),

                  /// For List of Project
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Card(
                            child: ListTile(
                              leading: Image.network(
                                  "${dummyProjectList[index].image}"),
                              title: Text('${dummyProjectList[index].title}'),
                              subtitle: Text('Last Seen: ${dummyProjectList[index].subTitle}'),
                              trailing: GestureDetector(
                                  onTap: (){
                                    
                                  },
                                  child: Icon(Icons.edit)),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: dummyProjectList.length),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

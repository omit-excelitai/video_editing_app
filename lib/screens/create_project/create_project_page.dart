import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editing_app/models/ratio_model.dart';
import 'package:video_editing_app/screens/edit/edit_screen.dart';

import '../test_editing_screen.dart';

class CreateProjectPage extends StatefulWidget {
  const CreateProjectPage({super.key});

  @override
  State<CreateProjectPage> createState() => _CreateProjectPageState();
}

class _CreateProjectPageState extends State<CreateProjectPage> {
  final TextEditingController _projectNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B4461),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color(0xff0E2232),
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_outlined,
              color: Colors.white,
            )),
        actions: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12,
            ),
            child: GestureDetector(
              onTap: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.folder_open,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Import',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Project Name",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                cursorColor: Colors.white,
                keyboardType: TextInputType.text,
                controller: _projectNameController,
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding:
                      EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 10),
                  hintText: 'Enter Project Name',
                  hintStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white60,
                      fontWeight: FontWeight.w400),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white60,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: Colors.white60,
                      ),
                      borderRadius: BorderRadius.circular(15)),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Aspect Ratio",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      //childAspectRatio: 0.4,
                    ),
                    itemCount: ratioModelList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          // height: 50,
                          // width: 50,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xff0E2232),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.airplay_outlined,
                                color: Colors.white60,
                              ),
                              Text(
                                "${ratioModelList[index].ratio}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white60,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        child: GestureDetector(
          onTap: () async {
            //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>VideoEditorExample()));
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => EditScreen(isfromCreateButton: false,)));
          },
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffE4E4E4),
            ),
            child: Text(
              'Create',
              style: TextStyle(
                  fontSize: 16,
                  color: Color(0xff0E2232),
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
    );
  }
}

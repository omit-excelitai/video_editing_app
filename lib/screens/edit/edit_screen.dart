import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_editor/video_editor.dart';

import '../../widgets/custom_edit_button.dart';
import '../../widgets/reusable_button_widget.dart';

class EditScreen extends StatefulWidget {
  const EditScreen({super.key});

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0B4461),
        body: Row(
          children: [
            /// For Leif Side Button
            Container(
              padding: EdgeInsets.all(4),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ReusableButtonWidget(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      iconData: Icons.arrow_back_ios_new_outlined,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {},
                      iconData: Icons.rotate_left_outlined,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {},
                      iconData: Icons.rotate_right_outlined,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {},
                      iconData: Icons.aspect_ratio_outlined,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {},
                      iconData: Icons.settings,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {},
                      iconData: Icons.timeline_outlined,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    ReusableButtonWidget(
                      onTap: () {},
                      iconData: Icons.exit_to_app_outlined,
                    ),
                  ],
                ),
              ),
            ),

            /// For Right
            Expanded(
              flex: 8,
              child: Container(
                color: Colors.pinkAccent,
                child: Column(
                  children: [
                    Expanded(
                        flex: 7,
                        child: Row(
                          children: [
                            Expanded(
                                flex: 6,
                                child: Container(
                                  alignment: Alignment.center,
                                  color: Colors.black,
                                  child: GestureDetector(
                                      onTap: () {},
                                      child: Icon(
                                        Icons.play_arrow_rounded,
                                        size: 50,
                                        color: Colors.white,
                                      )),
                                )),
                            Expanded(
                                flex: 3,
                                child: Container(
                                  color: Color(0xff0E2232),
                                  alignment: Alignment.center,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.end,
                                          children: [
                                            InkWell(
                                              onTap: (){},
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF0B4461)),
                                                child: Icon(Icons.save, color: Colors.white,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      CustomEditButton(),
                                      Padding(
                                        padding: EdgeInsets.symmetric(horizontal: 20),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            InkWell(
                                              onTap: (){},
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF0B4461)),
                                                child: Icon(Icons.card_giftcard, color: Colors.white,),
                                              ),
                                            ),
                                            InkWell(
                                              onTap: (){},
                                              child: Container(
                                                height: 40,
                                                width: 40,
                                                decoration: BoxDecoration(shape: BoxShape.circle, color: Color(0xFF0B4461)),
                                                child: Icon(Icons.play_arrow_rounded, color: Colors.white,),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        )),
                    Expanded(
                        flex: 3,
                        child: Container(
                          color: Colors.blue,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




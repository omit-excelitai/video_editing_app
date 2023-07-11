import 'package:flutter/material.dart';

class CustomEditButton extends StatelessWidget {
  const CustomEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 160,
          height: 160,
          // decoration: BoxDecoration(
          //   color: Color(0xff000000),
          // ),
          child: Stack(
            children: [
              /// For First Circle
              Positioned(
                left: 0,
                top: 0,
                right: 0,
              bottom: 0,
                child: Align(
                  child: SizedBox(
                    width: 160,
                    height: 160,
                    child: Container(
                      decoration: BoxDecoration(
                       shape: BoxShape.circle,
                        color: Color(0xff7a7a7a),
                        border: Border.all(width: 2, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),

              /// For Second Circle
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  child: InkWell(
                    onTap: (){},
                    child: SizedBox(
                      width: 50,
                      height: 50,
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Color(0xff000000), width: 2),
                          color: Colors.white54,
                        ),
                        child: Icon(Icons.camera, color: Colors.deepOrange,),
                      ),
                    ),
                  ),
                ),
              ),

              /// For Camera
              Positioned(
                bottom: 10,
                left: 0,
                right: 0,
                child: Align(
                  child: InkWell(
                    onTap: (){},
                    child: SizedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/camera.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            'Media',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ),
              ),

              /// For Microphone
              Positioned(
                left: 0,
                top: 10,
                right: 0,
                child: Align(
                  child: InkWell(
                    onTap: (){},
                    child: SizedBox(
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/images/mic.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            'Rec',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ),
              ),

              /// For Music
              Positioned(
                right: 12,
                top: 0,
                bottom: 0,
                child: Align(
                  child: InkWell(
                    onTap: (){},
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/music.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            'Music',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ),
              ),

              /// For Layer
              Positioned(
                left: 12,
                top: 0,
                bottom: 0,
                child: Align(
                  child: InkWell(
                    onTap: (){},
                    child: SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/layer.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            'Layer',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: Color(0xffffffff),
                            ),
                          ),
                        ],
                      )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

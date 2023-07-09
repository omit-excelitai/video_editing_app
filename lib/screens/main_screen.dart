import 'package:flutter/material.dart';
import 'package:video_editing_app/components/colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        // leading: ClipOval(
        //     child: Image.network('https://img.favpng.com/13/16/11/cartoon-gold-crown-png-favpng-ejYsiTP5FzZZmRTeQvupQR82u.jpg',height:5,width: 5,)),
        backgroundColor: Colors.black87,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.tv_sharp,color: AppColor.appBarIconColor,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.help,color: AppColor.appBarIconColor,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.notification_add,color: AppColor.appBarIconColor,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings,color: AppColor.appBarIconColor)),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(200, 253, 77, 61),
                          Color.fromARGB(250, 253, 123, 50),
                        ]),
                        color: Colors.red,
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.add_circle,
                              color: AppColor.appBarIconColor,
                              size: 40,
                            ),
                          ),
                          const Text(
                            'Add Project',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: constraints.maxHeight - 120,
                    child: const Center(
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Tap New Project to create your first project',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),



    );
  }
}

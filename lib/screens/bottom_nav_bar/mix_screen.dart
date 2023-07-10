import 'package:flutter/material.dart';

class MixScreen extends StatefulWidget {
  const MixScreen({super.key});

  @override
  State<MixScreen> createState() => _MixScreenState();
}

class _MixScreenState extends State<MixScreen> {
  PageController controller = PageController(initialPage: 0);

  List<Widget> scrollingImages = [
    Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/1.png'), fit: BoxFit.cover),
      ),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '1k',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.message,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '1k',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.share,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    '1k',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '#morden Agency...',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                  SizedBox(width: 70),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.lock_clock,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '00:25',
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.rectangle,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '1:1',
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      '1k downloads',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 20),
                  Container(
                    width: 50,
                    height: 30,
                    child: FloatingActionButton.extended(
                      backgroundColor: Color.fromARGB(250, 253, 77, 61),
                      onPressed: () {},
                      label: Text('Use'),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF0B4461),
        body: PageView(
          scrollDirection: Axis.vertical,
          controller: controller,
          children: scrollingImages,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B4461),
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/bg.jpg'), fit: BoxFit.cover),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Thok Thok',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              Text(
                'Connect with global video creators!',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                height: 50.0,
              ),
              Container(
                height: 50,
                width: 300,
                child: FloatingActionButton.extended(
                    backgroundColor: Colors.red[700],
                    onPressed: () {},
                    label: Text(
                      'Create an Account',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                'OR',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                height: 50,
                width: 300,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                  label: Row(
                    children: [
                      Image(
                        image: AssetImage('assets/images/google.png'),
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Continue with Google',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                height: 50,
                width: 300,
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.white,
                  onPressed: () {},
                  label: Row(
                    children: const [
                      Image(
                        image: AssetImage('assets/images/mac.png'),
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Continue with Apple',
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60.0,
              ),
              Text(
                'I have read and accept the Kinemaster',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              GestureDetector(
                onTap: () {
                  print('Terms of Services and Privacy Policy Clicked');
                },
                child: Text(
                  'Terms of Service and Privacy Policy',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account? ',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                  GestureDetector(
                      onTap: () {
                        print('SignIn with Google');
                      },
                      child: Text(
                        'Sign-in with google',
                        style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

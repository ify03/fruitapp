import 'package:flutter/material.dart';

import 'homepage.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: EdgeInsets.all(80.0),
            child: Image.asset('assets/images'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 80, right: 80, bottom: 40, top: 160),
            child: Text(
              textAlign: TextAlign.center,
              'We deliver groceries at your doorstep',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          //fresh items everyday
          Text(
            'Fresh items everyday',
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),

          const Spacer(),
          //get started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return HomePage();
              },
            )),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: EdgeInsets.all(24),
              child: Text(
                'Get Started',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Spacer()
        ],
      ),
    );
  }
}

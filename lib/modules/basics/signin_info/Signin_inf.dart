import 'package:flutter/material.dart';

class Information extends StatelessWidget {

  final String  email ;
  final String  pass ;
  Information({required this.email, required this.pass}) ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Email is : $email' ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue
              ),

            ),
            SizedBox(height: 30,),
            Text(
              'Your Password is : $pass' ,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.teal,
              ),

            ),
          ],
        ),
      ),






    );
  }
}

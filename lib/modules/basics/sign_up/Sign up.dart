import 'package:flutter/material.dart';

class Sign_up extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Sign up',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(

                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(
                      Icons.mail
                  ),
                  labelText: 'Email Adress ' ,


                ),

              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(
                      Icons.lock
                  ),
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon : Icon(
                        Icons.remove_red_eye
                    ),

                  ),

                ),
              ),
            ),
            SizedBox(height: 40) ,
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: MaterialButton(
                height: 60,
                onPressed:(){},
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                  ),
                ),
                color: Colors.blue,
              ),

            ),
            SizedBox(height: 20),


          ],
        ),
      ) ,


    );
  }
}

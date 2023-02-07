import 'package:flutter/material.dart';

class BMI_result extends StatelessWidget {

 final  int age ;
  final  double height ;
  final int weight;
  final bool ismale ;
  final double result;
  BMI_result({ required this.age, required this.height, required this.weight, required this.ismale ,required this.result}) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI result',
          ),
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          } ,
          icon: Icon(Icons.arrow_back_ios_sharp),
        ),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
           Text (
              'Gender : ${ismale ? 'male' : 'female' }',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),
                  
            ),
            Text(
              'Age : $age',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),

            ),
            Text(
              'Height : ${height.round()}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),

            ),
            Text(
              'Weight : $weight',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),

            ),
            Text(
              'Result : ${result.round()}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,

              ),

            ),

          ],
        ),
      ),



    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_flutter_projects/modules/bmi_app_modules/bmi/bmi_result/BMI_result_screen.dart';

class BMI  extends StatefulWidget {
  @override
  State<BMI> createState() => _BMIState();
}

class _BMIState extends State<BMI> {
  bool  is_male = true ;
  double val =120 ;
  int age= 20, weight=40;
  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
       title: Center(
         child: Text(
           'BMI Calculator' ,
           style: TextStyle(
             fontSize: 30,
           ),

         ),
       ) ,

        ),
      body: Column(
        children: [
          Expanded( 
            
            child: Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          is_male =true ;
                        });
                      },

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadiusDirectional.circular(20),
                          color: is_male ? Colors.blue : Colors.grey[400],
                        ),
                        child: Column(

                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(
                               image: AssetImage('assets/images/male.jpg'),
                             width: 80,
                             height: 80,
                           ) ,
                            Text(
                              'Male',
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                 SizedBox(width: 20),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          is_male = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                             borderRadius: BorderRadiusDirectional.circular(10),
                          color: is_male ?  Colors.grey[400] :Colors.blue
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                           Image(
                               image: AssetImage('assets/images/female.png'),
                             height: 80,
                             width: 80,
                           ),
                            Text(
                              'Female',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 25,
                              ),

                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(10),
                  color: Colors.grey[400],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT' ,
                      style: TextStyle(
                        fontSize: 30,
                      ),

                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic ,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${val.round()}',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        SizedBox(width: 5),
                        Text(
                          'cm',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                        value: val ,
                        onChanged: (value){
                          print(value.round());
                          setState(() {
                            val =value ;
                          });
                           },
                     max: 220,
                      min: 80,
                    )
                  ],
                ),
              ),
            )
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(10),
                        color: Colors.grey[400],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              'WEIGHT',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                heroTag:'w--' ,
                                child:  Icon(
                                  Icons.remove,
                                ) ,
                                mini: true,

                              ),
                              FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      weight++;
                                    });

                                  },
                                heroTag: 'w++',
                                mini: true,
                                child: Icon(Icons.add),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 20,),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadiusDirectional.circular(10),
                      color: Colors.grey[400],),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            '$age',
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });

                                },
                                heroTag: 'a--',
                                child:  Icon(
                                  Icons.remove,
                                ) ,
                                mini: true,
                              ),
                              FloatingActionButton(
                                  onPressed: (){
                                  setState(() {
                                  age++;
                                  });
                                },
                                heroTag: 'a++',
                                mini: true,
                                child: Icon(Icons.add),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ),


          Container(
            width: double.infinity,
            height:  60,
            child: MaterialButton(
                onPressed: (){
                  double result = weight/(pow((val/100), 2));
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> BMI_result(
                        height: val ,
                        age: age,
                        ismale: is_male ,
                        result: result,
                        weight: weight,
                      ) ,
                  )
                  );
                },
              color: Colors.blue,
              child: Text(
                'Calculate',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),

        ],
      ),
      );


  }
}

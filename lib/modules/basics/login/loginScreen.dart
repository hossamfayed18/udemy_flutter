import 'package:flutter/material.dart';
import 'package:my_flutter_projects/modules/basics/sign_up/Sign%20up.dart';
import 'package:my_flutter_projects/modules/basics/signin_info/Signin_inf.dart';
import 'package:my_flutter_projects/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool secure = true ;

  var email  = TextEditingController() ;

  var pass = TextEditingController();

  var formkey = GlobalKey<FormState>();

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
               key: formkey ,
              child: Column(
               children: [
                 Text(
                   'Log in' ,
                   style: TextStyle(
                     fontSize: 30 ,
                     fontWeight: FontWeight.bold,
                   ),
                 ),
                 SizedBox(
                   height: 20,
                 ),
                defaultTFF(
                    mycontroller: email,
                    mykeyboardType:TextInputType.emailAddress ,
                    text: 'Enter your Email',
                    myprefixIcon: Icons.email,
                    validatorfunction: (value){
                      if(value!.isEmpty)
                       { return ' the Email must not be empty ' ;}
                      return null;

                    }

                ),
                 SizedBox(
                   height: 10,
                 ),

                 defaultTFF(
                     mycontroller: pass,
                     mykeyboardType: TextInputType.visiblePassword,
                     text: 'Enter your Password',
                     myprefixIcon: Icons.lock,
                     ispass: secure,
                     mysuffixIcon: secure ? Icons.visibility_off  : Icons.remove_red_eye_outlined,
                     suffixiconfun: (){

                       setState(() {
                         secure=!secure ;
                       });
                     },
                     validatorfunction: (value){
                       if(value!.isEmpty)
                         { return'the password must not be empty';}
                       return null ;
                     }
                 ),
                 SizedBox(height: 50),

                   defaultButton(
                     mycolor: Colors.blue,
                     text: 'login',
                     isupercase: false,
                     function: () {
                       if (formkey.currentState !.validate()) {
                         print(email.text);
                         print(pass.text);
                         Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => Information(email: email.text, pass: pass.text)
                             )
                         );
                       }
                     }

                   ) ,
                 SizedBox(height: 15),
                 Row(
                   children: [
                     Text(
                         'Don\'t have an acount ?'

                     ),

                     Padding(
                       padding: EdgeInsetsDirectional.only(
                         start: 20,
                       ),
                       child: TextButton(
                           onPressed:(){
                           },
                           child: Text(
                             'Register now'
                           )
                       ),
                     )
                   ],
                 ),


               ],

              ),
            ),
          ),
        ),
      ),



    );
  }
}




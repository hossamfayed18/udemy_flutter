import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/social_app/Social_Layout.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/modules/social_app/social_register/cubit/cubit.dart';
import 'package:my_flutter_projects/modules/social_app/social_register/cubit/states.dart';
import 'package:my_flutter_projects/shared/components/components.dart';

class Social_Register extends StatelessWidget {

  var myformkey = GlobalKey<FormState>() ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context)=>SocialRegister_Cubit() ,
      child: BlocConsumer<SocialRegister_Cubit,SocialRegisterStates>(
        listener:(context,state){
          if(state is SocialCreateUserSuccessState) {
            navigateAndFinish(context, Social_Layout());
          }
        } ,
        builder: (context,state){
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsetsDirectional.all(20),
                  child: Form(
                    key: myformkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Register',
                          style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.black,
                          ),

                        ),
                        Text(
                          'Register now to communicate with friends',
                          style: Theme.of(context).textTheme.bodyText1!.copyWith(
                            color: Colors.grey,
                          ),

                        ),
                        SizedBox(height: 20),
                        defaultTFF(
                          mycontroller: nameController,
                          mykeyboardType: TextInputType.name,
                          text: 'User Name',
                          myprefixIcon: Icons.person,
                          validatorfunction:(value){
                            if(value.toString().isEmpty)
                            {return  'Please enter your name';}
                            return null ;
                          },
                        ),
                        SizedBox(height: 20),
                        defaultTFF(
                          mycontroller: emailController,
                          mykeyboardType: TextInputType.emailAddress,
                          text: 'Email Address',
                          myprefixIcon: Icons.email_outlined,
                          validatorfunction:(value){
                            if(value.toString().isEmpty)
                            {return  'Please enter your email';}
                            return null ;
                          },
                        ),
                        SizedBox(height: 20),
                        defaultTFF(
                          mycontroller:passController ,
                          mykeyboardType: TextInputType.visiblePassword,
                          text: 'Password',
                          myprefixIcon: Icons.lock_outline_sharp,
                          mysuffixIcon:SocialRegister_Cubit.get(context).myicon,
                          validatorfunction:(value){
                            if(value.toString().isEmpty)
                            {return  'Please enter your password';}
                            return null ;
                          },
                          ispass:SocialRegister_Cubit.get(context).ispass,
                          suffixiconfun: (){
                            SocialRegister_Cubit.get(context).chngePasswordVisibility();
                          },

                        ),
                        SizedBox(height: 20),
                        defaultTFF(
                          mycontroller: phoneController,
                          mykeyboardType: TextInputType.phone,
                          text: 'Phone',
                          myprefixIcon: Icons.phone,
                          validatorfunction:(value){
                            if(value.toString().isEmpty)
                            {return  'Please enter your phone';}
                            return null ;
                          },
                        ),
                        SizedBox(height: 20),
                        ConditionalBuilder(
                          condition:state is!SocialRegisterLoadingState ,
                          fallback: (context)=>Center(child: CircularProgressIndicator()),
                          builder:(context)=>  defaultButton(
                            function: (){
                              if(myformkey.currentState!.validate()) {
                                SocialRegister_Cubit.get(context).userRegister(
                                  email:emailController.text,
                                  password: passController.text,
                                  phone: phoneController.text,
                                  name: nameController.text,
                                );
                              }
                            },
                            text: 'Register',
                            isupercase: true,
                          ),
                        ),



                      ],
                    ),
                  ),
                ),
              ),
            ) ,
          );
        },
      ),
    );
  }
}

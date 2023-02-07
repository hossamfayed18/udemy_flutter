import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/social_app/Social_Layout.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/social_app/cubit/states.dart';
import 'package:my_flutter_projects/modules/social_app/social_register/socail_Register_Screen.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';

class Social_Login extends StatelessWidget {

  var myformkey = GlobalKey<FormState>();
  var  emailController= TextEditingController();
  var  passController= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SocialCubit,SocialStates>(
      listener:(context,state){
        if(state is SocialLoginErrorState)
          showToastMessage(text: state.error, state: ToastState.Error);

        if(state is SocialLoginSuccessState)
          navigateAndFinish(context, Social_Layout());

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
                        'Login',
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                          color: Colors.black,
                        ),

                      ),
                      Text(
                        'login now to communicate with friends',
                        style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey,
                        ),

                      ),
                      SizedBox(height: 20),
                      Column(
                        children: [
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
                           // text: 'Password',
                            text: 'Password',
                            myprefixIcon: Icons.lock_outline_sharp,
                            mysuffixIcon:SocialCubit.get(context).myicon,
                            validatorfunction:(value){
                              if(value.toString().isEmpty)
                              {return  'Please enter your password';}
                              return null ;
                            },
                            ispass: SocialCubit.get(context).ispass,
                            suffixiconfun: (){
                              SocialCubit.get(context).chngePasswordVisibility();
                            },

                          ),
                          SizedBox(height: 20),
                          ConditionalBuilder(
                            condition: state is!SocialLoadingState ,
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
                            builder:(context)=>  defaultButton(
                              function: (){
                                if(myformkey.currentState!.validate()) {
                                  SocialCubit.get(context).userLogin(email:emailController.text, password: passController.text,context: context);
                                }
                              },
                              text: 'Login',
                              isupercase: true,
                            ),
                          ),


                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account ?',
                                style: TextStyle(
                                  fontSize: 15,
                                ),


                              ),
                              TextButton(
                                onPressed:(){
                                  navigatorTo(context, Social_Register());
                                },
                                child: Text('REGISTER'),
                              )
                            ],
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

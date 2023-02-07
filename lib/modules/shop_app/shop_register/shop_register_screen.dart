import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/shop_app/shop_layout.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_Login/cubit/cubit.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_register/cubit/cubit.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_register/cubit/states.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/components/constants.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';
class Shop_register extends StatelessWidget {

  var myformkey = GlobalKey<FormState>() ;
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context)=>ShopRegister_Cubit(),
        child:BlocConsumer<ShopRegister_Cubit,ShopRegisterStates>(
          listener:(context,state){
            if(state is ShopRegisterSuccessState)
            {
              if(state.model.status!)
              {
                CacheHelper.saveData(key: 'token', value:state.model.data!.token).then((value) {
                  token= state.model.data!.token ;
                  showToastMessage(
                    text:state.model.message! ,
                    state: ToastState.Success,

                  );
                  navigateAndFinish(context, Shop_layout());
                });



              }else
              {
                showToastMessage(
                  text:state.model.message! ,
                  state: ToastState.Error,
                );


              }

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
                            'Register now to browse our hot offers',
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
                            mysuffixIcon:ShopRegister_Cubit.get(context).myicon,
                            validatorfunction:(value){
                              if(value.toString().isEmpty)
                              {return  'Please enter your password';}
                              return null ;
                            },
                            ispass:ShopRegister_Cubit.get(context).ispass,
                            suffixiconfun: (){
                              ShopRegister_Cubit.get(context).chngePasswordVisibility();
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
                            condition:state is!ShopRegisterLoadingState ,
                            fallback: (context)=>Center(child: CircularProgressIndicator()),
                            builder:(context)=>  defaultButton(
                              function: (){
                                if(myformkey.currentState!.validate()) {
                                  ShopRegister_Cubit.get(context).userRegister(
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
        ) ,
    );
  }
}

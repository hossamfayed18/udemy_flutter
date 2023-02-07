import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/states.dart';
import 'package:my_flutter_projects/layout/shop_app/shop_layout.dart';
import 'package:my_flutter_projects/models/shop_models/home_model.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_Login/cubit/cubit.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_Login/cubit/states.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_register/shop_register_screen.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/components/constants.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';



class Shop_Login extends StatelessWidget {

 var myformkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passController = TextEditingController();
    return BlocConsumer<ShopLayoutCubit,ShopLayoutStates>(
          listener:(context,state){
            if(state is ShopLoginSuccessState)
            {

              if(state.model.status!)
              {
                CacheHelper.saveData(key: 'token', value:state.model.data!.token).then((value) {
                  token= ShopLayoutCubit.get(context).loginmodel!.data!.token ;
                  ShopLayoutCubit.get(context).getHomeData();
                  ShopLayoutCubit.get(context).getFavorites();
                  ShopLayoutCubit.get(context).getCategories();
                  ShopLayoutCubit.get(context).getProfile();
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
          builder:(context,state)=> Scaffold(
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
                          'login now to browse our hot offers',
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
                              text: 'Password',
                              myprefixIcon: Icons.lock_outline_sharp,
                              mysuffixIcon:ShopLayoutCubit.get(context).myicon,
                              validatorfunction:(value){
                                if(value.toString().isEmpty)
                                {return  'Please enter your password';}
                                return null ;
                              },
                              ispass: ShopLayoutCubit.get(context).ispass,
                              suffixiconfun: (){
                                ShopLayoutCubit.get(context).chngePasswordVisibility();
                              },

                            ),
                            SizedBox(height: 20),
                            ConditionalBuilder(
                              condition:state is!ShopLoadingState ,
                              fallback: (context)=>Center(child: CircularProgressIndicator()),
                              builder:(context)=>  defaultButton(
                                function: (){
                                  if(myformkey.currentState!.validate()) {
                                    ShopLayoutCubit.get(context).userLogin(email:emailController.text, password: passController.text);
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
                                    navigatorTo(context, Shop_register());
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
          ),
    );
  }
}

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/states.dart';
import 'package:my_flutter_projects/models/shop_models/login_model.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_Login/shoploginScreen.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';
import 'package:my_flutter_projects/shared/network/remote/dio_helper.dart';

class Settings_screen extends StatelessWidget {


  var formkey = GlobalKey<FormState>();
  var nameController =  TextEditingController();
  var phoneController =  TextEditingController();
  var emailController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit,ShopLayoutStates>(
      listener: (context,state){

      } ,
        builder: (context,state){

        if(ShopLayoutCubit.get(context).profileModel!=null) {
          var model = ShopLayoutCubit
              .get(context)
              .profileModel!;

          nameController.text = model.data!.name!;
          emailController.text = model.data!.email!;
          phoneController.text = model.data!.phone!;
        }

       return ConditionalBuilder(
           condition: ShopLayoutCubit.get(context).profileModel!=null,
           fallback: (context){
             return Center(child: CircularProgressIndicator());
           },
           builder: (context){
           return Center(
             child: SingleChildScrollView(
               child: Padding(
                   padding: EdgeInsetsDirectional.all(20),
                   child: Form(
                     key: formkey,
                     child: Column(
                       children: [
                         if(state is ShopLoadingUpdateDatastate)
                         LinearProgressIndicator(),
                         SizedBox(height:10),
                         defaultTFF(
                           mycontroller: nameController,
                           mykeyboardType:TextInputType.name,
                           text: 'Name',
                           myprefixIcon: Icons.person ,
                           validatorfunction: (value){
                             if(value.toString().isEmpty)
                             {
                               return 'name must not be empty';
                             }
                             return null;
                           },
                         ),
                         SizedBox(height: 10,),
                         defaultTFF(
                           mycontroller: emailController,
                           mykeyboardType: TextInputType.emailAddress,
                           text: 'Email Address',
                           myprefixIcon: Icons.email,
                           validatorfunction: (value){
                             if(value.toString().isEmpty)
                             {
                               return 'name must not be empty';
                             }
                             return null;
                           },
                         ),
                         SizedBox(height: 10,),
                         defaultTFF(
                           mycontroller: phoneController,
                           mykeyboardType: TextInputType.phone,
                           text: 'Phone',
                           myprefixIcon: Icons.phone,
                           validatorfunction: (value){
                             if(value.toString().isEmpty)
                             {
                               return 'name must not be empty';
                             }
                             return null;
                           },
                         ),
                         SizedBox(height: 20,),
                         Column(
                           children: [
                             defaultButton(
                               function:(){
                                 if(formkey.currentState!.validate()) {
                                   ShopLayoutCubit.get(context).userUpdate(
                                     name: nameController.text,
                                     phone: phoneController.text,
                                     email: emailController.text,
                                   );
                                 }
                               },
                               text: 'Update' ,
                             ),
                             SizedBox(height: 20,),
                             defaultButton(
                               function:(){
                                 CacheHelper.removeData(key:'token').then((value){
                                   if(value)
                                   navigateAndFinish(context, Shop_Login());
                                 });

                               },
                               text: 'Logout' ,
                             ),
                           ],
                         ),

                       ],
                     ),
                   ),
                 ),
             ),
           );
           },

       );
    },
    );
  }
}

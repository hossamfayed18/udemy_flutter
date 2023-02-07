import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/states.dart';
import 'package:my_flutter_projects/models/shop_models/categories_model.dart';
import 'package:my_flutter_projects/shared/components/components.dart';

class Categories_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit,ShopLayoutStates>(
      listener: (context,state){
        },
        builder: (context,state){
         return ConditionalBuilder(
           condition: ShopLayoutCubit.get(context).categoriesModel!=null,
           fallback: (context){
             return Center(
               child:CircularProgressIndicator(),
             );
           } ,
           builder: (context){
             return  Padding(
               padding: EdgeInsets.all(20),
               child: ListView.separated(
                 itemBuilder: (context,index)=>buildCategoryItem(ShopLayoutCubit.get(context).categoriesModel!.data!.list[index]),
                 separatorBuilder:(context,index)=>mydivider(),
                 itemCount: ShopLayoutCubit.get(context).categoriesModel!.data!.list.length,
               ),
             );
           },
         );
        },
    ) ;

  }

 Widget buildCategoryItem(DataList model){
    return  Row(
      children: [
        Image(
          image:ExtendedNetworkImageProvider(model.image!),
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 20),
        Text(
          model.name!,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
          ),
        ),
        Spacer(),
        Icon(
          Icons.arrow_forward_ios,
        ),

      ],
    );
 }

}
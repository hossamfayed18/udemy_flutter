import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/states.dart';
import 'package:my_flutter_projects/models/shop_models/get_favorite_midel.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/style/colors.dart';

class Favorites_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit,ShopLayoutStates>(
      listener: (context,state){

      },
        builder: (context,state){
         return  ListView.separated(
             itemBuilder: (context,index)=>buildListItem(ShopLayoutCubit.get(context).getFavoriteModel!.data!.data![index].product!,context),
             separatorBuilder: (context,index)=>mydivider(),
             itemCount:ShopLayoutCubit.get(context).getFavoriteModel!.data!.data!.length,
         );
        }
    );
  }



}
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/states.dart';
import 'package:my_flutter_projects/models/shop_models/categories_model.dart';
import 'package:my_flutter_projects/models/shop_models/home_model.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/style/colors.dart';

class Products_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopLayoutCubit,ShopLayoutStates>(
      listener: (context,state){
       if(state is ShopSuccessSetFavoriteState)
         {
           if(state.model.status!) {
             showToastMessage(
                 text: state.model.message!, state: ToastState.Success);
           }
               else
             showToastMessage(text: state.model.message!, state: ToastState.Error);
             }
       //  showToastMessage(text: text, state: state);
      },
      builder: (context,state){
         return ConditionalBuilder(
           condition:  ShopLayoutCubit.get(context).model!=null && ShopLayoutCubit.get(context).categoriesModel!=null,
           fallback: (context){
             return Center(
               child:CircularProgressIndicator(),
             );
           } ,
           builder: (context){
             return buildproducts(ShopLayoutCubit.get(context).model!,ShopLayoutCubit.get(context).categoriesModel!,context);
           },
         ) ;
      },
    );
  }


  Widget buildproducts (HomeModel model,Categories_Model categoriesmodel,context){
    return SingleChildScrollView(
       physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          CarouselSlider(
            // items:  model.data!.banners.map((e)=>Image(
            //   image: NetworkImage(
            //       '${e.image}'
            //   ),
            //   width: double.infinity,
            //   fit:BoxFit.cover ,
            // )).toList(),
            items: List.generate(model.data!.banners.length, (index) {
              return Column(
                children: [
                  Image(
                    image: ExtendedNetworkImageProvider(
                        '${model.data!.banners[index].image}'
                    ),
                      // image:NetworkImage(
                      //   '${model.data!.banners[index].image}',
                      // ) ,
                    width: double.infinity,
                    height: 200,
                    fit:BoxFit.fill,
                  ),
                ],
              );
      }),
            options:CarouselOptions(
              height: 200,
              // initialPage: 0, //default 0
              //enableInfiniteScroll: true, //default true
              //reverse:  false, //default false
              autoPlay: true,//default false
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration:Duration(seconds: 1) ,
              //autoPlayCurve: Curves.fastOutSlowIn ,  //dfault Curves.fastOutSlowIn
              // scrollDirection: Axis.horizontal, //default Axis.horizontal
              viewportFraction: 1,  //default 0.8

            ) ,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: 20),
         Container(
                 height: 100,
                 child: ListView.separated(
                   physics: BouncingScrollPhysics(),
                   scrollDirection: Axis.horizontal,
                     itemBuilder: (context,index)=>buildListItem(categoriesmodel.data!.list[index]),
                     separatorBuilder: (context,index)=>SizedBox(width: 5),
                     itemCount: categoriesmodel.data!.list.length,
                 ),
         ),
                SizedBox(height: 20),
                Text(
                    'New Products',
                   style: TextStyle(
                     fontSize: 24,
                   ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
         Container(
           color: Colors.grey[300],
           child: GridView.count(
             mainAxisSpacing:1 ,
             crossAxisSpacing:1 ,
             childAspectRatio: 1/1.57,
             shrinkWrap: true,
             physics: NeverScrollableScrollPhysics(),
             crossAxisCount: 2,
             children:  List.generate(model.data!.products.length, (index) =>buildGridItem(model.data!.products[index],context),

             ),


            ),
         ),
        ],
      ),
    ) ;
  }

  Widget buildGridItem(ProductModel model,context){
    return  Container(
      color: Colors.white,
      child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: ExtendedNetworkImageProvider(
                    '${model.image}',

                ),
                width: double.infinity,
                height: 200,
               // fit: BoxFit.cover,
              ),
              if(model.discount!=0)
              Container(
                color: Colors.red,
                child: Text(
                    'DISCOUNT',
                  style: TextStyle(
                    color: Colors.white
                  ),

                ),
                padding: EdgeInsets.symmetric(horizontal: 5.0),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsetsDirectional.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  model.name!,
                   maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                   style: TextStyle(
                     fontSize: 14,
                     height: 1.3,
                   ),
                ),
                Row(
                  children: [
                    Text(
                      '${model.price.round()}',
                      style: TextStyle(
                        fontSize: 12,
                        color: defaultcolor,
                      ),
                    ),
                    SizedBox(width: 5),
                    if(model.discount!=0)
                    Text(
                      '${model.old_price.round()}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        decoration:  TextDecoration.lineThrough,

                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor:ShopLayoutCubit.get(context).favorites[model.id!]==true? defaultcolor:Colors.grey ,
                      child: IconButton(
                          onPressed:(){
                            ShopLayoutCubit.get(context).myfavorites(model.id!);
                          },
                        icon: Icon(
                          Icons.favorite_border,
                          size: 12,
                          color: Colors.white,
                        ),

                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }

 Widget buildListItem (DataList dataList){
  return  Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(
          image:ExtendedNetworkImageProvider(
            '${dataList.image!}',
          ),
        height:100 ,
        width:100 ,
      ),
      Container(
        width: 100,
        color: Colors.black.withOpacity(0.7),
        child: Text(
          '${dataList.name!}',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  );
}

}
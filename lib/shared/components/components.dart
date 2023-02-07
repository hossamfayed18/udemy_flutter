import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/cubit.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/cubit.dart';
import 'package:my_flutter_projects/modules/newsApp_modules/web_view/web_view_screen.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_Login/shoploginScreen.dart';
import 'package:my_flutter_projects/shared/cubit/cubit.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';
import 'package:my_flutter_projects/shared/style/colors.dart';
import 'package:my_flutter_projects/shared/style/icon_broken.dart';
Widget defaultButton (
    {
  Color mycolor = Colors.blue,
  String text = 'Login',
  double myheight = 40,
  double mywidth = double.infinity,
   bool isupercase = true  ,
  required  Function() function ,
}
 )

=>  Container(
  //width:mywidth,
  height: myheight,
  color: mycolor,
  child: MaterialButton(
    minWidth: 1,
    child:Text(
      isupercase ? text.toUpperCase() : text ,
      style: TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
    ),
    onPressed: function ,

    ),

  ) ;





Widget defaultTFF (
{
 required TextEditingController ? mycontroller ,
  required TextInputType ? mykeyboardType ,
  required   String ? text ,
required  IconData ? myprefixIcon   ,
  IconData ?  mysuffixIcon ,
  bool ispass = false ,
 Function (String value) ? onsubmitedfunction  ,
Function (String x)  ?  onChangedfunction ,
  FormFieldValidator<String>? validatorfunction ,
 Function() ? suffixiconfun ,
  Function() ? ontapfun ,

}
)

=>   TextFormField(
controller: mycontroller ,
validator: validatorfunction ,
onFieldSubmitted: onsubmitedfunction,
onChanged: onChangedfunction,
obscureText: ispass,
keyboardType:mykeyboardType ,
onTap: ontapfun,
decoration: InputDecoration(
labelText: text,
border: OutlineInputBorder(),
prefixIcon: Icon(
    myprefixIcon
),
suffixIcon: IconButton(
    icon: Icon(mysuffixIcon),
  onPressed:  suffixiconfun ,
)
),

) ;

Widget  buildTaskItem ({ required String title,required String time, required String date, required int id,required context}){
 return Dismissible(
   key: Key('id'),
   onDismissed:(direction){
    Homecubit.get(context).deleteDatabase(id: id);
   } ,
   child: Padding(
      padding: EdgeInsetsDirectional.all(20),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal : 10,
              ),
              child: Text(
                '$date',
              ),
            ),
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '$title',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  '$time',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 20,),
          IconButton(
              onPressed: (){
                Homecubit.get(context).updateDtaBase(status: 'done', id: id );
              },
              icon: Icon(
                  Icons.check_box,
                color: Colors.green,

              ),
          ),
          IconButton(
              onPressed: (){
                Homecubit.get(context).updateDtaBase(status: 'archived', id: id );
              },
              icon: Icon(
                Icons.archive,
                color: Colors.black45,
              ) ,
          ),
        ],
      ),
    ),
 );
}


Widget mydivider ()=>Padding(
  padding: EdgeInsetsDirectional.only(
      start: 10
  ),
  child:   Container(
    padding: EdgeInsets.symmetric(vertical: 10),
    height: 1,
    width: double.infinity,
    color: Colors.grey,
  ),
);


Widget taskbuilder ({ required List<Map> tasks}){
  return ConditionalBuilder(
      condition: tasks.length>0,
      builder: (context){
        return ListView.separated(
          itemBuilder : (context,index){
            return  buildTaskItem(
              title:tasks[index]['title'] ,
              time:tasks[index]['time'] ,
              date: tasks[index]['date'] ,
              id: tasks[index]['id'],
              context: context,
            );
          },
          separatorBuilder: (context ,index){
            return  Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              height: 1,
              width: double.infinity,
              color: Colors.black.withOpacity(0.1),
            );
          },
          itemCount:tasks.length,
        );
      },
      fallback: (context){
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.menu,
                size: 40,
                color: Colors.grey,
              ),
              Text(
                'There is no tasks added yet',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        );
      }
  );
}

Widget buildNewsItem(articles,context,index)=> Container(
  color: News_cubit.get(context).selectedItemIndex==index && News_cubit.get(context).ismobile==false? Colors.grey[200] : null,
  child:   InkWell(
    onTap: (){
      News_cubit.get(context).selectNewsItem(index);
      //navigatorTo(context, WebViewScreen(url: articles['url']));
    },

    child:   Padding(



      padding: EdgeInsetsDirectional.all(20),



      child: Row(



        children: [



          Container(



            height:120,



            width:120,



            decoration: BoxDecoration(



              borderRadius: BorderRadius.circular(10),



              image: DecorationImage(



                fit: BoxFit.cover,



                image: NetworkImage(



                    articles['urlToImage']!=null ? articles['urlToImage'] : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQm1ih4K54S2VkP-e6HVcQmVxpOPL0-r3t6xQ&usqp=CAU'



              ),



                ),



              ),



            ),



          SizedBox(width: 20),



          Expanded(



            child: Container(



              height: 120,



              child: Column(



                crossAxisAlignment: CrossAxisAlignment.start,



                children: [



                  Expanded(



                    child: Text(



                      '${articles['title']}',



                      maxLines:4 ,



                      overflow: TextOverflow.ellipsis,



                      style: Theme.of(context).textTheme.bodyText1,



                  )



                  ),



                  Text(



                    '${articles['publishedAt']}',



                    style: TextStyle(



                      color: Colors.grey,



                    ),







                  ),



                ],



              ),



            ),



          ),



        ],



      ),



    ),

  ),
);



Widget articlebuilder (List list,context,{bool isSearch =false}){
return ConditionalBuilder(
  condition: list.length>0,
  fallback: (context) =>isSearch ==false ? Center(child: CircularProgressIndicator()) : Container(),
  builder: (context){
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemBuilder: (context,index){
         return  buildNewsItem(list[index],context,index);
      },
      separatorBuilder: (context,index)=> mydivider(),
      itemCount: list.length,
    );
  } ,

);


}

void navigatorTo(context,Widget widget){
  Navigator.push(context,MaterialPageRoute(
      builder:  (context){return widget;}
  ));
}

void navigateAndFinish(context,Widget widget){
  Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
      builder:(context){return widget;}
  ),(route) {
    return false;
  },);
}

void showToastMessage({
  required String text,
  required ToastState state ,
}){

  Fluttertoast.showToast(
      msg:text ,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: setToastColor(state),
      textColor:Colors.white,
      fontSize: 16.0,
  );
}

enum ToastState {Success,Error,Warning}

Color setToastColor (ToastState state){
Color color = Colors.red ;
  switch(state) {
    case ToastState.Success:
      color= Colors.green;
        break;
    case ToastState.Error:
      color= Colors.red;
      break;
    case ToastState.Warning:
      color= Colors.amber;
      break;
  }
  return color ;

}

void signOut (context){
  CacheHelper.removeData(key: 'token').then((value){
    if(value)
      navigateAndFinish(context, Shop_Login());
  }) ;
}


Widget buildListItem ( model,context,{isSearch=false}){
  return  Padding(
    padding: EdgeInsetsDirectional.all(20),
    child: Container(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomStart,
            children: [
              Image(
                image: ExtendedNetworkImageProvider(
                  model.image!,
                ),
                //width: double.infinity,
                height: 150,
                width: 150,
                fit: BoxFit.cover,
              ),
              if(!isSearch)
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
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  model.name! ,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.3,
                  ),
                ),
                Spacer(),
                Row(
                  children: [
                    Text(
                      model.price!.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        color: defaultcolor,
                      ),
                    ),
                    SizedBox(width: 5),
                     if(!isSearch)
                    if(model.discount!=0)
                      Text(
                        model.oldPrice!.toString(),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          decoration:  TextDecoration.lineThrough,

                        ),
                      ),
                    Spacer(),
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: ShopLayoutCubit.get(context).favorites[model.id!]==true? defaultcolor:Colors.grey ,
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
    ),
  );
}


PreferredSizeWidget defualtAppBar ({
  required BuildContext context ,
  String ? title,
  List<Widget>? actions ,
}){
  return AppBar(
    title:title!=null ? Text(
      title?? '',

    ):null,
    leading:IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
      icon: Icon(
          IconBroken.Arrow___Left_2,
      ),
    ),
    actions: actions!=null ? actions:null,
    //titleSpacing: 5.0,

  );
}
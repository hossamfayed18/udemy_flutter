import 'package:flutter/material.dart';


class MessengerUser{
final  String  img ;
final  String  name ;

MessengerUser({ required this.name, required this.img}) ;

}



class  Messenger extends StatelessWidget {

  List<MessengerUser> users =[
    MessengerUser(name: 'Mostafa Mohamed', img: 'https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/278419114_5032999470114754_5647194792529713812_n.jpg?stp=dst-jpg_p320x320&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_ohc=gzuqNqnz0pEAX8aDKTF&tn=TQGKboTVTxuBeN_9&_nc_ht=scontent.fcai19-8.fna&oh=00_AT__L0icLqOa1bln-ZrIIVPtB6926ZeGNTehznBgNBQ8eA&oe=634271C8'),
    MessengerUser(name: 'King Mohamed', img: 'https://scontent.fcai19-8.fna.fbcdn.net/v/t1.6435-1/79858745_1859553760855475_3236586525613359104_n.jpg?stp=dst-jpg_p320x320&_nc_cat=105&ccb=1-7&_nc_sid=7206a8&_nc_ohc=gyU3-vZFfD8AX-FWG3f&_nc_ht=scontent.fcai19-8.fna&oh=00_AT_RrHHkq0waEDE16Lc7DQeypetsL_8ok3XRnldCx6LZLQ&oe=63636806'),
    MessengerUser(name: 'Hossam mohamed', img: 'https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-6/296522992_3353048874952765_5794463898963897369_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=hk6hBo_CrnMAX9K9HAd&_nc_ht=scontent.fcai19-8.fna&oh=00_AT8y6pSlapw7O4ZSl-lt_VuZ1c4dDRaj2PRGbTs8BVnIgA&oe=63421DD4'),
    MessengerUser(name: 'Mostafa Mohamed', img: 'https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/278419114_5032999470114754_5647194792529713812_n.jpg?stp=dst-jpg_p320x320&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_ohc=gzuqNqnz0pEAX8aDKTF&tn=TQGKboTVTxuBeN_9&_nc_ht=scontent.fcai19-8.fna&oh=00_AT__L0icLqOa1bln-ZrIIVPtB6926ZeGNTehznBgNBQ8eA&oe=634271C8'),
    MessengerUser(name: 'King Mohamed', img: 'https://scontent.fcai19-8.fna.fbcdn.net/v/t1.6435-1/79858745_1859553760855475_3236586525613359104_n.jpg?stp=dst-jpg_p320x320&_nc_cat=105&ccb=1-7&_nc_sid=7206a8&_nc_ohc=gyU3-vZFfD8AX-FWG3f&_nc_ht=scontent.fcai19-8.fna&oh=00_AT_RrHHkq0waEDE16Lc7DQeypetsL_8ok3XRnldCx6LZLQ&oe=63636806'),
    MessengerUser(name: 'Hossam mohamed', img: 'https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-6/296522992_3353048874952765_5794463898963897369_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=hk6hBo_CrnMAX9K9HAd&_nc_ht=scontent.fcai19-8.fna&oh=00_AT8y6pSlapw7O4ZSl-lt_VuZ1c4dDRaj2PRGbTs8BVnIgA&oe=63421DD4'),
    MessengerUser(name: 'Mostafa Mohamed', img: 'https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-1/278419114_5032999470114754_5647194792529713812_n.jpg?stp=dst-jpg_p320x320&_nc_cat=100&ccb=1-7&_nc_sid=7206a8&_nc_ohc=gzuqNqnz0pEAX8aDKTF&tn=TQGKboTVTxuBeN_9&_nc_ht=scontent.fcai19-8.fna&oh=00_AT__L0icLqOa1bln-ZrIIVPtB6926ZeGNTehznBgNBQ8eA&oe=634271C8'),
    MessengerUser(name: 'King Mohamed', img: 'https://scontent.fcai19-8.fna.fbcdn.net/v/t1.6435-1/79858745_1859553760855475_3236586525613359104_n.jpg?stp=dst-jpg_p320x320&_nc_cat=105&ccb=1-7&_nc_sid=7206a8&_nc_ohc=gyU3-vZFfD8AX-FWG3f&_nc_ht=scontent.fcai19-8.fna&oh=00_AT_RrHHkq0waEDE16Lc7DQeypetsL_8ok3XRnldCx6LZLQ&oe=63636806'),
    MessengerUser(name: 'Hossam mohamed', img: 'https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-6/296522992_3353048874952765_5794463898963897369_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=hk6hBo_CrnMAX9K9HAd&_nc_ht=scontent.fcai19-8.fna&oh=00_AT8y6pSlapw7O4ZSl-lt_VuZ1c4dDRaj2PRGbTs8BVnIgA&oe=63421DD4')
  ] ;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
    appBar: AppBar(
      titleSpacing: 20,
      title: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(
              'https://scontent.fcai19-8.fna.fbcdn.net/v/t39.30808-6/296522992_3353048874952765_5794463898963897369_n.jpg?_nc_cat=101&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=hk6hBo_CrnMAX9K9HAd&_nc_ht=scontent.fcai19-8.fna&oh=00_AT8y6pSlapw7O4ZSl-lt_VuZ1c4dDRaj2PRGbTs8BVnIgA&oe=63421DD4'
            ) ,
          ),
          SizedBox(width: 10 ,),
          Text(
            'Chats',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),

          )
        ],
      ),
      actions: [

        CircleAvatar(
          radius: 16,
          backgroundColor: Colors.blue,
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 15),

        Padding(
          padding: EdgeInsetsDirectional.only(
            end: 10,
          ),
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 16,
            child: Icon(
                Icons.edit ,
                color: Colors.white,
            ),
          ),
        ),
      ],
      elevation: 0.0,
      backgroundColor: Colors.white,
    ),

   body: Padding(
     padding: const EdgeInsets.all(20), 
     
     child: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [

           Container(


             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(
                   0.0


               ),
               color: Colors.grey[300],
             ),
             child: Padding(
               padding: EdgeInsetsDirectional.only(
                 start: 0,
               ),
               child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   IconButton(
                       onPressed: (){},
                        icon: Icon(Icons.search),
                   ),

                   Text(
                       'Search'
                   ),

                 ],
               ),
             ),
           ),
           SizedBox(height:20), 
           
           Container(
            height: 100,
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemBuilder: (context,index)=> BuildStortItem(users[index]),
               separatorBuilder: (context,index)=> SizedBox(width: 2) ,
               itemCount: users.length ,

             ),
           ) ,
           SizedBox(height: 20),

           
              ListView.separated(
                shrinkWrap: true,
                 physics: NeverScrollableScrollPhysics(),
                   itemBuilder: (context,index)=>BuildChatItem(users[index]),
                 separatorBuilder:(context,index)=> SizedBox(height: 10),
                 itemCount: users.length,
             ),
           





        ]
       ),
     ),
   ) ,

    );
  }









Widget BuildStortItem (MessengerUser ob)=> Container(

  width: 80,
  child:   Column(

    children: [
      Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [

          CircleAvatar(

              radius: 30,
              backgroundImage:NetworkImage(
                '${ob.img}'

              )


          ),

          Padding(
            padding: EdgeInsetsDirectional.only(
              bottom: 5,

            ),
            child: CircleAvatar(

              radius: 6,
              backgroundColor: Colors.green,
            ),
          )


        ],
      ),
      SizedBox(height: 5),

      Row(
        children: [
          SizedBox(width: 15),
          Expanded(
            child: Text(
              maxLines: 2,
                overflow: TextOverflow.ellipsis,
                '${ob.name}'
            ),
          ),
        ],
      ),




    ],
  ),
) ;

Widget BuildChatItem(MessengerUser ob)=>    Row(
  children: [

    Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [

        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(
              '${ob.img}'
          ),
        ),

        Padding(
          padding: EdgeInsetsDirectional.only(
              bottom: 5
          ),
          child: CircleAvatar(
            radius: 6,
            backgroundColor: Colors.green,
          ),
        ),

      ],
    ) ,
    SizedBox(width: 15 ),

    Expanded(

      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${ob.name}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 7,),


          Row(
            children: [
              Expanded(
                child: Text(

                  'hello my friend ${ob.name}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 15,
                  ),

                ),
              ),


              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                ),

              ),

              Text('4:50 AM'),

            ],
          ),



        ],

      ),
    ),


  ],

)  ;
}



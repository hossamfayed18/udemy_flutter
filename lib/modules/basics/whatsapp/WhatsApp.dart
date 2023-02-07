import 'package:flutter/material.dart';

class WhatsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(

 appBar: AppBar(
   backgroundColor: Colors.teal[600],
   elevation: 0,
   title: Text(
     'WhatsApp',
   ),
   actions: [
     IconButton(
         onPressed: (){},
         icon : Icon(Icons.search),
     ),
     TextButton(
         onPressed: (){},
           child: Text(
             '⋮',
             style: TextStyle(
               color: Colors.white,
               fontSize: 25
             ),
           ),

     )
   ],
 ),
      body: Column(
        children: [
          Container(
            color: Colors.teal[600],
            child: Padding(
              padding: EdgeInsetsDirectional.only(
                start: 10,
              ),
              child: Row(
               children: [

                 Icon(Icons.camera_alt,
                     color: Colors.white.withOpacity(0.6),
                 ),
                 TextButton(
                     onPressed: (){},
                     child: Text(
                       'CHATS',
                       style: TextStyle(
                         color: Colors.white,
                         fontSize: 20,
                       ),
                     )
                 ),
                 CircleAvatar(
                   radius: 10,
                   backgroundColor: Colors.white,
                   child: Text(
                     '1'
                   ),
                 ),
                 SizedBox(width: 40,),
                 TextButton(
                     onPressed: (){},
                     child: Text(
                       'STATUS',
                       style: TextStyle(
                         color: Colors.white.withOpacity(0.5),
                         fontSize: 20,
                       ),
                     )
                 ),
                 SizedBox(width: 40,),
                 TextButton(
                     onPressed: (){},
                     child: Text(
                       'CALLS',
                       style: TextStyle(
                         color: Colors.white.withOpacity(0.5),
                         fontSize: 20,
                       ),
                     )
                 ),
               ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsetsDirectional.only(
              top: 15,
              start: 25,
            ),
            child: Row(
              children: [
     Icon(Icons.unarchive_outlined),
                SizedBox(width: 25),
                Text(
                             'Archived',
                  style: TextStyle(
                    fontSize:25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),

          Expanded(
            child: ListView.separated(
                itemBuilder: (context,index)=>buildchat(),
               separatorBuilder :(context,index)=>SizedBox(height: 0,),
                itemCount: 9,
            ),
          )

        ],
      ),

    );
  }


Widget buildchat ()=>Padding(
  padding: EdgeInsets.only(right: 15),
  child: Container(
    padding:EdgeInsets.symmetric(horizontal: 10) ,
   height: 70,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          // backgroundColor: Colors.white30,
          radius: 30,
          backgroundImage: NetworkImage(
              'https://scontent.fcai19-8.fna.fbcdn.net/v/t1.6435-9/101076997_573130846942261_4545737398529945133_n.jpg?_nc_cat=100&ccb=1-7&_nc_sid=174925&_nc_ohc=NGz8D1eLR5IAX-PcSSx&tn=TQGKboTVTxuBeN_9&_nc_ht=scontent.fcai19-8.fna&oh=00_AT8XFbco6vac9c1OTte6PHKoTht7y-pt8OLeJTBlB9bpjw&oe=63640CBD'
          ),
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsetsDirectional.only(start: 20),
            height:110 ,
            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Zeyad',
                      style:TextStyle(
                        fontSize: 20,
                      ),

                    ),
                    SizedBox(width: 170),
                    Text(
                      '7:33 am',
                      style:TextStyle(
                        color: Colors.green,
                        fontSize: 20,
                      ),

                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.only(
                      top: 5
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Hello my friend Hello my friend Hello my friend ',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //SizedBox(width: 10),

                      CircleAvatar(
                        backgroundColor: Colors.green,
                        radius: 12,
                        child: Text(
                          '1',
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),

                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ),
      ],
    ),
  ),
);


}

import 'package:flutter/material.dart';

import '../../../models/usermodel.dart';

class UsersScreen extends StatelessWidget {

  List <Usermodel> users  = [
    Usermodel(
      id: 1,
      name: 'Hossammmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm',
      phone: '01020174911'
    ),
    Usermodel(
        id: 2,
        name: 'Zeyad',
        phone: '01020174911'
    ),
    Usermodel(
        id: 3,
        name: 'Mo\'men',
        phone: '01020174911'
    ),
    Usermodel(
        id: 4,
        name: 'Moustafa',
        phone: '01020174911'
    ),
    Usermodel(
        id: 5,
        name: 'Salah',
        phone: '01020174911'
    ),
    Usermodel(
        id:6 ,
        name: 'Nour',
        phone: '01020174911'
    ),
    Usermodel(
        id: 1,
        name: 'Hossam',
        phone: '01020174911'
    ),
    Usermodel(
        id: 2,
        name: 'Zeyad',
        phone: '01020174911'
    ),
    Usermodel(
        id: 3,
        name: 'Mo\'men',
        phone: '01020174911'
    )
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        titleSpacing:150 ,
        title: Text(
          'Users' ,
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
     body: ListView.separated(
         itemBuilder: (context,index)=>user(users[index]),
         separatorBuilder: (context,index)=>Container(
           width: double.infinity,
           height: 1,
            color: Colors.grey[450] ,
         ),
         itemCount: 9 ,
     )


    );
  }


Widget user (Usermodel m) => Padding(
  padding: EdgeInsetsDirectional.only(
    top: 20,
    start: 20,
  ),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(
        child: Text(
          '${m.id}' ,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,

          ),
        ),
      ),
      SizedBox(width: 20,),

      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(

              '${m.name}',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${m.phone}',
              style: TextStyle(
                fontSize: 15,
                color: Colors.grey[500],
              ),
            ),

          ],
        ),
      ),

    ],

  ),
);


}

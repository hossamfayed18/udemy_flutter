import 'package:flutter/material.dart';
import 'package:my_flutter_projects/modules/shop_app/shop_Login/shoploginScreen.dart';
import 'package:my_flutter_projects/shared/components/components.dart';
import 'package:my_flutter_projects/shared/network/local/cache_helper.dart';
import 'package:my_flutter_projects/shared/style/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
Widget builBoardingItem(BoardingModel model){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Padding(
          padding: EdgeInsetsDirectional.all(40),
          child: Image(
            height: 50,
            image: AssetImage(
              model.image,
            ),
          ),
        ),
      ),
      SizedBox(height: 30),
      Text(
        model.title,
        style: TextStyle(
          fontSize: 22,
        ),

      ),
      SizedBox(height: 15),
      Text(
        model.body,
        style: TextStyle(
          fontSize: 14,
        ),
      ),

    ],
  );
}

class BoardingModel{
  final String image;
  final String title;
  final String body;
  BoardingModel({ required this.image,required this.title,required this.body});
}



class On_boarding extends StatelessWidget {

  var pageViewController = PageController();

  List<BoardingModel> boardinglist = [
    BoardingModel(
      image:'assets/images/on_board1.jpg' ,
      title: 'On Board 1 Title',
      body: 'On Board 1 Body',
    ),
    BoardingModel(
      image:'assets/images/on_board1.jpg' ,
      title: 'On Board 2 Title',
      body: 'On Board 2 Body',
    ),
    BoardingModel(
      image:'assets/images/on_board1.jpg' ,
      title: 'On Board 3 Title',
      body: 'On Board 3 Body',
    ),
  ];
  bool isLast=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            TextButton(
                onPressed: (){
                  CacheHelper.saveData(key: 'boardingSeen', value: true).then((value) {
                    navigateAndFinish(context, Shop_Login());
                  });
                },
                child: Text(
                  'Skip',
                    style: TextStyle(
                      fontSize: 15,
                    ),
                )
            ),
          ],
        ),
        body: Padding(
          padding: EdgeInsetsDirectional.all(20),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller:pageViewController,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index){
                    return builBoardingItem(boardinglist[index]);
                    },
                  itemCount: boardinglist.length,
                  onPageChanged: (index){
                    if(index==boardinglist.length-1)
                      isLast=true;
                    else
                      isLast=false;
                  },
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  SmoothPageIndicator(
                      controller: pageViewController,
                      count: boardinglist.length,
                      effect: ExpandingDotsEffect(
                        dotColor: Colors.grey,
                        activeDotColor: defaultcolor,
                        dotHeight: 10,
                        dotWidth: 10,
                        expansionFactor: 3,
                        spacing: 10

                      ) ,
                  ),
                  Spacer(),
                  FloatingActionButton(
                    backgroundColor: defaultcolor,
                      onPressed: (){
                         if(isLast) {
                           CacheHelper.saveData(
                               key: 'boardingSeen', value: true).then((value) {
                             navigateAndFinish(context, Shop_Login());
                           });
                         }
                           else {
                           pageViewController.nextPage(
                             duration: Duration(
                                 milliseconds: 750
                             ),
                             curve: Curves.fastLinearToSlowEaseIn,
                           );
                         }
                      },
                    child: Icon(
                        Icons.arrow_forward_ios_outlined
                    ),
                  ),



                ],
              ),
            ],
          ),

        ),


    );
  }
}

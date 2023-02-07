import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/cubit.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/states.dart';
import 'package:my_flutter_projects/shared/components/components.dart';

class Search extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<News_cubit,NewsStates>(
      listener: (context,state){
      },
      builder: (context,state){
        //List list = News_cubit.get(context).search ;
        return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.all(20),
                  child: defaultTFF(

                    mycontroller: searchController,
                    mykeyboardType:TextInputType.text ,
                    text: 'Search',
                    myprefixIcon: Icons.search,
                    validatorfunction: (value){
                      if(value.toString().isEmpty==null)
                      { return 'the search must not be empty' ;}
                      return null;
                    },
                    onChangedfunction: (value){
                      News_cubit.get(context).getSearchData(value);
                    },
                  ),
                ),
                Expanded(child: articlebuilder(News_cubit.get(context).search,context,isSearch: true)),

              ],
            )
        );
      },
    );
  }
}

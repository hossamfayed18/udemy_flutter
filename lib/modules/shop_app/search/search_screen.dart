import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/modules/shop_app/search/cubit/cubit.dart';
import 'package:my_flutter_projects/modules/shop_app/search/cubit/states.dart';
import 'package:my_flutter_projects/shared/components/components.dart';

class Search_screen extends StatelessWidget {

 var searchcontroller =TextEditingController();
  var formKey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
        create: (context)=> SearchCubit(),
      child: BlocConsumer<SearchCubit,SearchStates>(
        listener: (context,state){
          
        },
        builder: (context,state){
         return Scaffold(
            appBar: AppBar(),
            body:  Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsetsDirectional.all(20),
                child: Column(
                  children: [
                   defaultTFF(
                       mycontroller: searchcontroller,
                       mykeyboardType:TextInputType.text,
                       text: 'Search',
                       myprefixIcon: Icons.search ,
                     validatorfunction: (value){
                         if(value.toString().isEmpty)
                           {return'what do you search for?' ;}
                           return null ;
                     },
                     onsubmitedfunction: (value){
                         if(formKey.currentState!.validate())
                         SearchCubit.get(context).search(value.toString());
                     }
                   ),
                   SizedBox(height: 10,) ,

                    if(state is SearchLoadingState)
                      LinearProgressIndicator(),
                    if(state is SearchSuccessState)
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context,index)=>buildListItem(SearchCubit.get(context).searchmodel!.data!.data![index], context,isSearch: true),
                          separatorBuilder: (context,index)=>mydivider(),
                          itemCount: SearchCubit.get(context).searchmodel!.data!.data!.length,
                      ),
                    ),
                    if(state is SearchSuccessState&& SearchCubit.get(context).searchmodel!.data!.data!.isEmpty)
                      Expanded(
                        child: Text(
                            'No results',
                             style: TextStyle(
                               fontSize: 24,
                               color: Colors.redAccent
                             ),
                        ),
                      ),



                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

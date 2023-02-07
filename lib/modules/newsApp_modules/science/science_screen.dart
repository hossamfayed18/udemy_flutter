import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/cubit.dart';
import 'package:my_flutter_projects/layout/news_app/news_cubit/states.dart';
import 'package:my_flutter_projects/shared/components/components.dart';

class Science_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<News_cubit,NewsStates>(
      listener: (context,state){

      },
        builder:(context,state){
        var list =News_cubit.get(context).science;
        return articlebuilder(list,context);
        },

    );
  }
}
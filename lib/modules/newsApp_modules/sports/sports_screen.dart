import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../layout/news_app/news_cubit/cubit.dart';
import '../../../layout/news_app/news_cubit/states.dart';
import '../../../shared/components/components.dart';

class Sports_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<News_cubit,NewsStates>(
      listener: (context,state){
      },
      builder: (context,state){
        var list= News_cubit.get(context).sports;
        return articlebuilder(list,context);
      },

    );
  }
}
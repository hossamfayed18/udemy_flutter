import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/shared/cubit/cubit.dart';
import 'package:my_flutter_projects/shared/cubit/states.dart';

import '../../../shared/components/components.dart';

class DoneTasks extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<Homecubit,HomeStates>(
      listener: (context, state) {
      },

      builder: (context, state) {
        var donetasks = Homecubit.get(context).done_tasks;
        return taskbuilder(tasks: donetasks);
      },

    );

  }
}

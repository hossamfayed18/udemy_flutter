import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/cubit.dart';
import 'package:my_flutter_projects/layout/shop_app/cubit/states.dart';
import 'package:my_flutter_projects/modules/shop_app/search/search_screen.dart';
import 'package:my_flutter_projects/shared/components/components.dart';

class Shop_layout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var cubit = ShopLayoutCubit.get(context);
    return BlocConsumer<ShopLayoutCubit, ShopLayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Salla',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigatorTo(context, Search_screen());
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            onTap: (index) {
              cubit.changeBottomNavItem(index);
            },
            currentIndex: cubit.currentIndex,
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/explore/explore.dart';
import 'package:news/presintation/explore_details/explore_details.dart';
import 'package:news/presintation/home/home_page.dart';
import 'package:news/presintation/main_layout/cubit/cubit.dart';
import 'package:news/presintation/main_layout/cubit/state.dart';
import 'package:news/presintation/search_page/search_list.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit,AppState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
            body: MainLayoutCubit.get(context).screens[MainLayoutCubit.get(context).pageNum],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (index){
                MainLayoutCubit.get(context).changePage(index);
              },
              currentIndex: MainLayoutCubit.get(context).pageNum,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home'
                ),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.search),
                    label: 'Explore'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark_rounded),
                    label: 'List'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_outlined),
                    label: 'List'
                ),
              ],
            )
        );
      },
    );
  }
}

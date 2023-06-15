import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/explore/explore.dart';
import 'package:news/presintation/explore_details/explore_details.dart';
import 'package:news/presintation/home/home_page.dart';
import 'package:news/presintation/main_layout/main_layout_veiw/main_layout.dart';
import 'package:news/presintation/search_page/search_list.dart';
import 'package:news/repos/home_repo_imp.dart';
import 'package:news/service_locator.dart';
import 'package:news/view_models/explore_cubit/get_explore_cubit.dart';
import 'package:news/view_models/search_cubit/search_cubit.dart';

class Routes{

  static const String homeRoute='/home';
  static const String searchRoute='/search';
  static const String explore='/explore';
  static const String exploreDetailsRoute='/exploreDetails';

}
class RouterGenerator{
  static Route<dynamic> getRoute(RouteSettings settings){
    switch (settings.name){
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_)=> const MainLayout());
      case Routes.explore:
        return MaterialPageRoute(builder: (_)=> const Explore());
      case Routes.searchRoute:
        return MaterialPageRoute(builder: (_)=> BlocProvider(
          create: (BuildContext conntext)=>SearchCubit(getIt.get<HomeRepoImp>()),
            child: const SearchPage()));
      case Routes.exploreDetailsRoute:
        return MaterialPageRoute(builder: (_){
          List<dynamic> arg = settings.arguments as List<dynamic>;
         return BlocProvider(
             create: (BuildContext context)=>GetExploreCubit(getIt.get<HomeRepoImp>())..fetchBBC(exploreKey: arg[2]),
             child:  ExploreDetails(assetImage: arg[0],title: arg[1],)) ;
    } );

      default :
        return defaultRoute();
    }
  }
  static Route<dynamic> defaultRoute(){
    return MaterialPageRoute(builder: (_)=>const Scaffold(

    ));
  }
}

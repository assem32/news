import 'package:flutter/material.dart';
import 'package:news/presintation/explore/explore.dart';
import 'package:news/presintation/explore_details/explore_details.dart';
import 'package:news/presintation/home/home_page.dart';
import 'package:news/presintation/main_layout/main_layout_veiw/main_layout.dart';
import 'package:news/presintation/search_page/search_list.dart';

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
        return MaterialPageRoute(builder: (_)=> const SearchPage());
      case Routes.exploreDetailsRoute:
        return MaterialPageRoute(builder: (_)=> const ExploreDetails());

      default :
        return defaultRoute();
    }
  }
  static Route<dynamic> defaultRoute(){
    return MaterialPageRoute(builder: (_)=>const Scaffold(

    ));
  }
}

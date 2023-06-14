

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/data_source/local_data.dart';
import 'package:news/presintation/all_screen/all_screen.dart';
import 'package:news/presintation/busines/business.dart';
import 'package:news/presintation/explore/explore.dart';
import 'package:news/presintation/home/home_page.dart';
import 'package:news/presintation/list/list.dart';
import 'package:news/presintation/main_layout/cubit/state.dart';
import 'package:news/presintation/porfile/profile.dart';
import 'package:news/presintation/technology/technology.dart';

class MainLayoutCubit extends Cubit<AppState>
{
  MainLayoutCubit():super (AppInitial());
  static MainLayoutCubit get(context)=> BlocProvider.of(context);

  List screens=[
    HomePage(),
    Explore(),
    ListScreen(),
    Profile(),
  ];
  int pageNum=0;
  void changePage(index){
    pageNum=index;
    emit(ChangePageState());
  }

  int subPage=0;

  void changeSubPage(index){
    subPage=index;
    emit(ChangePageState());

  }

  List subScreens=[
    AllScreen(),
    Business(),
    TechnologyScreen(),
  ];


  bool isDark = false;

  void changeAppMode({bool? fromShared})
  {
    if(fromShared !=null)
      isDark=fromShared;
    else
      isDark = !isDark;

    CashHelper.setData(key: 'isDark', value: isDark).then((value)
    {
      emit(ChangeMode());

    });
  }
}
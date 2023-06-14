

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
import 'package:sqflite/sqflite.dart';

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

  late Database database;

  void createDataBase()async{
    database= await openDatabase('news3.db',version: 2,onCreate: (database,version){
      print('database created');
      database.execute(
          'CREATE TABLE news3(id INTEGER PRIMARY KEY,title TEXT,author TEXT,time TEXT,image TEXT,url TEXT)'
      ).then((value) {
        print('table created');
      }).catchError((error){
        print(error.toString());
      });
    },onOpen: (database)async{
      print('opened');
      getDatab(database);
      emit(ChurchInsertSuccess());
    });
  }

  insertToDataBase({
    title,
    author,
    time,
    image,
    url
  })async{
    await database.transaction((txn)async{
      txn.rawInsert(
          'INSERT INTO news3(title, author, time,image,url) VALUES("$title", "$author", "$time", "$image","$url")'
      )
          .then((value){
        getDatab(database);
        emit(ChurchInsertSuccess());
      }).catchError((error){
        print(error.toString());
        emit(ChurchInsertError());
      });
    });

  }

  List<Map> savedNews=[];
  void getDatab(database)async{
    savedNews=await database.rawQuery('SELECT * FROM news3');
    emit(ChurchSuccessGet());
  }

  void deleteRow({id}){
    database.rawDelete('DELETE FROM news3 WHERE id = ?',[id]).then((value) {
      getDatab(database);
      emit(ChurchSuccessDelete());
    }).catchError((error){
      print(error);
      emit(ChurchErrorDelete());
    });
  }
}
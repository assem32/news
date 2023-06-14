import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/data_source/local_data.dart';
import 'package:news/presintation/explore/explore.dart';
import 'package:news/presintation/main_layout/cubit/cubit.dart';
import 'package:news/presintation/main_layout/cubit/state.dart';
import 'package:news/presintation/main_layout/main_layout_veiw/main_layout.dart';
import 'package:news/presintation/resources/observer_services.dart';
import 'package:news/presintation/resources/routing_manger.dart';
import 'package:news/presintation/resources/theme_manger.dart';
import 'package:news/repos/home_repo_imp.dart';
import 'package:news/service_locator.dart';
import 'package:news/view_models/business_cubit/get_business_cubit.dart';
import 'package:news/view_models/get_articles_cubit/get_articles_cubit.dart';
import 'package:news/view_models/get_headlines_cubit/get_headlines_cubit.dart';
import 'package:news/view_models/get_technology_cubit/get_technology_cubit.dart';
import 'package:news/view_models/search_cubit/search_cubit.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  setupServiceLocator();
  await CashHelper.init();
  bool isDark=CashHelper.getData(key: 'isDark')??false;
  runApp( MyApp(isDark,));
}

class MyApp extends StatelessWidget {
  MyApp( this.isDark);
  final isDark;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context)=>MainLayoutCubit()..changeAppMode(fromShared: isDark)),
        BlocProvider(create: (BuildContext context)=>GetHeadLinesCubit(getIt.get<HomeRepoImp>() )..fetchGetHeadLines()),
        BlocProvider(create: (BuildContext context)=>GetArticlesCubit(getIt.get<HomeRepoImp>() )..fetchGetArticles()),
        BlocProvider(create: (BuildContext context)=>GetTechnologyCubit(getIt.get<HomeRepoImp>())..fetchTechnology()),
        BlocProvider.value(value:GetBusinessCubit(getIt.get<HomeRepoImp>() )..fetchBusiness()),
        // BlocProvider(create: (BuildContext context)=>SearchCubit(getIt.get<HomeRepoImp>() )),
      ],
      child: BlocConsumer<MainLayoutCubit, AppState>(
    listener: (context, state) {},
    builder: (context, state) {
      return  MaterialApp(
        title: 'Flutter Demo',
        theme: getTheme(),
        darkTheme: getThemeDark(),
        themeMode:MainLayoutCubit.get(context).isDark ?ThemeMode.dark:ThemeMode.light,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouterGenerator.getRoute,
        initialRoute: Routes.homeRoute,
        home: MainLayout(),
      );
    }
      ),
    );
  }
}



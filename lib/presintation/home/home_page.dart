import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news/presintation/all_screen/all_screen.dart';
import 'package:news/presintation/main_layout/cubit/cubit.dart';
import 'package:news/presintation/main_layout/cubit/state.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/routing_manger.dart';
import 'package:news/presintation/resources/string_Manger.dart';
import 'package:news/view_models/search_cubit/search_cubit.dart';

List titles = [
  'All',
  'Business',
  'Technology',
];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Scaffold(
              backgroundColor: Colors.grey.withOpacity(0.07),
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringManger.headLine,
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    '${StringManger.today},$formattedDate$ordinalDay',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height *
                            0.0100140845070423,
                        horizontal: MediaQuery.of(context).size.width *
                            0.0412244897959184),
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: InkWell(
                        onTap:(){
                          Navigator.pushNamed(context, Routes.searchRoute);
                        },
                        child: TextFormField(

                          onChanged: (v){

                          },

                          decoration: InputDecoration(
                            enabled: false,
                              prefixIcon: Icon(
                                Icons.search,
                                color: ColorManger.secColor,
                              ),
                              label: Text('Search'),
                              labelStyle: TextStyle(color: ColorManger.secColor),
                              filled: true,
                              fillColor: ColorManger.lightGrey.withOpacity(0.2),
                              border: InputBorder.none),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => InkWell(
                            onTap: (){
                              MainLayoutCubit.get(context).changeSubPage(index);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: index==MainLayoutCubit.get(context).subPage?ColorManger.mainColor:ColorManger.secColor.withOpacity(0.2),
                              ),
                              height: MediaQuery.of(context).size.width *
                                  0.0816326530612245,
                              child: Padding(
                                padding:
                                const EdgeInsets.symmetric(horizontal: 14),
                                child: Center(
                                    child: Text(
                                      titles[index],
                                      style: index==MainLayoutCubit.get(context).subPage?Theme.of(context).textTheme.bodySmall:Theme.of(context).textTheme.bodyLarge,
                                    )),
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 10,
                          ),
                          itemCount: titles.length)),
                  Expanded(flex: 14, child: MainLayoutCubit.get(context).subScreens[MainLayoutCubit.get(context).subPage])
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

String formattedDate = DateFormat('MMMM ').format(DateTime.now());
String ordinalDay = _getOrdinalDay(DateTime.now().day);

String _getOrdinalDay(int day) {
  if (day >= 11 && day <= 13) {
    return '${day}th';
  }
  switch (day % 10) {
    case 1:
      return '${day}st';
    case 2:
      return '${day}nd';
    case 3:
      return '${day}rd';
    default:
      return '${day}th';
  }
}

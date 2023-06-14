import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/main_layout/cubit/cubit.dart';
import 'package:news/presintation/main_layout/cubit/state.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/component.dart';
import 'package:news/presintation/resources/string_Manger.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit,AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.0290140845070423,horizontal:MediaQuery.of(context).size.width*0.0412244897959184 ),
                  child: Container(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),

                    ),
                    child: TextFormField(

                      decoration: InputDecoration(
                          prefixIcon:Icon(Icons.search,color: ColorManger.secColor,),
                          label: Text('Search'),
                          labelStyle: TextStyle(color: ColorManger.secColor),
                          filled: true,
                          fillColor:ColorManger.secColor.withOpacity(0.1),
                          border: InputBorder.none
                      ),
                    ),

                  ),
                ),
                Row(
                  children: [
                    Text(' ${StringManger.result}',style: Theme.of(context).textTheme.displayMedium,),
                    Spacer(),
                    Text('${MainLayoutCubit.get(context).savedNews.length} ${StringManger.numArticles}',style: TextStyle(fontSize: 10,fontFamily: 'SF Pro Display',color: ColorManger.secColor),)
                  ],
                ),
                Expanded(
                  child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context,index)=>articleItem(
                        title: MainLayoutCubit.get(context).savedNews[index]['title'],
                        author:MainLayoutCubit.get(context).savedNews[index]['author'] ,
                        image:MainLayoutCubit.get(context).savedNews[index]['image'] ,
                        time: MainLayoutCubit.get(context).savedNews[index]['time'],
                        url: MainLayoutCubit.get(context).savedNews[index]['url'],
                        context: context,
                        function: (){
                          MainLayoutCubit.get(context).deleteRow(id: MainLayoutCubit.get(context).savedNews[index]['id']);
                        }
                      )
                      , separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: MainLayoutCubit.get(context).savedNews.length),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

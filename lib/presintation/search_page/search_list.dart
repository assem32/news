import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/component.dart';
import 'package:news/presintation/resources/string_Manger.dart';
import 'package:news/view_models/search_cubit/search_cubit.dart';
import 'package:news/view_models/search_cubit/search_state.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                  onChanged: (v){
                    BlocProvider.of<SearchCubit>(context).fetchSearch(searchKey: v.toString());
                  },
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
                Text(StringManger.result,style: Theme.of(context).textTheme.displayMedium,),
                Spacer(),
                Text(StringManger.numArticles,style: TextStyle(fontSize: 10,fontFamily: 'SF Pro Display',color: ColorManger.secColor),)
              ],
            ),
            BlocBuilder<SearchCubit,SearchState>(
              builder: (context, state) {
                if(state is SearchSuccess) {
                  return Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) => articleItem(
                          title: state.articles[index].title,
                          image: state.articles[index].urlToImage,
                          time: state.articles[index].publishedAt,
                          showIcon: true,
                          swipe: false,
                          author: state.articles[index].author,
                          url: state.articles[index].url,
                          context: context
                        ),
                        separatorBuilder: (context, index) => const SizedBox(
                              width: 12,
                            ),
                        itemCount: state.articles.length),
                  );
                }
                else if(state is SearchFailure){
                  return errorWidget(text: state.errMessage,context: context);
                }
                else {
                  return Container();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

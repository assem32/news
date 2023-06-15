import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/main_layout/cubit/cubit.dart';
import 'package:news/presintation/main_layout/cubit/state.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/component.dart';
import 'package:news/view_models/get_technology_cubit/get_technology__state.dart';
import 'package:news/view_models/get_technology_cubit/get_technology_cubit.dart';


class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit,AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Column(
          children: [
            BlocBuilder<GetTechnologyCubit,GetTechnologyState>(
              builder: (context, state) {
                if (state is GetTechnologySuccess ) {
                  return ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>articleItem(title: state.articles[index].title!,
                          image: state.articles[index].urlToImage,
                          author: state.articles[index].author,
                          time: state.articles[index].publishedAt,
                          url:  state.articles[index].url,
                          showIcon: true,
                          function: (){
                            MainLayoutCubit.get(context).insertToDataBase(title:state.articles[index].title,author: state.articles[index].author,image: state.articles[index].urlToImage,time: state.articles[index].publishedAt,url: state.articles[index].url);
                          },
                          context: context)
                      , separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: state.articles.length);
                } else if(state is GetTechnologyFailure) {
                  return errorWidget(text: state.errMessage,context: context);
                } else {
                  return Center(child: CircularProgressIndicator(color: ColorManger.headLine,));
                }
              },
            ),
          ],
        );
      },
    );
  }
}

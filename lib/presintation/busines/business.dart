import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/main_layout/cubit/cubit.dart';
import 'package:news/presintation/main_layout/cubit/state.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/component.dart';
import '../../view_models/business_cubit/get_business_cubit.dart';
import '../../view_models/business_cubit/get_business_state.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit,AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Column(
          children: [
            BlocBuilder<GetBusinessCubit,GetBusinessState>(
              builder: (context, state) {
                if (state is GetBusinessSuccess ) {
                  return ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context,index)=>articleItem(title: state.articles[index].title!,
                          image: state.articles[index].urlToImage,
                          author: state.articles[index].author,
                          time: state.articles[index].publishedAt,
                          showIcon: true,
                          function: (){
                        MainLayoutCubit.get(context).insertToDataBase(title:state.articles[index].
                        title,author: state.articles[index].author,
                            image: state.articles[index].urlToImage,
                            time: state.articles[index].publishedAt,
                            url: state.articles[index].url);
                          },
                          url: state.articles[index].url,
                          context: context)
                      , separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: state.articles.length);
                } else if(state is GetBusinessFailure) {
                  return errorWidget(text: state.errMessage,context: context);
                } else {
                  return Center(child: CircularProgressIndicator(color: ColorManger.headLine,));
                }
              },
            )
          ],
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/component.dart';
import 'package:news/view_models/get_articles_cubit/get_articles_cubit.dart';
import 'package:news/view_models/get_articles_cubit/get_articles_state.dart';
import 'package:news/view_models/get_headlines_cubit/get_headlines_cubit.dart';
import 'package:news/view_models/get_headlines_cubit/get_headlines_state.dart';
import 'package:url_launcher/url_launcher.dart';

class AllScreen extends StatelessWidget {
  const AllScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Trending',style: Theme.of(context).textTheme.displayMedium,),
        BlocBuilder<GetHeadLinesCubit,GetHeadLinesState>(
          builder: (context, state) {
            if(state is GetHeadLinesSuccess) {
              return Expanded(
                flex: 6,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Card(
                          // color: Colors.orange,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          // margin: EdgeInsets.all(4),
                          // width: MediaQuery.of(context).size.width*0.7244897959183673,
                          // height: MediaQuery.of(context).size.height*0.353393085787452,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: ()async{
                                await launchUrl(
                                    Uri.parse(state.headlines[index].url!),
                                    mode: LaunchMode.externalApplication
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      clipBehavior: Clip.antiAliasWithSaveLayer,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Image(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.7244897959183673,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.203393085787452,
                                        fit: BoxFit.fill,
                                        image: NetworkImage(
                                          state.headlines[index].urlToImage==null?'https://cdn-icons-png.flaticon.com/512/102/102407.png?w=740&t=st=1686748029~exp=1686748629~hmac=1db47efe74968a0c38baa278d2b471b7b54ae649babed8a4597723e08b273c08':state.headlines[index].urlToImage!,
                                        ),
                                      )),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0128040973111396,
                                  ),
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.7244897959183673,
                                    child: Text(
                                      state.headlines[index].title!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  Container(
                                    width:
                                    MediaQuery.of(context).size.width *
                                        0.7244897959183673,
                                    child: Text(
                                      state.headlines[index].author==null?'':state.headlines[index].author!,
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                    separatorBuilder: (context, index) => const SizedBox(
                          width: 12,
                        ),
                    itemCount: 5),
              );
            }
            else if (state is GetHeadLinesFailure){
              return errorWidget(text: state.errMessage,context: context);

            }
            else {
              return Center(child: CircularProgressIndicator(color: ColorManger.headLine,));
            }
          },
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.0108040973111396),
          child: Text('Latest',style: Theme.of(context).textTheme.displayMedium,),
        ),
        BlocBuilder<GetArticlesCubit,GetArticlesState>(
          builder: (context,state){
            if(state is GetArticlesSuccess) {
              return  Expanded(
                flex: 6,

                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index)=>articleItem(
                        title: state.articles[index].title,
                        image: state.articles[index].urlToImage,
                        time: state.articles[index].publishedAt,
                        showIcon: true,
                        swipe: false,
                        author: state.articles[index].author,
                        url: state.articles[index].url,
                        context: context
                    )
                    , separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: state.articles.length),
              );
            } else if (state is GetArticlesFailure) {
              return errorWidget(text: state.errMessage,context: context);
            } else {
              return Center(child: CircularProgressIndicator(color:  ColorManger.headLine,));
            }
          },
        ),
      ],
    );
  }
}
String addDaySuffix(String date) {
  final day = date.split(' ')[1];
  final dayInt = int.tryParse(day);

  if (dayInt != null) {
    if (dayInt >= 11 && dayInt <= 13) {
      return date + 'th';
    }

    switch (dayInt % 10) {
      case 1: return date + 'st';
      case 2: return date + 'nd';
      case 3: return date + 'rd';
      default: return date + 'th';
    }
  }

  return date;
}
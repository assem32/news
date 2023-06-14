import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/component.dart';
import 'package:news/view_models/get_technology_cubit/get_technology__state.dart';
import 'package:news/view_models/get_technology_cubit/get_technology_cubit.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetTechnologyCubit,GetTechnologyState>(
          builder: (context, state) {
             if (state is GetTechnologySuccess )
              return Expanded(
                child: ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context,index)=>articleItem(title: state.articles[index].title!,
                        image: state.articles[index].urlToImage,
                        author: state.articles[index].author,
                        time: state.articles[index].publishedAt,
                        url:  state.articles[index].url,
                        context: context)
                    , separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: state.articles.length),
              );
            else if(state is GetTechnologyFailure)
              return Text(state.errMessage);
            else
              return CircularProgressIndicator(color: ColorManger.headLine,);
          },
        ),
      ],
    );
  }
}

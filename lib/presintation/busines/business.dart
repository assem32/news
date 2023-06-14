import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/component.dart';
import '../../view_models/business_cubit/get_business_cubit.dart';
import '../../view_models/business_cubit/get_business_state.dart';

class Business extends StatelessWidget {
  const Business({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocBuilder<GetBusinessCubit,GetBusinessState>(
          builder: (context, state) {
            if (state is GetBusinessSuccess )
            return Expanded(
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context,index)=>articleItem(title: state.articles[index].title!,
                      image: state.articles[index].urlToImage,
                      author: state.articles[index].author,
                      time: state.articles[index].publishedAt,
                      context: context)
                  , separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: state.articles.length),
            );
            else if(state is GetBusinessFailure)
              return Text(state.errMessage);
            else
              return CircularProgressIndicator(color: ColorManger.headLine,);
          },
        )
      ],
    );
  }
}

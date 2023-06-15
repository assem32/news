import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/resources/assets_manger.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/component.dart';
import 'package:news/presintation/resources/routing_manger.dart';
import 'package:news/presintation/resources/string_Manger.dart';
import 'package:news/view_models/explore_cubit/get_explore_cubit.dart';
import 'package:news/view_models/explore_cubit/get_explore_state.dart';

class ExploreDetails extends StatelessWidget {
  final assetImage,title;
  const ExploreDetails({required this.assetImage,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                  onTap:(){
                    Navigator.pushNamed(context, Routes.searchRoute);
                  },
                  decoration: InputDecoration(
                    enabled: false,
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
                Container(
                    width: MediaQuery.of(context).size.width*0.1479591836734694,
                    height: MediaQuery.of(context).size.width*0.1479591836734694,
                    child: Image.asset('${assetImage}')),
                Text('${title}',style: TextStyle(color: ColorManger.mainColor,fontSize: 12,fontFamily: 'SF Pro Display'),)
              ],
            ),
            BlocBuilder<GetExploreCubit,GetExploreState>(
              builder: (context, state) {
                if (state is GetExploreBBCSuccess){
                  return Expanded(
                    child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context,index)=>articleItem(
                          title: state.sources[index].name,
                          url: state.sources[index].url,
                          author: state.sources[index].category,
                          swipe: false,
                          showIcon: false,
                          assetShow: true,
                          assets: assetImage,
                          context: context
                        )
                        , separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: state.sources.length),
                  );
                }
                else if (state is GetExploreBBCFailure){
                  return errorWidget(text: state.errMessage,context: context);

                }
                else
                  {
                    return Center(child: CircularProgressIndicator(color: ColorManger.headLine,));
                  }
              },
            )
          ],
        ),
      ),
    );
  }
}

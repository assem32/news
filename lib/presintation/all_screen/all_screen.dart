import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/view_models/get_headlines_cubit/get_headlines_cubit.dart';
import 'package:news/view_models/get_headlines_cubit/get_headlines_state.dart';

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
                                          'https://img.freepik.com/free-photo/nature-colorful-landscape-dusk-cloud_1203-5705.jpg?w=1060&t=st=1686670375~exp=1686670975~hmac=e7c38f30b1fc6634512d807e74897e0415050909bab602f9a465d838cbad7edf',
                                        ),
                                      )),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0128040973111396,
                                  ),
                                  Text(
                                    state.headlines[index].title!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall,
                                  ),
                                  Text(
                                    'Category',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge,
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
              return Text(state.errMessage);

            }
            else
              return CircularProgressIndicator(color: ColorManger.headLine,);
          },
        ),
        Padding(
          padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.0108040973111396),
          child: Text('Latest',style: Theme.of(context).textTheme.displayMedium,),
        ),
        Expanded(
          flex: 6,

          child: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context,index)=>Padding(
                padding: const EdgeInsets.all(10.0),
                child: InkWell(
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Category',style: Theme.of(context).textTheme.bodyLarge,),
                          Text('News title here',style: Theme.of(context).textTheme.displayMedium,),
                          Row(
                            children: [
                              Text('time',style: Theme.of(context).textTheme.bodyLarge,),
                              IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
                            ],
                          ),

                        ],
                      ),
                      Spacer(),
                      Container(

                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),

                          ),
                          child: Image(
                            width: MediaQuery.of(context).size.width*0.2040816326530612,
                            height: MediaQuery.of(context).size.height*0.1024327784891165,
                            image: NetworkImage('https://img.freepik.com/free-photo/nature-colorful-landscape-dusk-cloud_1203-5705.jpg?w=1060&t=st=1686670375~exp=1686670975~hmac=e7c38f30b1fc6634512d807e74897e0415050909bab602f9a465d838cbad7edf'),fit: BoxFit.fill,)),


                    ],
                  ),
                ),
              )
              , separatorBuilder: (context,index)=>const SizedBox(width: 12,), itemCount: 5),
        ),
      ],
    );
  }
}

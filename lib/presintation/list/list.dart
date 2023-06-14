import 'package:flutter/material.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/string_Manger.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({Key? key}) : super(key: key);

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
            Expanded(
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
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:news/presintation/resources/assets_manger.dart';
import 'package:news/presintation/resources/color_manger.dart';
import 'package:news/presintation/resources/routing_manger.dart';
import 'package:news/presintation/resources/string_Manger.dart';


List newsLogo=[AssetsManger.bbc_news,AssetsManger.aljazzira,AssetsManger.sabq,AssetsManger.abc_news,AssetsManger.argaam,AssetsManger.bloomberg,];
List newsName=[StringManger.bbcNews,StringManger.aljazzera,StringManger.sabq,StringManger.abcNews,StringManger.argaam,StringManger.bloomberg,];
List newsCode=[StringManger.bbcNewsCode,StringManger.aljazzeraCode,StringManger.sabqCode,StringManger.abcNewsCode,StringManger.argaamCode,StringManger.bloombergCode,];
List function=[];
class Explore extends StatelessWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*0.0290140845070423,horizontal:MediaQuery.of(context).size.width*0.0412244897959184 ),
              child: Container(
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),

                ),
                child: InkWell(
                  onTap:(){
                    Navigator.pushNamed(context, Routes.searchRoute);
                  },
                  child: TextFormField(

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
            ),
            Text('Explore Source',style: Theme.of(context).textTheme.displayMedium,),
            Expanded(
              child: GridView.count(
                  crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 2,
                childAspectRatio: 1 / 1,
                children: List.generate(newsLogo.length, (index) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Color(0xffF9FAFB),

                  ),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: MediaQuery.of(context).size.width*0.0561224489795918,
                          backgroundColor: ColorManger.white,
                          child: Image.asset(newsLogo[index])),
                      Text(newsName[index],style: TextStyle(fontFamily: 'SF Pro Display',color: ColorManger.mainColor,fontSize: 12),),
                      MaterialButton(
                        color: ColorManger.mainColor,
                        shape: StadiumBorder(),
                        onPressed: (){

                          Navigator.pushNamed(context, Routes.exploreDetailsRoute,arguments: [newsLogo[index],newsName[index],newsCode[index]]);
                        },child: Text('Explore',style: TextStyle(color: Colors.white,fontSize: 10),),)
                    ],
                  ),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}

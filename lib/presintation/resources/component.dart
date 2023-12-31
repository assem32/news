
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

Widget articleItem({context,title,image,time,author,url,function,showIcon,swipe,id,swipeFun,assetShow,assets})=>Padding(
  padding: const EdgeInsets.all(10.0),
  child:swipe==false? InkWell(
    onTap: ()async{
      await launchUrl(
          Uri.parse(url),
          mode: LaunchMode.externalApplication
      );
    },
    child: Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(author==null?'':author,style: Theme.of(context).textTheme.bodyLarge,),
              Text(title,style: Theme.of(context).textTheme.displayMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
              Row(
                children: [
                  Text(time==null?'':DateFormat('dd/MM/yyyy').format(DateTime.parse(time)),style: Theme.of(context).textTheme.bodyLarge,),
                  if(showIcon==true)
                    IconButton(onPressed: (){
                    function();
                  }, icon: Icon(Icons.bookmark_rounded)),
                  if(showIcon==false)
                    Container(),

                ],
              ),

            ],
          ),
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
              image: NetworkImage(image==null?
              'https://cdn-icons-png.flaticon.com/512/102/102407.png?w=740&t=st=1686748029~exp=1686748629~hmac=1db47efe74968a0c38baa278d2b471b7b54ae649babed8a4597723e08b273c08'
                  :image),fit: BoxFit.fill,)),


      ],
    ),
  )
      :Dismissible(
    key: Key(id.toString()),
    onDismissed: (direction){
      swipeFun();
    },
        child: InkWell(
    onTap: ()async{
        await launchUrl(
            Uri.parse(url),
            mode: LaunchMode.externalApplication
        );
    },
    child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(author==null?'':author,style: Theme.of(context).textTheme.bodyLarge,),
                Text(title,style: Theme.of(context).textTheme.displayMedium,maxLines: 2,overflow: TextOverflow.ellipsis,),
                Row(
                  children: [
                    Text(time==null?'':DateFormat('dd/MM/yyyy').format(DateTime.parse(time)),style: Theme.of(context).textTheme.bodyLarge,),
                    if(showIcon==true)
                      IconButton(onPressed: (){
                        function();
                      }, icon: Icon(Icons.bookmark_rounded)),
                    if(showIcon==false)
                      Container(),

                  ],
                ),

              ],
            ),
          ),
          Spacer(),
          Container(

              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),

              ),
              child: assetShow==true?Image.asset(assets) :
              Image(
                width: MediaQuery.of(context).size.width*0.2040816326530612,
                height: MediaQuery.of(context).size.height*0.1024327784891165,
                image: NetworkImage(image==null?
                'https://cdn-icons-png.flaticon.com/512/102/102407.png?w=740&t=st=1686748029~exp=1686748629~hmac=1db47efe74968a0c38baa278d2b471b7b54ae649babed8a4597723e08b273c08'
                    :image),fit: BoxFit.fill,)
          ),


        ],
    ),
  ),
      ),
);


Widget errorWidget({text,context})=>Center(child: Text(text,style: Theme.of(context).textTheme.displayMedium,));
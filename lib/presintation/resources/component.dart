
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Widget articleItem({context,title,image,time,author})=>Padding(
  padding: const EdgeInsets.all(10.0),
  child: InkWell(
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
                  Text(DateFormat('dd/MM/yyyy').format(DateTime.parse(time)),style: Theme.of(context).textTheme.bodyLarge,),
                  IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz))
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
  ),
);
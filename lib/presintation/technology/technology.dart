import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TechnologyScreen extends StatelessWidget {
  const TechnologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/data/data_source/local_data.dart';
import 'package:news/presintation/main_layout/cubit/cubit.dart';
import 'package:news/presintation/main_layout/cubit/state.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainLayoutCubit,AppState>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Column(
            children: [
              MaterialButton(onPressed: (){
                MainLayoutCubit.get(context).changeAppMode();
              },child: Text('Dark mode'),)
            ],
          ),
        );
      },
    );
  }
}

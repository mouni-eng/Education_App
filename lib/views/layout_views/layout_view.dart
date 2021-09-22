import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movies_app/services/helper/icon_broken.dart';
import 'package:movies_app/view_models/App_Cubit/cubit.dart';
import 'package:movies_app/view_models/App_Cubit/states.dart';

class LayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('${cubit.titles[cubit.currentIndex]}', style: Theme.of(context).textTheme.subtitle1,),
            actions: [
              IconButton(onPressed: (){}, icon: Icon(IconBroken.Notification), iconSize: 30.0,),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {cubit.changeBottomNav(index);},
            items: cubit.bottomNavigationBarItem,
          ),
        );
      },
    );
  }
}
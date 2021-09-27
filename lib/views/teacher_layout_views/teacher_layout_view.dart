import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/services/helper/icon_broken.dart';
import 'package:movies_app/view_models/App_Cubit/cubit.dart';
import 'package:movies_app/view_models/App_Cubit/states.dart';

class TeacherLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> teacherTitles = [
      'Services',
      'Messages',
      'Profile',
    ];
    List<BottomNavigationBarItem> teacherBottomNavigationBarItem = [
      BottomNavigationBarItem(
          label: teacherTitles[0],
          icon: Icon(IconBroken.Document)
      ),
      BottomNavigationBarItem(
          label: teacherTitles[1],
          icon: Icon(IconBroken.Message)
      ),
      BottomNavigationBarItem(
          label: teacherTitles[2],
          icon: Icon(IconBroken.Profile)
      ),
    ];
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, states) {},
      builder: (context, states) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(teacherTitles[cubit.teacherCurrentIndex]),
          ),
          body: cubit.teacherScreens[cubit.teacherCurrentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.teacherCurrentIndex,
            onTap: (index) {
              cubit.teacherChangeBottomNav(index);
            },
            items: teacherBottomNavigationBarItem,
          ),
        );
      },
    );
  }
}


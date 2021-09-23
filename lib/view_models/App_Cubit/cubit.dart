import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/services/helper/icon_broken.dart';
import 'package:movies_app/services/local/cache_helper.dart';
import 'package:movies_app/view_models/App_Cubit/states.dart';
import 'package:movies_app/views/auth_views/login_view.dart';
import 'package:movies_app/views/layout_views/explore_view.dart';
import 'package:movies_app/views/layout_views/layout_view.dart';
import 'package:movies_app/views/layout_views/messages_view.dart';
import 'package:movies_app/views/layout_views/settings_view.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppStates());

  static AppCubit get(context) => BlocProvider.of(context);

  String? myUid;
  bool isDark = false;

  void getCacheData() {
    myUid = CacheHelper.getData(key: "uId");
    if(myUid != null) {
      uId = myUid;
    }
    emit(AppInitialPageState());
  }

  Widget chooseInitialPage() {
      if(uId == null) return LoginView();
      else return LayoutView();
  }


  // section handling the Bottom Nav Bar

  List<Widget> screens = [
    ExploreView(),
    MessagesView(),
    SettingsView(),
  ];

  List<String> titles = [
    'Explore',
    'Messages',
    'Settings',
  ];

  List<BottomNavigationBarItem> bottomNavigationBarItem = [
    BottomNavigationBarItem(
        label: "EXPLORE",
        icon: Icon(IconBroken.Home)
    ),
    BottomNavigationBarItem(
        label: "MESSAGES",
        icon: Icon(IconBroken.Message)
    ),
    BottomNavigationBarItem(
        label: "SETTINGS",
        icon: Icon(IconBroken.Setting)
    ),

  ];
  int currentIndex = 0;

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppBottomNavBarState());
  }
}
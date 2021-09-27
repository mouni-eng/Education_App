// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> ar = {
  "appBar1": "أكتشف",
  "appBar2": "الرسائل",
  "appBar3": "حسابي",
  "welcome": "صباح الخير,",
  "infoBar": "متعلم اليوم هو  ",
  "services": "خدماتنا ",
  "availableSubjects": "المواد المتاحه للدراسه: ",
  "info": "لنفسي",
  "service1": "مدرس",
  "service2": "كورسات",
  "subject1": "فيزياء",
  "subject2": "الكيمياء",
  "noMessages1": "لا توجد رسائل",
  "noMessages2": "ابجث عن محادثاتك هنا",
  "settingsInfo1": "عرض الملف الشخصي",
  "settingsInfo2": "الاشعرات",
  "settingsInfo3": "مساعده",
  "settingsInfo4": "تسجيل الخروج",
  "settingsInfo5": "اللغه"
};
static const Map<String,dynamic> en = {
  "appBar1": "Explore",
  "appBar2": "Messages",
  "appBar3": "Settings",
  "welcome": "Good evening,",
  "infoBar": "Today's learner is ",
  "services": "Our Services",
  "availableSubjects": "Your available subjects for studying:",
  "info": "Me",
  "service1": "Tutors",
  "service2": "Courses",
  "subject1": "Physics",
  "subject2": "Chemistry",
  "noMessages1": "No Current messages",
  "noMessages2": "Find all your ongoing chats here",
  "settingsInfo1": "View full profile",
  "settingsInfo2": "Notifications",
  "settingsInfo3": "Help",
  "settingsInfo4": "Logout",
  "settingsInfo5": "Language"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": ar, "en": en};
}

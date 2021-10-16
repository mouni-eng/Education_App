// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/services/helper/icon_broken.dart';
import 'package:movies_app/services/helper/url_launcher.dart';
import 'package:movies_app/translate/locale_keys.g.dart';
import 'package:movies_app/view_models/explore_cubit/cubit.dart';
import 'package:movies_app/view_models/explore_cubit/states.dart';
import 'package:movies_app/views/layout_views/profile_view.dart';
import 'package:movies_app/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsView extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}
  bool switchValue = true;
class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreCubit, ExploreStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ExploreCubit cubit = ExploreCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.userModel != null,
          builder: (context) => SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Card(
                    elevation: 3.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 15.0,
                          ),
                          Row(
                            children: [
                              Text(
                                ExploreCubit.get(context).userModel!.name!.split(" ").first, style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                fontSize: 24.0,
                              ),),
                              Spacer(),
                              CircleAvatar(
                                foregroundColor: Colors.white,
                                backgroundColor: kPrimaryColor,
                                backgroundImage: ExploreCubit.get(context).profileImage == null ? NetworkImage(ExploreCubit.get(context).userModel!.image!) : FileImage(ExploreCubit.get(context).profileImage!) as ImageProvider,),
                            ],
                          ),
                          SizedBox(
                            height: 15.0,
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {
                                    navigateTo(context, ProfileScreen());
                                  },
                                  child: defaultTextField(
                                      size: 18,
                                      text: LocaleKeys.settingsInfo1.tr(),
                                      color: Theme.of(context).accentColor)),
                              Icon(
                                IconBroken.Arrow___Right_2,
                                color: Theme.of(context).iconTheme.color,
                                size: 18.0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0,),
                  Card(
                    elevation: 3.0,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      children: [
                        ListTile(
                            trailing: Switch(
                              onChanged: (value) {
                                setState(() {
                                  switchValue = value;
                                });
                                if(value) {
                                  FirebaseMessaging.instance.subscribeToTopic("users");
                                }else {
                                  FirebaseMessaging.instance.unsubscribeFromTopic("users");
                                }
                              },
                              value: switchValue,
                              activeColor: Theme.of(context).iconTheme.color,
                            ),
                            leading: Text(
                              LocaleKeys.settingsInfo2.tr(),
                              style: Theme.of(context).textTheme.bodyText1,
                            )),
                        Divider(),
                        InkWell(
                          onTap: () {
                            languageAlertDialog(context);
                          },
                          child: ListTile(
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(IconBroken.More_Circle, color: Theme.of(context).iconTheme.color, size: 30.0,),
                              ),
                              leading: Text(
                                LocaleKeys.settingsInfo5.tr(),
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () async{
                            await Utils.openEmail(
                              toEmail: 'othman_almufarrij@hotmail.com',
                              subject: 'Get Help',
                              body: '',
                            );
                          },
                          child: ListTile(
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(IconBroken.Info_Circle, color: Theme.of(context).iconTheme.color, size: 30.0,),
                              ),
                              leading: Text(
                                LocaleKeys.settingsInfo3.tr(),
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                        ),
                        Divider(),
                        InkWell(
                          onTap: () async{
                            signOutAlertDialog(context, () {cubit.signOut(context);});
                          },
                          child: ListTile(
                              trailing: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(IconBroken.Logout, color: Theme.of(context).iconTheme.color, size: 30.0,),
                              ),
                              leading: Text(
                                LocaleKeys.settingsInfo4.tr(),
                                style: Theme.of(context).textTheme.bodyText1,
                              )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}

languageAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text(LocaleKeys.settingsInfo5.tr()),
    actions: [
      TextButton(
        child: Text("English",),
        onPressed: () async{
          await context.setLocale(Locale('en'));
          Navigator.of(context).pop();
        },
      ),
      SizedBox(
        height: 10.0,
      ),
      TextButton(
        child: Text("العربيه",),
        onPressed: () async{
          await context.setLocale(Locale('ar'));
          Navigator.of(context).pop();
        },
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
    barrierDismissible: true,
  );
}

signOutAlertDialog(BuildContext context, void Function()? function) {
  AlertDialog alert = AlertDialog(
    title: Text(LocaleKeys.settingsInfo4.tr()),
    actions: [
      TextButton(
        child: Text("Yes",),
        onPressed: function,
      ),
      SizedBox(
        height: 10.0,
      ),
      TextButton(
        child: Text("No",),
        onPressed: () async{
          Navigator.of(context).pop();
        },
      ),
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
    barrierDismissible: true,
  );
}

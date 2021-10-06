// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/services/helper/icon_broken.dart';
import 'package:movies_app/services/local/cache_helper.dart';
import 'package:movies_app/translate/locale_keys.g.dart';
import 'package:movies_app/view_models/explore_cubit/cubit.dart';
import 'package:movies_app/views/auth_views/login_view.dart';
import 'package:movies_app/views/layout_views/profile_view.dart';
import 'package:movies_app/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                          onChanged: (value) {},
                          value: false,
                          activeColor: Theme.of(context).iconTheme.color,
                        ),
                        leading: Text(
                          LocaleKeys.settingsInfo2.tr(),
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                    Divider(),
                    InkWell(
                      onTap: () {
                        showAlertDialog(context);
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
                        await context.setLocale(Locale('en'));
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
                      onTap: () {
                        CacheHelper.removeData(
                          key: 'uId',
                        ).then((value)
                        {
                          CacheHelper.removeData(
                              key: 'categorie'
                          ).then((value) {
                            if (value)
                            {
                              print(uId);
                              print(categorie);
                              navigateToAndFinish(
                                context,
                                LoginView(),
                              );
                            }
                          });
                        });
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
  }
}

showAlertDialog(BuildContext context) {
  AlertDialog alert = AlertDialog(
    title: Text(LocaleKeys.settingsInfo5.tr()),
    actions: [
      defaultButton(
        text: "English",
        radius: 10,
        function: () async{
          await context.setLocale(Locale('en'));
          Navigator.of(context).pop();
        },
      ),
      SizedBox(
        height: 10.0,
      ),
      defaultButton(
        text: "العربيه",
        radius: 10,
        function: () async{
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

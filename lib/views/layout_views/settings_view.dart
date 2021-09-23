import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/services/helper/icon_broken.dart';
import 'package:movies_app/services/local/cache_helper.dart';
import 'package:movies_app/views/auth_views/login_view.dart';
import 'package:movies_app/widgets.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                        Text('Mohamed Mounir', style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          fontSize: 24.0,
                        ),),
                        Spacer(),
                        CircleAvatar(
                            foregroundColor: Colors.white,
                            backgroundColor: kPrimaryColor,
                            child: Icon(IconBroken.Profile,)),
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
                            onPressed: () {},
                            child: defaultTextField(
                                size: 18,
                                text: 'View full profile',
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
                        "Notifications",
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                  Divider(),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                        trailing: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(IconBroken.Info_Circle, color: Theme.of(context).iconTheme.color, size: 30.0,),
                        ),
                        leading: Text(
                          "Help",
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
                          if (value)
                          {
                            navigateToAndFinish(
                              context,
                              LoginView(),
                            );
                          }
                        });
                      },
                    child: ListTile(
                        trailing: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(IconBroken.Logout, color: Theme.of(context).iconTheme.color, size: 30.0,),
                        ),
                        leading: Text(
                          "Logout",
                          style: Theme.of(context).textTheme.bodyText1,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

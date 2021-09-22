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
                        defaultTextField(
                            size: 24,
                            text: "Mohamed Mounir",
                            color: Colors.black),
                        Spacer(),
                        CircleAvatar(
                            backgroundColor: kPrimaryColor,
                            child: Icon(IconBroken.Profile)),
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
                                color: Colors.blueAccent)),
                        Icon(
                          IconBroken.Arrow___Right_2,
                          color: Colors.blueAccent,
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
                      ),
                      leading: Text(
                        "Notifications",
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                  Divider(),
                  ListTile(
                      trailing: Switch(
                        onChanged: (value) {},
                        value: false,
                      ),
                      leading: Text(
                        "Dark Mode",
                        style: Theme.of(context).textTheme.bodyText1,
                      )),
                  Divider(),
                  InkWell(
                    onTap: () {},
                    child: ListTile(
                        trailing: Icon(IconBroken.Info_Circle),
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
                        trailing: Icon(IconBroken.Logout),
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

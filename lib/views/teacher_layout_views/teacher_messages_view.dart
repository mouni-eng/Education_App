import 'package:flutter/material.dart';
import 'package:movies_app/services/helper/icon_broken.dart';
import 'package:movies_app/translate/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class TeacherMessagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(IconBroken.Info_Circle, size: 80.0,),
        SizedBox(
          height: 20.0,
        ),
        Center(child: Text('${LocaleKeys.noMessages1.tr()} \n ${LocaleKeys.noMessages2.tr()}', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,)),
      ],
    );
  }
}
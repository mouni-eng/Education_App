import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/services/helper/icon_broken.dart';

class MessagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(IconBroken.Info_Circle, color: kSecondaryColor, size: 80.0,),
        SizedBox(
          height: 20.0,
        ),
        Center(child: Text('No Current messages \n Find all your ongoing chats here', style: Theme.of(context).textTheme.bodyText1, textAlign: TextAlign.center,)),
      ],
    );
  }
}

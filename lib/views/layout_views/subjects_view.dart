import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/translate/locale_keys.g.dart';
import 'package:movies_app/widgets.dart';

class SubjectsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.chooseSubject.tr(), style: Theme.of(context).textTheme.bodyText1!.copyWith(
          color: Colors.black,
        ),),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildSubjectsList(context, subjectsList[index]),
                separatorBuilder: (context, index) => Divider(thickness: 1,),
                itemCount: subjectsList.length,
            )
          ],
        ),
      ),
    );
  }
}

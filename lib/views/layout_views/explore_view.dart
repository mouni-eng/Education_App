// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/translate/locale_keys.g.dart';
import 'package:movies_app/view_models/explore_cubit/cubit.dart';
import 'package:movies_app/view_models/explore_cubit/states.dart';
import 'package:movies_app/widgets.dart';
import 'package:easy_localization/easy_localization.dart';

class ExploreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ExploreCubit, ExploreStates>(
      listener: (context, states) {},
      builder: (context, states) {
        ExploreCubit cubit = ExploreCubit.get(context);
        return ConditionalBuilder(
          condition: cubit.userModel != null,
          builder: (context) => SafeArea(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.cloud,),
                        SizedBox(width: 10.0,),
                        Text("${LocaleKeys.welcome.tr()} ${cubit.userModel!.name}", style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                    SizedBox(height: 15.0,),
                    Text(LocaleKeys.infoBar.tr(), style: Theme.of(context).textTheme.bodyText1,),
                    SizedBox(height: 15.0,),
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${cubit.userModel!.name} (${LocaleKeys.info.tr()})', style: Theme.of(context).textTheme.bodyText1,),
                                SizedBox(height: 10.0,),
                                Text('Grade 10 | National System (Kuwait)', style: Theme.of(context).textTheme.bodyText2,),
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 20.0,
                                foregroundColor: Colors.white,
                                backgroundColor: kPrimaryColor,
                                backgroundImage: cubit.profileImage == null ? NetworkImage(cubit.userModel!.image!) : FileImage(cubit.profileImage!) as ImageProvider,),
                              ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0,),
                    Text(LocaleKeys.services.tr(), style: Theme.of(context).textTheme.bodyText1,),
                    SizedBox(height: 15.0,),
                    Container(
                      height: 100.0,
                      child: buildServicesList(context),
                    ),
                    SizedBox(height: 25.0,),
                    Text(LocaleKeys.availableSubjects.tr(), style: Theme.of(context).textTheme.bodyText1,),
                    SizedBox(height: 15.0,),
                    Container(
                      height: 155.0,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) => buildSuggestionList(context),
                        separatorBuilder: (context, index) => SizedBox(width: 20.0,),
                        itemCount: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }
}

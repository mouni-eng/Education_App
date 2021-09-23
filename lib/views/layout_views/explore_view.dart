import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/services/helper/icon_broken.dart';
import 'package:movies_app/widgets.dart';

class ExploreView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                  Text('Good evening, Mohamed', style: Theme.of(context).textTheme.bodyText2),
                ],
              ),
              SizedBox(height: 15.0,),
              Text("Today's learner is ", style: Theme.of(context).textTheme.bodyText1,),
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
                          Text('Mohamed (Me)', style: Theme.of(context).textTheme.bodyText1,),
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
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(IconBroken.Profile,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40.0,),
              Text("Our Services", style: Theme.of(context).textTheme.bodyText1,),
              SizedBox(height: 15.0,),
              Container(
                height: 100.0,
                child: buildServicesList(context),
                ),
              SizedBox(height: 25.0,),
              Text("Your available subjects for studying:", style: Theme.of(context).textTheme.bodyText1,),
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
    );
  }
}

import 'package:flutter_ui_designs/api/food_api.dart';
import 'package:flutter_ui_designs/model/food.dart';
import 'package:flutter_ui_designs/notifier/food_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_ui_designs/teamtab1.dart';
import 'package:flutter_ui_designs/calendar.dart';
import 'package:flutter_ui_designs/scaffold/create_team.dart';
import 'package:like_button/like_button.dart';
import 'package:flutter_ui_designs/join.dart';
import 'package:flutter_ui_designs/teamstats.dart';
import 'package:flutter_ui_designs/crud/presentation/pages/home.dart';

import 'food_form.dart';

class FoodDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    _onFoodDeleted(Food food) {
      Navigator.pop(context);
      foodNotifier.deleteFood(food);
    }

    return Center(
        child: Card(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 50),
            color: Colors.black,
            elevation: 3.0,
            child: Container(
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.0),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'assets/loader7.gif',
                              image: foodNotifier.currentFood.image,
                            ),
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Text(
                            foodNotifier.currentFood.name,
                            overflow: TextOverflow.fade,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 4.0,
                          ),
                          Text(
                            foodNotifier.currentFood.category,
                            overflow: TextOverflow.fade,
                            maxLines: 99,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Row(children: <Widget>[
                            CircleAvatar(
                              radius: 20.0,
                              backgroundImage: AssetImage("assets/default.png"),
                              backgroundColor: Colors.transparent,
                            ),
                          ]),
                        ])))));
  }

  Widget likeButton() {
    return Container(
        width: 80,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: Colors.transparent)),
        child: Center(
            child: LikeButton(
          size: 25,
          circleColor: CircleColor(start: Colors.red, end: Colors.redAccent),
          bubblesColor: BubblesColor(
            dotPrimaryColor: Colors.red,
            dotSecondaryColor: Colors.redAccent,
          ),
          likeBuilder: (bool isLiked) {
            return Icon(
              Icons.favorite,
              color: isLiked ? Colors.redAccent : Colors.grey,
              size: 25,
            );
          },
          likeCount: 6895,
          countBuilder: (int count, bool isLiked, String text) {
            var color = isLiked ? Colors.white : Colors.grey;
            Widget result;
            if (count == 0) {
              result = Text(
                "love",
                style: TextStyle(color: color),
              );
            } else
              result = Text(
                text,
                style: TextStyle(color: color),
              );
            return result;
          },
        )));
  }

  Widget makeStory({storyImage, userImage}) {
    return AspectRatio(
      aspectRatio: 1.4 / 1,
      child: Container(
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image:
              DecorationImage(image: AssetImage(storyImage), fit: BoxFit.cover),
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.1),
              ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.transparent, width: 0.5),
                    image: DecorationImage(
                        image: AssetImage(userImage), fit: BoxFit.cover)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconBadge(
    IconData icon,
    String badgeText,
    Color badgeColor,
  ) {
    return Stack(
      children: <Widget>[
        Icon(
          icon,
          size: 35.0,
        ),
        Positioned(
          top: 2.0,
          right: 4.0,
          child: Container(
            padding: EdgeInsets.all(1.0),
            decoration: BoxDecoration(
              color: badgeColor,
              shape: BoxShape.circle,
            ),
            constraints: BoxConstraints(
              minWidth: 15.0,
              minHeight: 15.0,
            ),
            child: Center(
              child: Text(
                badgeText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

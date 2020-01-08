import 'package:flutter_ui_designs/api/food_api.dart';
import 'package:flutter_ui_designs/notifier/auth_notifier.dart';
import 'package:flutter_ui_designs/notifier/food_notifier.dart';
import 'package:flutter_ui_designs/screens/details.dart';
import 'package:flutter_ui_designs/screens/food_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Feedx extends StatefulWidget {
  @override
  _FeedxState createState() => _FeedxState();
}

class _FeedxState extends State<Feedx> {
  @override
  void initState() {
    FoodNotifier foodNotifier =
        Provider.of<FoodNotifier>(context, listen: false);
    getFoods(foodNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AuthNotifier authNotifier = Provider.of<AuthNotifier>(context);
    FoodNotifier foodNotifier = Provider.of<FoodNotifier>(context);

    Future<void> _refreshList() async {
      getFoods(foodNotifier);
    }

    print("building Feed");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(0.1),
        elevation: 0,
        title: Text(
          'Social',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            letterSpacing: 1.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: Row(),
        centerTitle: true,
        actions: <Widget>[
          SizedBox.fromSize(
              size: Size(60, 60),
              child: ClipOval(
                  child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                          splashColor: Colors.white,
                          onTap: () {
                            foodNotifier.currentFood = null;
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                return FoodForm(
                                  isUpdating: false,
                                );
                              }),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Icon(
                                Icons.photo_camera,
                                size: 28,
                                color: Colors.black54,
                              ),
                              RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: "Post",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ],
                          ))))),
        ],
      ),
      body: RefreshIndicator(
        child: StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          itemCount: foodNotifier.foodList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Column(children: <Widget>[
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: FadeInImage.assetNetwork(
                        placeholder: 'assets/loader7.gif',
                        image: foodNotifier.foodList[index].image,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: foodNotifier.foodList[index].name,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ]),
                  Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        RichText(
                          text: TextSpan(
                            text: foodNotifier.foodList[index].category,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ]),
                  Row(children: <Widget>[
                    CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage("assets/default.png"),
                      backgroundColor: Colors.transparent,
                    ),
                    Expanded(child: Container()),
                    IconButton(
                        icon: Icon(Icons.more_horiz),
                        onPressed: () {
                          foodNotifier.currentFood =
                              foodNotifier.foodList[index];
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) {
                            return FoodDetail();
                          }));
                        })
                  ]),
                ]));
          },
          staggeredTileBuilder: (int index) {
            return StaggeredTile.count(2, index.isEven ? 3.4 : 4);
          },
          mainAxisSpacing: 0,
          crossAxisSpacing: 0,
        ),
        onRefresh: _refreshList,
      ),
    );
  }
}

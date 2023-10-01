import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';

class SwipingScreen extends StatefulWidget {
  @override
  _SwipingScreenState createState() => _SwipingScreenState();
}

class _SwipingScreenState extends State<SwipingScreen> {
  CardController controller = CardController();

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: new Scaffold(
        body: Center(
          child: _showPrefListData(size, controller),
        ),
      ),
    );
  }

  _showPrefListData(Size size, CardController cardController) {
    return Column(
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            height: size.height * 0.6,
            child: new SwipeCard(
              swipeEdgeVertical: 8.0,
              animDuration: 500,
              totalNum: 10,
              stackNum: 10,
              swipeEdge: 2.0,
              allowVerticalMovement: false,
              maxWidth: MediaQuery.of(context).size.width * 1,
              minWidth: MediaQuery.of(context).size.width * 0.8,
              minHeight: MediaQuery.of(context).size.width + 120 * 0.88,
              maxHeight: MediaQuery.of(context).size.width + 120 * 0.99,
              cardBuilder: (context, index) => Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      /*
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          height: 1000,
                          width: 300,
                          image: AssetImage(
                            imageItems[index]['image'],
                          ),
                          placeholder: AssetImage(
                            imageItems[index]['image'],
                          ),
                        ),
                      ),
                      */

                      Container(
                        height: 1000,
                        width: 400,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.0),
                          child: FadeInImage(
                            fit: BoxFit.contain,
                            image: AssetImage(
                              imageItems[index]['image'],
                            ),
                            placeholder: AssetImage(
                              imageItems[index]['image'],
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          width: double.infinity,
                          height: size.height * 0.15,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                            color: Colors.white,
                            gradient: new LinearGradient(
                                colors: [
                                  Colors.black54,
                                  Colors.black,
                                ],
                                begin: const FractionalOffset(1.0, 0.0),
                                end: const FractionalOffset(0.0, 1.0),
                                stops: [0.0, 1.0],
                                tileMode: TileMode.clamp),
                          ),
                          child: Column(
                            children: [
                              Text(
                                imageItems[index]['name'],
                                style: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w400,
                                  fontSize: size.width * 0.09,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                imageItems[index]['title'],
                                style: TextStyle(
                                  color: const Color(0xffffffff),
                                  fontWeight: FontWeight.w400,
                                  fontSize: size.width * 0.04,
                                ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              cardController: cardController,
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                /// Get swiping card's alignment
                if (align.x < 0) {
                  //Card is LEFT swiping
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {},
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                elevation: 10,
                heroTag: null,
                onPressed: () {
                  cardController.swipeLeft();
                },
                backgroundColor: Colors.white,
                child: Image.asset(
                  'images/arrowleft.png',
                  height: 30,
                  width: 30,
                ),
              ),
              FloatingActionButton(
                elevation: 10,
                heroTag: null,
                onPressed: () {
                  cardController.swipeRight();
                },
                backgroundColor: Colors.white,
                child: Image.asset(
                  'images/arrowright.png',
                  height: 30,
                  width: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  List<dynamic> imageItems = [
    {
      "image": "images/databricks.png",
      "name": "Databricks",
      "title": "Product Management Intern (Summer 2024)"
    },
    {
      "image": "images/Crusoe.png",
      "name": "Crusoe",
      "title": "University | Intern - Associate Product Manager | 2024"
    },
    {
      "image": "images/ServiceNow.png",
      "name": "ServiceNow",
      "title": "Product Manager Intern (Masters/MBA Degree) - Summer 2024"
    },
    {
      "image": "images/Electronic Arts.png",
      "name": "Electronic Arts",
      "title": "Product Manager Intern (Apex Legends)"
    },
    {
      "image": "images/PayPal.png",
      "name": "PayPal",
      "title": "Associate Product Manager Intern, Summer 2024"
    },
    {
      "image": "images/VIZIO, Inc..jpeg",
      "name": "VIZIO, Inc.",
      "title": "Fall Co-Op Product Management Intern"
    },
    {
      "image": "images/Renesas Electronics.png",
      "name": "Renesas Electronics",
      "title": "Software Enginner Intern Summer 2024"
    },
    {
      "image": "images/Adobe.jpeg",
      "name": "Adobe",
      "title": "2024 MBA Intern - Product Management"
    },
    {
      "image": "images/Google.webp",
      "name": "Google",
      "title": "Product Management Internship"
    },
    {
      "image": "images/mymoneykarma.png",
      "name": "mymoneykarma",
      "title": "Product Manager Intern"
    },
  ];
}

import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tinder_swipe/flutter_tinder_swipe.dart';

class SwipingScreen extends StatefulWidget {
  const SwipingScreen({super.key});

  @override
  _SwipingScreenState createState() => _SwipingScreenState();
}

class _SwipingScreenState extends State<SwipingScreen> {
  CardController controller = CardController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
            child: SwipeCard(
              swipeEdgeVertical: 8.0,
              animDuration: 500,
              totalNum: 3,
              stackNum: 3,
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
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: FadeInImage(
                              fit: BoxFit.cover,
                              height: MediaQuery.of(context).size.height * 1,
                              width: MediaQuery.of(context).size.width,
                              image: AssetImage(
                                imageItems[index]['image'],
                              ),
                              placeholder: AssetImage(
                                imageItems[index]['image'],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: double.infinity,
                              height: size.height * 0.15,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                color: Colors.white,
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.transparent,
                                      Colors.black45,
                                    ],
                                    begin: FractionalOffset(1.0, 0.0),
                                    end: FractionalOffset(0.0, 1.0),
                                    stops: [0.0, 1.0],
                                    tileMode: TileMode.clamp),
                              ),
                              child: Column(
                                children: [
                                  // Kylie Jean | Age 25
                                  Text("Company Name? | Location?",
                                      style: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.width * 0.06),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Job Position?',
                                      style: TextStyle(
                                          color: const Color(0xffffffff),
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.width * 0.04),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ))),
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
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FloatingActionButton(
                elevation: 10,
                heroTag: null,
                onPressed: () {
                  cardController.swipeLeft();
                },
                backgroundColor: Colors.black,
                child: Image.asset(
                  'images/arrowleft.png',
                  height: 60,
                  width: 60,
                ),
              ),
              FloatingActionButton(
                elevation: 10,
                heroTag: null,
                onPressed: () {
                  cardController.swipeRight();
                },
                backgroundColor: Colors.black,
                child: Image.asset(
                  'images/arrowright.png',
                  height: 60,
                  width: 60,
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
      "image": "images/avatar.png",
    },
    {
      "image": "images/avatar.png",
    },
    {
      "image": "images/avatar.png",
    },
    {
      "image": "images/avatar.png",
    },
  ];
}

import 'package:flutter/material.dart';
import 'package:repair_service_ui/utils/constants.dart';
import 'package:repair_service_ui/widgets/page_indicator.dart';
import 'package:repair_service_ui/widgets/thankyou_page.dart';

class HomePageOne extends StatefulWidget {
  final Function nextPage;
  final Function prevPage;

  HomePageOne({this.nextPage, this.prevPage});
  @override
  _HomePageOneState createState() => _HomePageOneState();
}

class _HomePageOneState extends State<HomePageOne> {
  final List options = [
    [
      {
        "name": "Mobile",
        "icon": "assets/images/iphone-14.png",
        "key": "mobile",
      },
      {
        "name": "Tablet",
        "icon": "assets/images/ipad.png",
        "key": "tablet",
      },
    ],
    // Second
    [
      {
        "name": "Laptop",
        "icon": "assets/images/laptop.png",
        "key": "laptop",
      },
      {
        "name": "Desktop",
        "icon": "assets/images/desktop.png",
        "key": "desktop",
      },
    ],
    // Third
    [
      {
        "name": "Watch",
        "icon": "assets/images/watch.png",
        "key": "watch",
      },
      {
        "name": "Earphones",
        "icon": "assets/images/earphones.png",
        "key": "headphone",
      },
    ],
  ];

  String active = "";

  void setActiveFunc(String key) {
    setState(() {
      active = key;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double heightFromWhiteBg =
        size.height - 200.0 - Scaffold.of(context).appBarMaxHeight;
    return Container(
      height: size.height - kToolbarHeight,
      child: Stack(
        children: [
          Container(
            height: 200.0,
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: FittedBox(
              child: Container(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: CircleAvatar(
                        backgroundImage: AssetImage("assets/images/pfpf.jpg"),
                      ),
                    ),
                    PageIndicator(activePage: 1),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Have some problem with your device?",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.77),
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      "Choose your\ndevice",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        height: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200.0,
            width: size.width,
            child: Container(
              height: heightFromWhiteBg,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200.0,
            height: heightFromWhiteBg,
            width: size.width,
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  3,
                  (index) => Expanded(
                    child: Container(
                      margin: EdgeInsets.only(bottom: index == 2 ? 0 : 10.0),
                      child: Row(
                        children: [
                          serviceCard(options[index][0], active, setActiveFunc,
                              this.widget.nextPage),
                          SizedBox(
                            width: 10.0,
                          ),
                          serviceCard(options[index][1], active, setActiveFunc,
                              this.widget.nextPage),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget serviceCard(Map item, String active, Function setActive, nextPage) {
  bool isActive = active == item["key"];
  return Expanded(
    child: GestureDetector(
      onTap: () {
        setActive(item["key"]);
        Future.delayed(Duration(milliseconds: 350), () {
          nextPage();
        });
      },
      child: AnimatedContainer(
  duration: Duration(milliseconds: 300),
  decoration: BoxDecoration(
    color: isActive ? Color(0xFF283643) : Constants.greyColor, // Set the color to the desired hex code
    borderRadius: BorderRadius.circular(12.0),
  ),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
       Image.asset(
        item["icon"], // Remove this line if not using SVG
      ),
      SizedBox(
        height: 5.0,
      ),
      Text(
        item["name"],
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
          color: isActive
              ? Colors.white
              : Color.fromRGBO(20, 20, 20, 0.96),
            )
          )
        ],
        ),
      ),
    ),
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:repair_service_ui/utils/constants.dart';
import 'package:repair_service_ui/widgets/input_widget.dart';
import 'package:repair_service_ui/widgets/page_indicator.dart';

class HomePageTwo extends StatefulWidget {
  final Function nextPage;
  final Function prevPage;

  HomePageTwo({this.nextPage, this.prevPage});

  @override
  _HomePageTwoState createState() => _HomePageTwoState();
}

class _HomePageTwoState extends State<HomePageTwo> {
  final List options = [
    [
      {
        "name": "Startup or Power",
        "icon": "assets/images/shutdown.png",
        "key": "power",
      },
      {
        "name": "Hardware Issues",
        "icon": "assets/images/tools.png",
        "key": "hardware",
      },
    ],
    // Second
    [
      {
        "name": "Battery & Charging",
        "icon": "assets/images/charging-battery.png",
        "key": "charging",
      },
      {
        "name": "Internet & Connectivity",
        "icon": "assets/images/wifi.png",
        "key": "internet",
      },
    ],
    // Third
    [
      {
        "name": "Software & Usage",
        "icon": "assets/images/window-settings.png",
        "key": "software",
      },
      {
        "name": "Mail",
        "icon": "assets/images/mail.png",
        "key": "mail",
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
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20.0,
          ),
          PageIndicator(
            activePage: 2,
            darkMode: false,
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            "What is the problem?",
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: 28.0,
              fontWeight: FontWeight.w600,
              height: 1.2,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          InputWidget(
            hintText: "Search the problem",
            suffixIcon: FlutterIcons.search1_ant,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
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

Widget serviceCard(
    Map item, String active, Function setActive, Function nextPage) {
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:planets/CustomWidgets/background_stars.dart';
import 'package:planets/CustomWidgets/homeAppBar.dart';
import 'package:planets/CustomWidgets/planetCard.dart';
import 'package:planets/CustomWidgets/searchBox.dart';
import 'package:planets/data_models/sampleData.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff181838),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              fit: StackFit.loose,
              children: <Widget>[
                BackgroundStars(),
                Positioned(
                  right: 0,
                  top: MediaQuery.of(context).size.height * 0.35,
                  child: Image.asset(
                    'assets/images/spacestation.png',
                    width: 40,
                    height: 40,
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      HomeBar(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Text(
                        'Explore',
                        style: TextStyle(
                          color: Colors.orange[500],
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'all the planets',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 28,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      SearchBox(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: planetNumbers.length,
                        itemBuilder: (context, int index) {
                          return Stack(
                            children: [
                              PlanetCard(
                                planetName: planetNames[index],
                                planetNumber: planetNumbers[index],
                              ),
                              Positioned(
                                right: 10,
                                top: -40,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.5,
                                  height:
                                      MediaQuery.of(context).size.height * 0.4,
                                  child: Image.asset(images[index]),
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

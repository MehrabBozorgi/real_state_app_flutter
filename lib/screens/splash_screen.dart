import 'package:flutter/material.dart';
import 'package:real_state_app_flutter/const/colors.dart';
import 'package:real_state_app_flutter/const/font_style.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/images/image.png',
            width: size.width,
            height: size.height,
            fit: BoxFit.cover,
          ),

          Container(
            width: size.width,
            height: size.width,

            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.transparent, Colors.black26],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          Padding(
            padding:  EdgeInsets.only(top: 40),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ///section1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'R',
                        style: getHeadStyle(
                          context,
                          color: MyColors.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'eal',
                            style: getLargeBodyStyle(
                              context,
                              color: MyColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'estate',
                            style: getLargeBodyStyle(
                              context,
                              color: MyColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  ///section2
                  Text(
                    'Making dreams come to you',
                    style: getLargeBodyStyle(
                      context,
                      color: MyColors.primaryColor,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:healthguide/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    screensp();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 245, 240, 198),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TweenAnimationBuilder(
                    duration: const Duration(seconds: 2),
                    tween: Tween<double>(begin: 20, end: 80),
                    builder: (BuildContext context, double value, _) {
                      return Row(
                        children: [
                          Container(
                            color:const Color.fromARGB(248, 155, 243, 224),
                            height: 50,
                            width: 1.5 * value,
                          ),
                          SizedBox(
                            width: value,
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ),
          Expanded(
              child: Row(
            children: [
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 20, end: 180),
                  duration:const Duration(seconds: 3),
                  curve: Curves.bounceInOut,
                  builder: (BuildContext context, double value, _) {
                    return Row(
                      children: [
                        SizedBox(width: 0.5 * value),
                        RotationTransition(
                          turns: AlwaysStoppedAnimation(-value / 360),
                          child: ClipPath(
                            child: Container(
                              color:const Color.fromARGB(250, 155, 44, 220),
                              width: 150,
                            ),
                            clipper: _Triangle1(),
                          ),
                        )
                      ],
                    );
                  })
            ],
          )),
          Expanded(
              child: Container(
            child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 20, end: 37),
                duration: Duration(seconds: 3),
                curve: Curves.decelerate,
                builder: (BuildContext context, double value, _) {
                  return Center(
                    child: Text(
                      "HealthGuide",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: value,
                          color: Color.fromARGB(255, 22, 29, 109)),
                    ),
                  );
                }),
          )),
          Expanded(
            child: Row(
              children: [
                TweenAnimationBuilder(
                    duration: const Duration(seconds: 2),
                    tween: Tween<double>(begin: 20, end: 100),
                    builder: (BuildContext context, double value, _) {
                      return Container(
                        color: Color.fromARGB(250, 155, 44, 220),
                        height: 60,
                        width: value,
                      );
                    }),
              ],
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 50, end: 100),
                  duration: Duration(seconds: 3),
                  curve: Curves.easeInOut,
                  builder: (BuildContext context, double value, _) {
                    return Row(
                      children: [
                        RotationTransition(
                          turns: AlwaysStoppedAnimation(-value / 360),
                          child: ClipPath(
                            child: Container(
                              color: Color.fromARGB(248, 155, 243, 224),
                              width: value,
                            ),
                            clipper: _Triangle2(),
                          ),
                        ),
                      ],
                    );
                  })
            ],
          )),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> screensp() async {
    await Future.delayed(const Duration(seconds: 7));
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => login()));
    
  }
}

class _Triangle1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

class _Triangle2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, 0);
    path.lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        color: Colors.white,
        child:
        Center(child: Lottie.asset('assets/lottie/train.json', width: 250)),
      ),
    );
  }
}


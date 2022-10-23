import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'lib/assets/images/splashbackground.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 0,
            top: MediaQuery.of(context).size.height / 4.5,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              // color: Colors.red,s
              child: Image(
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width - 16,
                image: AssetImage(
                  "lib/assets/images/pokemon.png",
                ),
              ),
            ),
          ),
          SpinKitCircle(
            color: Colors.white,
            size: 50.0,
          )
        ],
      ),
    );
  }
}

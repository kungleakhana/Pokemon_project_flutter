import 'package:flutter/material.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          height: 250,
          child: Card(
            child: AspectRatio(
                      aspectRatio: 3 / 3.2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                               "",
                            ),
                          ),
                        ),
                      ),
                    ),
          ),
        )
      ]),
    );
  }
}

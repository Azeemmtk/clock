import 'package:flutter/material.dart';

class menuitems extends StatelessWidget {
  menuitems({super.key, required this.image, required this.name});

  String image;
  String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          color: name == 'Clock' ? Colors.greenAccent : Colors.transparent,
          child: Column(
            children: [
              Image.asset(
                image,
                scale: 2,
              ),
              Text(
                name,
                style: TextStyle(
                  fontFamily: 'avenir',
                  color: Colors.white,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

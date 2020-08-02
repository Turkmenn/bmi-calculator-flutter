import 'package:flutter/material.dart';

class AylaCard extends StatelessWidget {
  AylaCard({@required this.colour, this.cardChild, this.onPress});
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}

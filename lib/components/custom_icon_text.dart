// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomIconText extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Color backgroudColor;
  final Color foregroudColor;
  final IconData? icon;
  final Color? iconColor;
  final Alignment? iconAlignment;
  final String? imageUrl;

  const CustomIconText({
    super.key,
    this.title,
    this.subtitle,
    required this.backgroudColor,
    required this.foregroudColor,
    this.icon,
    this.iconColor,
    this.iconAlignment,
    this.imageUrl,
  });

  final double _height = 150;
  final double _width = 150;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(28.0),
      child: Container(
        color: backgroudColor,
        height: _height,
        width: _width,
        child: Stack(
          children: [
            _foregroundCircle(),
            Align(
              alignment: iconAlignment ?? Alignment.topRight,
              child: _getIcon(icon),
            ),
            Positioned(
              top: 90,
              child: Container(
                width: _width,
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? '',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 2),
                    Row(
                      children: [
                        Text(
                          subtitle ?? '',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 6),
                        (subtitle != null || subtitle == '')
                            ? Icon(
                                Icons.arrow_forward_outlined,
                                size: 12,
                                color: Colors.white,
                              )
                            : SizedBox()
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getIcon(IconData? iconData) {
    if (iconData == null) return SizedBox();

    final iconSize = _height * .55;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: iconSize,
      width: iconSize,
      child: Center(
        child: Icon(
          iconData,
          size: iconSize,
          color: iconColor,
        ),
      ),
    );
  }

  Widget _foregroundCircle() {
    return Positioned(
      top: 30,
      right: -10,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(120.0),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                backgroudColor,
                foregroudColor,
              ],
              begin: const FractionalOffset(0.3, 0.0),
              end: const FractionalOffset(1.0, 1.0),
              stops: const [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          height: _height * 1.67, // cirle is 167% of Box size -Wrn
          width: _width * 1.67, // cirle is 167% of Box size -Wrn
        ),
      ),
    );
  }
}

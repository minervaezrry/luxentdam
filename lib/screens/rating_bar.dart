import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final Color color;
  final bool showNumber;
  final int starCount;

  const RatingBar({
    super.key,
    required this.rating,
    this.size = 20,
    this.color = Colors.amber,
    this.showNumber = false,
    this.starCount = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showNumber)
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Text(
              rating.toStringAsFixed(1),
              style: TextStyle(
                fontSize: size * 0.7,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ...List.generate(starCount, (index) {
          double fill = 0;
          if (rating >= index + 1) {
            fill = 1;
          } else if (rating > index) {
            fill = rating - index;
          }
          return Stack(
            children: [
              Icon(
                Icons.star_outline,
                size: size,
                color: color,
              ),
              ClipRect(
                clipper: _StarClipper(fill * size),
                child: Icon(
                  Icons.star,
                  size: size,
                  color: color,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class _StarClipper extends CustomClipper<Rect> {
  final double fill;

  _StarClipper(this.fill);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, fill, size.height);
  }

  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return true;
  }
}
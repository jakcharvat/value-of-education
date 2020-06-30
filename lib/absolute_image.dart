import 'dart:math';

import 'package:flutter/material.dart';

class AbsoluteImage extends StatelessWidget {
  AbsoluteImage(
    this.scrollOffset,
    this.enterOffset,
    this.exitOffset,
    this.image,
  );

  final double scrollOffset;
  final double enterOffset;
  final double exitOffset;
  final Image image;

  double _imageOffsetTop(BuildContext context) {
    if (enterOffset <= scrollOffset && scrollOffset <= exitOffset) {
      return 0.0;
    }

    if (scrollOffset < enterOffset) {
      return enterOffset - scrollOffset;
    }

    if (scrollOffset > exitOffset) {
      return exitOffset - scrollOffset;
    }

    return 0.0;
  }

  double _imageScale(BuildContext context) {
    if (scrollOffset > exitOffset) {
      double os = min(
        scrollOffset - exitOffset,
        50.0,
      );

      double p = (MediaQuery.of(context).size.width - 50.0) /
          MediaQuery.of(context).size.width;

      return 1.0 - (os / 50 * (1 - p));
    } else if (enterOffset > scrollOffset) {
      double os = min(
        (scrollOffset - enterOffset).abs(),
        50,
      );

      double p = (MediaQuery.of(context).size.width - 50.0) /
          MediaQuery.of(context).size.width;

      return 1.0 - (os / 50 * (1 - p));
    } else {
      return 1.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Stack(
        children: <Widget>[
          Positioned(
            top: _imageOffsetTop(context),
            left: 0,
            right: 0,
            bottom: -_imageOffsetTop(context),
            child: Material(
              child: Transform.scale(
                scale: _imageScale(context),
                child: Material(
                  elevation: 3,
                  child: image
                ),
              ),
            ),
          ),
          Positioned(
            top: _imageOffsetTop(context),
            left: 0,
            right: 0,
            bottom: -_imageOffsetTop(context),
            child: Transform.scale(
              scale: _imageScale(context),
              child: Container(color: Colors.black.withOpacity(0.5)),
            ),
          ),
        ],
      ),
    );
  }
}

import 'dart:math';

import 'package:flutter/material.dart';

class InfoPart extends StatelessWidget {
  InfoPart({
    this.topOffset = 0.0,
    this.padded = true,
    this.child,
  });

  final double topOffset;
  final bool padded;
  final Widget child;

  Widget _padded(context) => Row(
        children: <Widget>[
          Spacer(),
          SizedBox(width: 30.0),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: min(900.0, MediaQuery.of(context).size.width - 60.0),
            ),
            child: child,
          ),
          SizedBox(width: 30.0),
          Spacer(),
        ],
      );

  Widget _nonPadded(context) => Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0),
    child: ConstrainedBox(
      constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width - 32.0,
          ),
      child: child,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: topOffset,
      left: 0.0,
      right: 0.0,
      child: padded ? _padded(context) : _nonPadded(context),
    );
  }
}

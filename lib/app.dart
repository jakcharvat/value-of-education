import 'dart:math';

import 'package:flutter/material.dart';

import 'absolute_image.dart';
import 'content.dart';

class App extends StatefulWidget {
  App(this.toggleTheme);

  final VoidCallback toggleTheme;

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin<App> {
  ScrollController _scrollController;

  double _scrollOffset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      print(_scrollController.offset - MediaQuery.of(context).size.height * 4);
      setState(() => _scrollOffset = _scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        AbsoluteImage(
          _scrollOffset,
          0.0,
          MediaQuery.of(context).size.height + 50,
          Image.asset(
            'bad_school.jpg',
            fit: BoxFit.cover,
          ),
        ),
        AbsoluteImage(
          _scrollOffset,
          MediaQuery.of(context).size.height * 2 + 1000,
          MediaQuery.of(context).size.height * 2 + 1400,
          Image.asset(
            'accounting.jpg',
            fit: BoxFit.cover,
          ),
        ),
        AbsoluteImage(
          _scrollOffset,
          MediaQuery.of(context).size.height * 3.5 + 1750,
          MediaQuery.of(context).size.height * 3.5 + 2150,
          Image.asset(
            'argument.png',
            fit: BoxFit.cover,
          )
        ),
        Positioned.fill(
          child: ListView(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(
                        32.0,
                        MediaQuery.of(context).size.height / 2 - 50,
                        32.0,
                        32.0,
                      ),
                      child: Text(
                        'The Value of Education: A View from the Bridge case study',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Raleway',
                          fontSize: 48.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Content(_scrollOffset),
            ],
          ),
        ),
        Positioned(
          right: 12.0,
          top: 12.0,
          child: Material(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0)),
            child: IconButton(
                icon: Icon(
                  Theme.of(context).brightness == Brightness.light
                      ? Icons.brightness_3
                      : Icons.brightness_5,
                  color: _iconColor(context),
                ),
                onPressed: widget.toggleTheme),
          ),
        ),
      ],
    );
  }

  Color _iconColor(context) {
    if (Theme.of(context).brightness == Brightness.dark) return Colors.white;

    double offset;
    try {
      offset = _scrollController.offset;
    } catch (e) {
      offset = 0.0;
    }

    if (offset < MediaQuery.of(context).size.height * 2) return Colors.white;
    if (offset > MediaQuery.of(context).size.height * 2 + 970 && offset < MediaQuery.of(context).size.height * 3 + 1365) return Colors.white;
    if (offset > MediaQuery.of(context).size.height * 3 + 2095 && offset < MediaQuery.of(context).size.height * 4 + 2475) return Colors.white;

    return Colors.black;
  }
}

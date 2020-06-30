import 'dart:math';
import 'dart:js' as js;

import 'package:flutter/material.dart';

class Sources extends StatelessWidget {
  static const _sources = <String, String>{
    'Mr.Tz1. Poor Learning Environment May Be the Source of Our Kids Failure 01.Jpg. May 5, 2017. Https://Commons.Wikimedia.Org/Wiki/File:Poor_learning_environment_may_be_the_source_of_our_kids_failure_01.Jpg.': 'https://commons.wikimedia.org/wiki/File:Poor_learning_environment_may_be_the_source_of_our_kids_failure_01.jpg',
    '"Right to Education : Situation around the World - Humanium." Humanium, 2017. https://www.humanium.org/en/right-to-education/.': 'https://www.humanium.org/en/right-to-education/',
    '“Unemployment - Unemployment Rates by Education Level - OECD Data.” theOECD, 2019. https://data.oecd.org/unemp/unemployment-rates-by-education-level.htm#indicator-chart.': 'https://data.oecd.org/unemp/unemployment-rates-by-education-level.htm#indicator-chart',
    'ernestoeslava. “Free Image on Pixabay - Woman, Women, Office, Work.” Pixabay.com, 2017. https://pixabay.com/photos/woman-women-office-work-business-2773007/.': 'https://pixabay.com/photos/woman-women-office-work-business-2773007/',
    'UIS. “Education.” Unesco.org, 2012. http://data.uis.unesco.org/Index.aspx?DataSetCode=EDULIT_DS&popupcustomise=true&lang=en#.': 'http://data.uis.unesco.org/Index.aspx?DataSetCode=EDULIT_DS&popupcustomise=true&lang=en#',
    'Worldometers. “GDP per Capita - Worldometers.” Worldometers.info, 2017. https://www.worldometers.info/gdp/gdp-per-capita/.': 'https://www.worldometers.info/gdp/gdp-per-capita/',
    'Broadway.com. “Show Clip - A View from the Bridge - ‘You Can’t Take No Job.’” YouTube Video. YouTube, March 9, 2011. https://www.youtube.com/watch?v=AYij1xV0Mjo.': 'https://www.youtube.com/watch?v=AYij1xV0Mjo',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white,
        ),
      ),
      body: Row(
        children: <Widget>[
          Spacer(),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: min(900.0, MediaQuery.of(context).size.width),
            ),
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: List.generate(
                _sources.length,
                (i) => ListTile(
                  title: Text(_sources.keys.toList()[i]),
                  onTap: () => js.context.callMethod('open', [_sources[_sources.keys.toList()[i]]]),
                  contentPadding: EdgeInsets.all(16.0),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
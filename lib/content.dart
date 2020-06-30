import 'package:flutter/material.dart';
import 'package:value_of_education/info_part.dart';

import 'chart_data/literacy_income_chart.dart';
import 'chart_data/unemployment_chart.dart';
import 'sources.dart';

class Content extends StatelessWidget {
  Content(this.scrollOffset);

  final double scrollOffset;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: 6300,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          InfoPart(
            child: Text(
              '759 Million adults around the world lack the ability to read.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            topOffset: MediaQuery.of(context).size.height / 2,
          ),
          InfoPart(
            child: Text(
              'Good education is becoming increasingly more important in today\'s rapidly growing and higly competitive society. According to the Organisation for Economic Co-operation and Development, there is a direct correlation between the education level and employment rates worldwide:',
              style:
                  TextStyle(fontFamily: 'Raleway', fontSize: 16.0, height: 2.5),
            ),
            topOffset: MediaQuery.of(context).size.height + 200,
          ),
          InfoPart(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.5),
              child: UnemploymentChart(scrollOffset - (MediaQuery.of(context).size.height + 800), 150),
            ),
            topOffset: MediaQuery.of(context).size.height + 400,
          ),
          InfoPart(
            topOffset: MediaQuery.of(context).size.height * 1.5 + 1200,
            child: Text(
              'Eddie is well aware of this. And ensures Catherine is, too.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
          // -------------------------------------------------------------------------------------------------------- Main Text Body
          InfoPart(
            topOffset: MediaQuery.of(context).size.height * 2.5 + 1200,
            child: RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(
                style: TextStyle(
                  fontFamily: 'Raleway',
                  color: Theme.of(context).textTheme.body1.color,
                  fontSize: 16.0,
                  height: 2.5,
                ),
                children: [
                  TextSpan(
                    text:
                        'Eddie Carbone, one of the main characters in Arthur Miller\'s play ',
                  ),
                  TextSpan(
                    text: 'A View from the Bridge',
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
                  TextSpan(
                      text:
                          ' was, already in the 1950s when the play takes place, well aware of this fact. Miller presents this to the audience very early on in the play, in an argument he has with his niece, Catherine, about her opportunity to start work at a plumbing company. \n\n'
                          'Eddie was a lower-middle class longshoreman working on the docks in Brooklyn and living in Red Hook - a poor immigrant neighbourhood on the bayside of Brooklyn Bridge. The neighbourhood itself was described by Alfieri - the chorus, or narrator, of the play, as well as a successful lawyer working for the immigrant community - as "the gullet of New York, swallowing the tonnage of the world." (2) Eddie himself is also a second generation immigrant to the United States from Italy, just as is his wife, Beatrice. Immigration becomes one of the root causes of the conflict in the play, but that happens later on in the play. Catherine is a daughter of Beatrice\'s deceased sister, Eddie\'s niece, who the Carbones decided to take in an raise. \n\n')
                ],
              ),
            ),
          ),
          InfoPart(
            topOffset: MediaQuery.of(context).size.height * 3 + 1900,
            child: Text(
              '"It\'s not wonderful. You\'ll never get nowheres unless you finish school." (8)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 32.0,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.white,
                height: 2.0,
              ),
            ),
            padded: false,
          ),
          InfoPart(
            topOffset: MediaQuery.of(context).size.height * 3.5 + 2300,
            child: Text(
              'The education argument starts after Eddie comes home from work one day and Beatrice and Catherine are waiting for him in the kitchen, eagerly awaiting him to discuss an offer Catherine received to go work as an accountant at a local plumbing company. Eddie is not very happy about the offer, and even less so about Catherine\'s enthusiasm towards foregoing her last year of school in favour of the job. Eddie had hoped Catherine would study so she can go work at some prestigious law office and leave the poor immigrant life behind her, and believes accepting the offer would instead place her in "practically the same neighbourhood." (9)\n\n'
              'The value of education in today\'s society isn\'t limited to literature, though. The following chart combines data from the UNESCO Institute for Statistics and Worldometers to show the relationship between a country\'s Literacy Rate and its Purchasing Power Parity Gross Domestic Product per Capita:',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Theme.of(context).textTheme.body1.color,
                fontSize: 16.0,
                height: 2.5,
              ),
            ),
          ),
          InfoPart(
            topOffset: MediaQuery.of(context).size.height * 3.5 + 2750,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height / 1.5 + 142),
              child: LiteracyIncomeChart(),
            ),
          ),
          InfoPart(
            topOffset: MediaQuery.of(context).size.height * 5 + 2350,
            child: Text(
              'This graph only confirms what the first one set out - there is a clear correlation between education and the financial well-being of the average citizen of a country. Whilst the relationship in the literacy against GDP chart shows a few significant outliers, the trend follows closely to the first graph and supports Eddie\'s view of education. ',
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontFamily: 'Raleway',
                color: Theme.of(context).textTheme.body1.color,
                fontSize: 16.0,
                height: 2.5,
              ),
            ),
          ),
          // -------------------------------------------------------------------------------------------------------- Sources Button
          Positioned(
            bottom: 0,
            child: OutlineButton.icon(
              label: Text('Sources'),
              icon: Icon(Icons.format_quote),
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Sources())),
            ),
          ),
        ],
      ),
    );
  }
}

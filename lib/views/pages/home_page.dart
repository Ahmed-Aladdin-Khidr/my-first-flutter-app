import 'package:flutter/material.dart';
import 'package:flutter_app/data/constants.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            HeroWidget(title: 'Home'),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Card(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Basic Layout', style: kTextStyle.titleTealText),
                      Text(
                        'The description of the basic layout',
                        style: kTextStyle.descriptionText,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_app/views/widgets/hero_widget.dart';
import 'package:flutter_app/views/widgets/container_widget.dart';
import 'package:flutter_app/views/pages/course_page.dart';
import 'package:flutter_app/data/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            SizedBox(height: 20.0),
            HeroWidget(title: 'Flutter Map', nextPage: CoursePage()),
            SizedBox(height: 10.0),
            ...List.generate(
              KHomePage.titles.length,
              (index) => Padding(
                padding: EdgeInsets.only(bottom: 5.0),
                child: ContainerWidget(
                  title: KHomePage.titles[index],
                  description: KHomePage.descriptions[index],
                ),
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

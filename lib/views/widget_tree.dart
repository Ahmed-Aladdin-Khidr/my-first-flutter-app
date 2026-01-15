import 'package:flutter/material.dart';
import 'package:flutter_app/views/pages/home_page.dart';
import 'package:flutter_app/views/pages/profile_page.dart';
import 'package:flutter_app/views/pages/settings_page.dart';
import 'package:flutter_app/views/widgets/navbar_widget.dart';
import 'package:flutter_app/data/constants.dart';
import 'package:flutter_app/data/notifiers.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Map'),
        centerTitle: true,
        actions: [
          ValueListenableBuilder(
            valueListenable: isDarkModeNotifier,
            builder: (context, isDarkMode, child) {
              return IconButton(
                onPressed: () async {
                  isDarkModeNotifier.value = !isDarkMode;
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setBool(kTextStyle.themeModeKey, !isDarkMode);
                },
                icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SettingsPage(title: 'Settings'),
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, selectedPage, child) {
          return pages[selectedPage];
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}

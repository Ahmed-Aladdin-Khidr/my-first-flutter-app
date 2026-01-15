import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});
  final String title;
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TextEditingController usernameController = TextEditingController();
  bool isChecked = false;
  bool isSwitched = false;
  void toggleSwitch(bool value) {
    setState(() {
      isSwitched = value;
    });
  }

  double sliderValue = 0.0;
  void updateSliderValue(double value) {
    setState(() {
      sliderValue = value;
    });
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Snackbar opened'),
                      duration: Duration(seconds: 2),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                },
                child: Text('Open Snackbar'),
              ),
              Divider(
                color: Colors.teal,
                thickness: 2.0,
                indent: 20.0,
                endIndent: 20.0,
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Dialog Title'),
                        content: Text('Dialog Content'),
                        actions: [
                          FilledButton(onPressed: () {
                            Navigator.pop(context);
                          }, child: Text('Close')),
                        ],
                      );
                    },
                  );
                },
                child: Text('Open Dialog'),
              ),
              DropdownButton(
                hint: Text('Select an item'),
                value: selectedValue,
                items: [
                  DropdownMenuItem(value: 'e1', child: Text('1')),
                  DropdownMenuItem(value: 'e2', child: Text('2')),
                  DropdownMenuItem(value: 'e3', child: Text('3')),
                ],
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value ?? '1';
                  });
                },
              ),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  border: OutlineInputBorder(),
                ),
                onEditingComplete: () {
                  setState(() {});
                },
              ),
              Text(usernameController.text),
              SwitchListTile(
                contentPadding: EdgeInsets.zero,
                title: Text('Activate notifications'),
                value: isSwitched,
                onChanged: toggleSwitch,
              ),
              Slider(
                value: sliderValue,
                onChanged: updateSliderValue,
                min: 0.0,
                max: 100.0,
                divisions: 100,
              ),
              Text('Slider value: $sliderValue'),
              InkWell(
                splashColor: Colors.teal,
                onTap: () {},
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.black45,
                ),
              ),
              CheckboxListTile(
                contentPadding: EdgeInsets.zero,
                activeColor: Colors.teal,
                tristate: true,
                title: Text('Accept terms and conditions'),
                value: isChecked,
                onChanged: (value) {
                  setState(() {
                    isChecked = value ?? false;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Save'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

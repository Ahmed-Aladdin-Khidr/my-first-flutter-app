import 'package:flutter/material.dart';

class ExpandedFlexibleTestPage extends StatelessWidget {
  const ExpandedFlexibleTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Expanded and Flexible Test')),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(color: Colors.red, child: Text('Expanded')),
              ),
              Flexible(
                child: Container(color: Colors.blue, child: Text('Flexible')),
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  child: Text('Flexible flex 4'),
                ),
              ),
              Expanded(
                child: Container(color: Colors.red, child: Text('Expanded')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

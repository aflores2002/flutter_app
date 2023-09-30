import 'package:flutter/material.dart';

class JobSreen extends StatefulWidget {
  @override
  const JobSreen({super.key});

  _JobSreenState createState() => _JobSreenState();
}

class _JobSreenState extends State<JobSreen> {
  String _displayText = 'Hello, Flutter';

  // Event handler for a button click
  void _changeText() {
    setState(() {
      _displayText = 'Button Clicked!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Flutter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _displayText,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: Text('Change Text'),
            ),
          ],
        ),
      ),
    );
  }
}

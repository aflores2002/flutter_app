import 'package:flutter/material.dart';

class JobScreen extends StatefulWidget {
  @override
  const JobScreen({super.key});

  @override
  _JobScreenState createState() => _JobScreenState();
}

class _JobScreenState extends State<JobScreen> {
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
        title: const Text('My Flutter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              _displayText,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _changeText,
              child: const Text('Change Text'),
            ),
          ],
        ),
      ),
    );
  }
}

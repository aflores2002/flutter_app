import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MentorScreen extends StatefulWidget {
  const MentorScreen({Key? key}) : super(key: key);

  @override
  State<MentorScreen> createState() => _MentorScreenState();
}

class _MentorScreenState extends State<MentorScreen> {
  List<dynamic> users = []; // Define a list to hold user data

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find your ideal mentor...'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Working at',
                hintText: 'Working at',
                // You can customize other properties of the TextField's appearance here.
              ),
              onChanged: (value) {
                print('User entered: $value');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'as a',
                // You can customize other properties of the TextField's appearance here.
              ),
              onChanged: (value) {
                print('User entered: $value');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Location',
                hintText: 'while living in',
                // You can customize other properties of the TextField's appearance here.
              ),
              onChanged: (value) {
                print('User entered: $value');
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context, index) {
                  final user = users[index];
                  final name = user['name']['first'];
                  final email = user['email'];
                  //final imageUrl = user['picture']['thumbnail'];

                  return ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(name),
                    subtitle: Text(email),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchUsers();
          print('Search button pressed');
        },
        child: const Icon(Icons.search),
      ),
    );
  }

  void fetchUsers() async {
    print('users called');
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    setState(() {
      users = json['results'];
    });
    print('fetchusers completed');
  }
}

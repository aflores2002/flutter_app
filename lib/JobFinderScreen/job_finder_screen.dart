import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JobsScreen extends StatefulWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  List<dynamic> jobs = []; // Define a list to hold user data
  String title = '';
  String location = '';
  String level = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Find the perfect jobs for you!'),
      ),
<<<<<<< HEAD
      body: ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final job = jobs[index];
            final company = job['company_name'];
            final jobTitle = job['title'];
            final jobLocation = job['location'];
            //final apply_link = job['related_links']['link'];

            final miniSubtitle = '$jobTitle, $jobLocation';
            //final description = job['description'];
            //final imageUrl = job['picture']['thumbnail'];

            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
=======
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Job Title',
                hintText: 'Enter a job title',
                // You can customize other properties of the TextField's appearance here.
>>>>>>> 5dedd78510df24fb8c5dd114239e50320163e03c
              ),
              onChanged: (value) {
                title = value;
                print('User entered: $value');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Job Location',
                hintText: 'Where do you want to work?',
                // You can customize other properties of the TextField's appearance here.
              ),
              onChanged: (value) {
                location = value;
                print('User entered: $value');
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Job Level',
                hintText: 'What level of job are you looking for?',
                // You can customize other properties of the TextField's appearance here.
              ),
              onChanged: (value) {
                level = value;
                print('User entered: $value');
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: jobs.length,
              itemBuilder: (context, index) {
                final job = jobs[index];
                final company = job['company_name'];
                final jobTitle = job['title'];
                final jobLocation = job['location'];

                final miniSubtitle = '$jobTitle, $jobLocation';

                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(company),
                  subtitle: Text(miniSubtitle),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          fetchJobs();
          print('Search button pressed');
        },
        child: const Icon(Icons.search),
      ),
    );
  }

  void fetchJobs() async {
    print('should work!');
    print(title);
    final url =
        'https://serpapi.com/search?engine=google_jobs&q=$title+$level+$location&hl=en&api_key=96410ae31759505c08fda22525eabf8f4865d52ce2eebb9190de4aae34e25d68';
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        setState(() {
          jobs = json['jobs_results'];
        });
        print('fetchJobs completed');
      } else {
        // Handle non-200 status codes
        print('HTTP Error: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }
}

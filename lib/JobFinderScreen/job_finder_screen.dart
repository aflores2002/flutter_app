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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('THESE ARE JOBS'),
      ),
      body: ListView.builder(
          itemCount: jobs.length,
          itemBuilder: (context, index) {
            final job = jobs[index];
            final company = job['company_name'];
            final job_title = job['title'];
            final job_location = job['location'];
            //final apply_link = job['related_links']['link'];

            final miniSubtitle = '$job_title, $job_location';
            //final description = job['description'];
            //final imageUrl = job['picture']['thumbnail'];

            return ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(company),
              subtitle: Text(miniSubtitle),
              //subtitle: Text(email),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: fetchJobs,
      ),
    );
  }

  void fetchJobs() async {
    const url =
        'https://serpapi.com/search?engine=google_jobs&q=software+enginieering+intern+california&hl=en&api_key=96410ae31759505c08fda22525eabf8f4865d52ce2eebb9190de4aae34e25d68';
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

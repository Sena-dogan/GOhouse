import 'package:flutter/material.dart';
import 'package:gohouse/models/jobs.dart';

class JobPage extends StatelessWidget {
  JobPage({super.key, required this.job});
  final Jobs job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(job),
      body: _buildBody(job),
    );

  }
}

PreferredSizeWidget _buildAppBar(Jobs job) {
  return AppBar(
    title: Text("${job.name}"),
  );
}

Widget _buildBody(Jobs job) {
  return Material(
    child: Center(
      child: Text("${job.description}"),
    ),
  );
}
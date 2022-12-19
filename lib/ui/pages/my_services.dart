import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gohouse/data/network/apis/posts/post_api.dart';
import 'package:gohouse/models/jobs.dart';
import 'package:gohouse/stores/jobs/jobs_store.dart';
import 'package:gohouse/ui/pages/job_page.dart';
import 'package:gohouse/utils/routemanager/application.dart';
import 'package:gohouse/utils/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:gohouse/constants/app_theme.dart';
import 'package:provider/provider.dart';

class MyServices extends StatefulWidget {
  const MyServices({super.key});

  @override
  State<MyServices> createState() => _MyServicesState();
}

class _MyServicesState extends State<MyServices> {
  final user = FirebaseAuth.instance.currentUser;

  // Stream<List<Job>> getJobs() => FirebaseFirestore.instance
  //     .collection('jobs')
  //     .snapshots()
  //     .map((snapshot) =>
  //         snapshot.docs.map((doc) => Job.fromJson(doc.data())).toList());
  late JobsStore _jobsStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _jobsStore = Provider.of<JobsStore>(context);
    _jobsStore.getJobsByUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _jobsStore.editData(
              JobEditRequest(id: 'gFCiargAo9SbNcJSeCOU', price: '311'));
        },
        child: Icon(Icons.add),
      ),
      body: _body(context),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: Center(
        child: Text(
          "Hizmetlerim",
          style: GoogleFonts.roboto(
              fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
        ),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: false,
    );
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return _jobsStore.loadingMyService
          ? loadingWidget()
          : _jobsStore.jobs.isEmpty
              ? emptyWidget()
              : buildListWidget();
    });
  }

  Container buildListWidget() {
    return Container(
      child: ListView.builder(
        itemCount: _jobsStore.jobs.length,
        itemBuilder: ((context, index) {
          Jobs job = _jobsStore.jobs[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 28,
                  backgroundImage: NetworkImage('${job.image}'),
                ),
                title: Text("${job.name}"),
                subtitle: Text("${job.description}\n${job.price} TL"),
                //trailing: IconButton(icon: Icon(Icons.arrow_forward), onPressed: () {}),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => JobPage(job: job),
                )),
              ),
            ),
          );
        }),
      ),
    );
  }

  Center emptyWidget() {
    return Center(
      child: Text("empty"),
    );
  }

  Center loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

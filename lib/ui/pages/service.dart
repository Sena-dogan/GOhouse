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

class Service extends StatefulWidget {
  const Service({super.key});

  @override
  State<Service> createState() => _ServiceState();
}

class _ServiceState extends State<Service> {
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
    _jobsStore.getJobs();
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
      title: Text(
        "Hizmet Ekle",
        style: GoogleFonts.roboto(
            fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
      ),
      elevation: 2.0,
      automaticallyImplyLeading: false,
    );
  }

  Widget _body(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return _jobsStore.loading
          ? LoadingWidget()
          : _jobsStore.jobs.isEmpty
              ? emptyWidget()
              : BuildListWidget();
    });
  }

  Container BuildListWidget() {
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
                subtitle: Text("${job.description}\n${job.price} tl"),
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

  Center LoadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  
Widget emptyWidget() {
  return Center(
    child: Text("Henüz bir hizmet eklenmemiş"));
}
  
}

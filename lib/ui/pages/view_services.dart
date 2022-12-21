import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gohouse/constants/assets.dart';
import 'package:gohouse/models/jobs.dart';
import 'package:gohouse/stores/jobs/jobs_store.dart';
import 'package:gohouse/ui/pages/job_page.dart';
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
      automaticallyImplyLeading: true,
      centerTitle: true,
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
      color: Colors.grey[100],
      child: ListView.builder(
        itemCount: _jobsStore.jobs.length,
        itemBuilder: ((context, index) {
          Jobs job = _jobsStore.jobs.reversed.toList()[index];
          return Padding(
            padding: const EdgeInsets.all(3.0),
            child: Card(
              child: ListTile(
                minVerticalPadding: 12,
                leading: Image.network(
                  '${job.image}',
                  height: 300,
                  width: 130,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                        Assets.noImage,);
                  },
                ),
                title: Text("${job.name}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${job.description}"),
                    Text(
                      "${job.price} ₺",
                      style: GoogleFonts.roboto(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
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
    return Center(child: Text("Henüz bir hizmet eklenmemiş"));
  }
}

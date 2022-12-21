import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:gohouse/constants/assets.dart';
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
    //Size size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return _jobsStore.loadingMyService
          ? loadingWidget()
          : _jobsStore.jobs.isEmpty
              ? emptyWidget()
              : _buildListWidget();
    });
  }

  Container _buildListWidget() {
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
                  width: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.network(
                      Assets.noImage,
                    );
                  },
                ),
                title: Text("${job.name}"),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${job.description}..",
                      maxLines: 4,
                    ),
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

  Center emptyWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network('https://i.pinimg.com/originals/c6/c6/2e/c6c62e7db88003635b5c0afdea2d66ed.jpg'),
          Text('Verilmiş ilan bulunamadı.', style: GoogleFonts.roboto(),),
          SizedBox(height: 7,),
          GestureDetector(
              onTap: () =>
                  Application.router.navigateTo(context, Routes.servePage, transition: TransitionType.fadeIn),
              child: Text(
                  "İlan vermek için tıklayınız", style: GoogleFonts.roboto(fontWeight: FontWeight.bold),)),
        ],
      ),
    );
  }

  Center loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}

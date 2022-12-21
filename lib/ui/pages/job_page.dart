import 'package:flutter/material.dart';
import 'package:gohouse/constants/app_theme.dart';
import 'package:gohouse/models/jobs.dart';
import 'package:google_fonts/google_fonts.dart';

class JobPage extends StatelessWidget {
  JobPage({super.key, required this.job});
  final Jobs job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(job),
      body: _buildBody(context, job),
    );
  }
}

PreferredSizeWidget _buildAppBar(Jobs job) {
  return AppBar(
    title: Text(
      "${job.name}",
      style: GoogleFonts.roboto(
          fontSize: 23, color: AppThemeData.lightThemeData.primaryColor),
    ),
    elevation: 2.0,
    automaticallyImplyLeading: true,
  );
}

Widget _buildBody(BuildContext context, Jobs job) {
  return Material(
    child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Container(
            decoration: BoxDecoration(
              // border: Border.all(),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                job.image.toString(),
                height: 220,
                width: 380,
                errorBuilder: (context, error, stackTrace) {
                  return Image.network(
                    'https://i.ytimg.com/vi/lcwmDAYt22k/maxresdefault.jpg',
                    height: 220,
                    width: 380,
                  );
                },
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 30.0),
              child: Container(
                child: Text(
                  "kategori:  ${job.category}",
                  style: GoogleFonts.roboto(
                    fontSize: 22,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.006),
          Divider(color: Colors.black45, thickness: 1.0, indent: 130.0),
          SizedBox(height: MediaQuery.of(context).size.height * 0.06),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 18.0),
              child: Text(
                "₺${job.price}",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color.fromARGB(175, 175, 0, 206),
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.006),
          Divider(
            color: Colors.black45,
            thickness: 1.0,
            endIndent: 250.0,
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 18.0),
              child: Text(
                "${job.name}",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 18.0),
              child: Text(
                "${job.description}",
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 18.0),
              child: Text(
                "Ilan sahibi: ${job.user}",
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.black,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

class Endpoints {
  Endpoints._();

  // base url
  static const String baseUrl =
      "https://us-central1-gohouse-7cc06.cloudfunctions.net";

  // receiveTimeout
  static const int receiveTimeout = 15000;

  // connectTimeout
  static const int connectionTimeout = 30000;

  // booking endpoints
  static const String getPosts = baseUrl + "/posts";
  static const String getJobList = baseUrl + "/jobs";
  static const String postJobList = baseUrl + "/jobs";
  static String deleteJob = baseUrl + "/jobs/remove";
  static String editJob = baseUrl + "/jobs/update";
  static String getJobByUser = baseUrl + "/jobs/user";
  static String getUserById = baseUrl + "/user/get";
  static String updateUser = baseUrl + "/user/update";
}

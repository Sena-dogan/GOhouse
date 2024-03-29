import 'dart:async';

import 'package:gohouse/data/local/datasources/post/post_datasource.dart';
import 'package:gohouse/data/sharedpref/shared_preference_helper.dart';
import 'package:gohouse/models/jobs.dart';
import 'package:gohouse/models/user.dart';
import 'network/apis/posts/post_api.dart';

class Repository {
  // data source object
  // ignore: unused_field
  final PostDataSource _postDataSource;

  // api objects
  final PostApi _postApi;

  // shared pref object
  final SharedPreferenceHelper _sharedPrefsHelper;

  // constructor
  Repository(this._postApi, this._sharedPrefsHelper, this._postDataSource);

  // // Post: ---------------------------------------------------------------------
  // Future<PostList> getPosts() async {
  //   // check to see if posts are present in database, then fetch from database
  //   // else make a network call to get all posts, store them into database for
  //   // later use
  //   return await _postApi.getPosts().then((postsList) {
  //     postsList.posts?.forEach((post) {
  //       _postDataSource.insert(post);
  //     });

  //     return postsList;
  //   }).catchError((error) => throw error);
  // }

  Future<JobListResponse> getJobs() async {
    return await _postApi.getJobs().then((jobsList) {
      return jobsList;
    }).catchError((error) => throw error);
  }

  Future<JobCreateResponse> createJobs(JobCreateRequest request) async {
    return await _postApi.createJob(request).then((jobsList) {
      return jobsList;
    }).catchError((error) => throw error);
  }

  // delete job by id
  Future<JobDeleteResponse> deleteJobById(JobDeleteRequest id) async {
    return await _postApi.deleteJob(id).then((jobsList) {
      return jobsList;
    }).catchError((error) => throw error);
  }

  // edit job by id
  Future<JobEditResponse> editJobById(JobEditRequest id) async {
    // check if post is present in database, then update it
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.editJob(id).then((jobsList) {
      return jobsList;
    }).catchError((error) => throw error);
  }

  // get job by user id
  Future<JobListResponse> getJobByUserId(JobGetByUserRequest id) async {
    // check if post is present in database, then update it
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.getJobByUser(id).then((jobsList) {
      return jobsList;
    }).catchError((error) => throw error);
  }

  // get user by id
  Future<UserData> getUserById(GetUserRequest id) async {
    // check if post is present in database, then update it
    // else make a network call to get all posts, store them into database for
    // later use
    return await _postApi.getUserByID(id).then((user) {
      return user;
    }).catchError((error) => throw error);
  }

  // edit user by id
  Future<EditUserResponse> editUserById(EditUserRequest id) async {
    return await _postApi.editUserByID(id).then((user) {
      return user;
    }).catchError((error) => throw error);
  }

  // // update user by id
  // Future updateUserById(UpdateUserRequest id) async {
  //   // check if post is present in database, then update it
  //   // else make a network call to get all posts, store them into database for
  //   // later use
  //   return await _postApi.updateUserByID(id).then((user) {
  //     return user;
  //   }).catchError((error) => throw error);
  // }

  // Future<List<Post>> findPostById(int id) {
  //   //creating filter
  //   List<Filter> filters = [];

  //   //check to see if dataLogsType is not null
  //   Filter dataLogTypeFilter = Filter.equals(DBConstants.FIELD_ID, id);
  //   filters.add(dataLogTypeFilter);

  //   //making db call
  //   return _postDataSource
  //       .getAllSortedByFilter(filters: filters)
  //       .then((posts) => posts)
  //       .catchError((error) => throw error);
  // }

  // Future<int> insert(Post post) => _postDataSource
  //     .insert(post)
  //     .then((id) => id)
  //     .catchError((error) => throw error);

  // Future<int> update(Post post) => _postDataSource
  //     .update(post)
  //     .then((id) => id)
  //     .catchError((error) => throw error);

  // Future<int> delete(Post post) => _postDataSource
  //     .update(post)
  //     .then((id) => id)
  //     .catchError((error) => throw error);

  // Login:---------------------------------------------------------------------
  Future<bool> login(String email, String password) async {
    return await Future.delayed(Duration(seconds: 2), () => true);
  }

  Future<void> saveIsLoggedIn(bool value) =>
      _sharedPrefsHelper.saveIsLoggedIn(value);

  Future<bool> get isLoggedIn => _sharedPrefsHelper.isLoggedIn;

  // Theme: --------------------------------------------------------------------
  Future<void> changeBrightnessToDark(bool value) =>
      _sharedPrefsHelper.changeBrightnessToDark(value);

  bool get isDarkMode => _sharedPrefsHelper.isDarkMode;

  // Language: -----------------------------------------------------------------
  Future<void> changeLanguage(String value) =>
      _sharedPrefsHelper.changeLanguage(value);

  String? get currentLanguage => _sharedPrefsHelper.currentLanguage;
}

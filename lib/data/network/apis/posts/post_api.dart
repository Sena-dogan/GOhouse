import 'dart:async';

import 'package:gohouse/data/network/constants/endpoints.dart';
import 'package:gohouse/data/network/dio_client.dart';
import 'package:gohouse/data/network/rest_client.dart';
import 'package:gohouse/models/jobs.dart';
import 'package:gohouse/models/post/post_list.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  PostApi(this._dioClient, this._restClient);

  // /// Returns list of post in response
  // Future<PostList> getPosts() async {
  //   try {
  //     final res = await _dioClient.get(Endpoints.getPosts);
  //     return PostList.fromJson(res);
  //   } catch (e) {
  //     print(e.toString());
  //     throw e;
  //   }
  // }

  Future<JobListResponse> getJobs() async {
    try {
      final res = await _dioClient.get(Endpoints.getJobList);
      return JobListResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  Future<JobCreateResponse> createJob(JobCreateRequest reques) async {
    try {
      final res =
          await _dioClient.post(Endpoints.postJobList, data: reques.toJson());
      return JobCreateResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  // delete job
  Future<JobDeleteResponse> deleteJob(JobDeleteRequest id) async {
    try {
      final res =
          await _dioClient.delete(Endpoints.deleteJob, data: id.toJson());
      print('Delete = ${res.toString()}');
      return JobDeleteResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  // Edit job
  Future<JobEditResponse> editJob(JobEditRequest id) async {
    try {
      final res = await _dioClient.put(Endpoints.editJob, data: id.toJson());
      print('Edit = ${res.toString()}');
      return JobEditResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  // Future<JobListResponse> getJobs() async {
  //   try {
  //     final res = await _dioClient.get(Endpoints.getJobList);
  //     return JobListResponse.fromJson(res);
  //   } catch (e) {
  //     print(e.toString());
  //     throw e;
  //   }
  // }
  // get job by user 
  Future<JobListResponse> getJobByUser(JobGetByUserRequest id) async {
    try {
      final res = await _dioClient.post(Endpoints.getJobByUser, data: id.toJson());
      return JobListResponse.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }

}


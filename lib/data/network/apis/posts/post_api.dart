import 'dart:async';

import 'package:gohouse/data/network/constants/endpoints.dart';
import 'package:gohouse/data/network/dio_client.dart';
import 'package:gohouse/data/network/rest_client.dart';
import 'package:gohouse/models/post/post_list.dart';

class PostApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  PostApi(this._dioClient, this._restClient);

  /// Returns list of post in response
  Future<PostList> getPosts() async {
    try {
      final res = await _dioClient.get(Endpoints.getPosts);
      return PostList.fromJson(res);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

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
      final res = await _dioClient.post(Endpoints.postJobList, data: reques.toJson());
      return JobCreateResponse.fromJson(res);
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

class JobCreateResponse {
  String? id;

  JobCreateResponse({this.id});

  JobCreateResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class JobListResponse {
  List<Jobs>? jobs;

  JobListResponse({this.jobs});

  JobListResponse.fromJson(Map<String, dynamic> json) {
    if (json['list'] != null) {
      jobs = <Jobs>[];
      json['list'].forEach((v) {
        jobs!.add(new Jobs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobs != null) {
      data['list'] = this.jobs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobs {
  String? price;
  String? id;
  String? image;
  String? user;
  String? name;
  String? category;
  CreatedAt? createdAt;
  String? description;

  Jobs(
      {this.price,
      this.id,
      this.image,
      this.user,
      this.name,
      this.category,
      this.createdAt,
      this.description});

  Jobs.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    id = json['id'];
    image = json['image'];
    user = json['user'];
    name = json['name'];
    category = json['category'];
    createdAt = json['createdAt'] != null
        ? new CreatedAt.fromJson(json['createdAt'])
        : null;
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['id'] = this.id;
    data['image'] = this.image;
    data['user'] = this.user;
    data['name'] = this.name;
    data['category'] = this.category;
    if (this.createdAt != null) {
      data['createdAt'] = this.createdAt!.toJson();
    }
    data['description'] = this.description;
    return data;
  }
}

class CreatedAt {
  int? iSeconds;
  int? iNanoseconds;

  CreatedAt({this.iSeconds, this.iNanoseconds});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    iSeconds = json['_seconds'];
    iNanoseconds = json['_nanoseconds'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_seconds'] = this.iSeconds;
    data['_nanoseconds'] = this.iNanoseconds;
    return data;
  }
}

class JobCreateRequest {
  String? description;
  String? image;
  String? name;
  String? user;
  String? category;
  String? price;

  JobCreateRequest(
      {this.description,
      this.image,
      this.name,
      this.user,
      this.category,
      this.price});

  JobCreateRequest.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    image = json['image'];
    name = json['name'];
    user = json['user'];
    category = json['category'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['image'] = this.image;
    data['name'] = this.name;
    data['user'] = this.user;
    data['category'] = this.category;
    data['price'] = this.price;
    return data;
  }
}

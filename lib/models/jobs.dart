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



class CreatedAt {
  String? date;
  int? timezoneType;
  String? timezone;

  CreatedAt({this.date, this.timezoneType, this.timezone});

  CreatedAt.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timezone_type'] = this.timezoneType;
    data['timezone'] = this.timezone;
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

class JobDeleteRequest {
  String? id;

  JobDeleteRequest({this.id});

  JobDeleteRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class JobDeleteResponse {
  bool? success;

  JobDeleteResponse({this.success});

  JobDeleteResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}

class JobEditResponse {
  bool? success;

  JobEditResponse({this.success});

  JobEditResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    return data;
  }
}

class JobEditRequest {
  String? id;
  String? image;
  String? price;
  String? name;
  String? description;
  String? category;
  String? user;

  JobEditRequest(
      {this.image,
      this.id,
      this.price,
      this.name,
      this.description,
      this.category,
      this.user});

  JobEditRequest.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = image!.isEmpty ?? json['image'];
    price = json['price'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    // convert only non null values
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (image != null) data['image'] = this.image;
    if (price != null) data['price'] = this.price;
    if (name != null) data['name'] = this.name;
    if (description != null) data['description'] = this.description;
    if (category != null) data['category'] = this.category;
    if (user != null) data['user'] = this.user;
    return data;
  }
}

class JobGetByUserRequest {
  String? user;

  JobGetByUserRequest({this.user});

  JobGetByUserRequest.fromJson(Map<String, dynamic> json) {
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    return data;
  }
}
import 'package:json_annotation/json_annotation.dart';
part 'EmployeesModel.g.dart';
@JsonSerializable()
class EmloyeesModel {
  Meta mMeta;
  List<Employee> employee;

  EmloyeesModel({this.mMeta, this.employee});

  EmloyeesModel.fromJson(Map<String, dynamic> json) {
    mMeta = json['_meta'] != null ? new Meta.fromJson(json['_meta']) : null;
    if (json['result'] != null) {
      employee = new List<Employee>();
      json['result'].forEach((v) {
        employee.add(new Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.mMeta != null) {
      data['_meta'] = this.mMeta.toJson();
    }
    if (this.employee != null) {
      data['result'] = this.employee.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

@JsonSerializable()
class Meta {
  bool success;
  int code;
  String message;
  int totalCount;
  int pageCount;
  int currentPage;
  int perPage;
  RateLimit rateLimit;

  Meta(
      {this.success,
        this.code,
        this.message,
        this.totalCount,
        this.pageCount,
        this.currentPage,
        this.perPage,
        this.rateLimit});

  Meta.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    message = json['message'];
    totalCount = json['totalCount'];
    pageCount = json['pageCount'];
    currentPage = json['currentPage'];
    perPage = json['perPage'];
    rateLimit = json['rateLimit'] != null
        ? new RateLimit.fromJson(json['rateLimit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['code'] = this.code;
    data['message'] = this.message;
    data['totalCount'] = this.totalCount;
    data['pageCount'] = this.pageCount;
    data['currentPage'] = this.currentPage;
    data['perPage'] = this.perPage;
    if (this.rateLimit != null) {
      data['rateLimit'] = this.rateLimit.toJson();
    }
    return data;
  }
}

@JsonSerializable()
class RateLimit {
  int limit;
  int remaining;
  int reset;

  RateLimit({this.limit, this.remaining, this.reset});

  RateLimit.fromJson(Map<String, dynamic> json) {
    limit = json['limit'];
    remaining = json['remaining'];
    reset = json['reset'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['limit'] = this.limit;
    data['remaining'] = this.remaining;
    data['reset'] = this.reset;
    return data;
  }
}
@JsonSerializable()
class Employee {
  String id;
  String firstName;
  String lastName;
  String gender;
  String dob;
  String email;
  String phone;
  String website;
  String address;
  String status;
  Links lLinks;

  Employee(
      {this.id,
        this.firstName,
        this.lastName,
        this.gender,
        this.dob,
        this.email,
        this.phone,
        this.website,
        this.address,
        this.status,
        this.lLinks});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    dob = json['dob'];
    email = json['email'];
    phone = json['phone'];
    website = json['website'];
    address = json['address'];
    status = json['status'];
    lLinks = json['_links'] != null ? new Links.fromJson(json['_links']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['website'] = this.website;
    data['address'] = this.address;
    data['status'] = this.status;
    if (this.lLinks != null) {
      data['_links'] = this.lLinks.toJson();
    }
    return data;
  }
  Map<String, dynamic> toMapForDb() {
    var map = Map<String, dynamic>();
    map['id'] = id;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['gender'] = gender;
    map['dob'] = dob;
    map['email'] = email;
    map['phone'] = phone;
    map['website'] = website;
    map['address'] = address;
    map['status'] = status;
    return map;
  }
}

class Links {
  Self self;
  Self edit;
  Self avatar;

  Links({this.self, this.edit, this.avatar});

  Links.fromJson(Map<String, dynamic> json) {
    self = json['self'] != null ? new Self.fromJson(json['self']) : null;
    edit = json['edit'] != null ? new Self.fromJson(json['edit']) : null;
    avatar = json['avatar'] != null ? new Self.fromJson(json['avatar']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.self != null) {
      data['self'] = this.self.toJson();
    }
    if (this.edit != null) {
      data['edit'] = this.edit.toJson();
    }
    if (this.avatar != null) {
      data['avatar'] = this.avatar.toJson();
    }
    return data;
  }
}

class Self {
  String href;

  Self({this.href});

  Self.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}
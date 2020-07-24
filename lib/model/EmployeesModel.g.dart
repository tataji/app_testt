// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EmployeesModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EmloyeesModel _$EmloyeesModelFromJson(Map<String, dynamic> json) {
  return EmloyeesModel(
    mMeta: json['mMeta'] == null
        ? null
        : Meta.fromJson(json['mMeta'] as Map<String, dynamic>),
    employee: (json['result'] as List)
        ?.map((e) =>
            e == null ? null : Employee.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$EmloyeesModelToJson(EmloyeesModel instance) =>
    <String, dynamic>{
      'mMeta': instance.mMeta,
      'result': instance.employee,
    };

Meta _$MetaFromJson(Map<String, dynamic> json) {
  return Meta(
    success: json['success'] as bool,
    code: json['code'] as int,
    message: json['message'] as String,
    totalCount: json['totalCount'] as int,
    pageCount: json['pageCount'] as int,
    currentPage: json['currentPage'] as int,
    perPage: json['perPage'] as int,
    rateLimit: json['rateLimit'] == null
        ? null
        : RateLimit.fromJson(json['rateLimit'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
      'success': instance.success,
      'code': instance.code,
      'message': instance.message,
      'totalCount': instance.totalCount,
      'pageCount': instance.pageCount,
      'currentPage': instance.currentPage,
      'perPage': instance.perPage,
      'rateLimit': instance.rateLimit,
    };

RateLimit _$RateLimitFromJson(Map<String, dynamic> json) {
  return RateLimit(
    limit: json['limit'] as int,
    remaining: json['remaining'] as int,
    reset: json['reset'] as int,
  );
}

Map<String, dynamic> _$RateLimitToJson(RateLimit instance) => <String, dynamic>{
      'limit': instance.limit,
      'remaining': instance.remaining,
      'reset': instance.reset,
    };

Employee _$ResultFromJson(Map<String, dynamic> json) {
  return Employee(
    id: json['id'] as String,
    firstName: json['firstName'] as String,
    lastName: json['lastName'] as String,
    gender: json['gender'] as String,
    dob: json['dob'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    website: json['website'] as String,
    address: json['address'] as String,
    status: json['status'] as String,
    lLinks: json['lLinks'] == null
        ? null
        : Links.fromJson(json['lLinks'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ResultToJson(Employee instance) => <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'gender': instance.gender,
      'dob': instance.dob,
      'email': instance.email,
      'phone': instance.phone,
      'website': instance.website,
      'address': instance.address,
      'status': instance.status,
      'lLinks': instance.lLinks,
    };

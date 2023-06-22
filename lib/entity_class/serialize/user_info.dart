// import 'dart:convert';

import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo extends Object {
  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'deptId')
  int deptId;

  @JsonKey(name: 'loginName')
  String loginName;

  @JsonKey(name: 'userName')
  String userName;

  @JsonKey(name: 'userType')
  String userType;

  @JsonKey(name: 'email')
  String email;

  @JsonKey(name: 'phonenumber')
  String phonenumber;

  @JsonKey(name: 'sex')
  String sex;

  @JsonKey(name: 'avatar')
  String avatar;

  @JsonKey(name: 'password')
  String password;

  @JsonKey(name: 'salt')
  String salt;

  @JsonKey(name: 'status')
  String status;

  @JsonKey(name: 'delFlag')
  String delFlag;

  @JsonKey(name: 'loginIp')
  String loginIp;

  @JsonKey(name: 'loginDate')
  // List<String> loginDate; 改
  List<int> loginDate;
  // String loginDate;

  @JsonKey(name: 'createBy')
  String createBy;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'updateBy')
  String updateBy;

  @JsonKey(name: 'updateTime')
  String updateTime;

  @JsonKey(name: 'remark')
  String remark;

  @JsonKey(name: 'openId')
  String openId;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'country')
  String country;

  @JsonKey(name: 'province')
  String province;

  @JsonKey(name: 'headimgUrl')
  String headimgUrl;

  @JsonKey(name: 'unionId')
  String unionId;

  @JsonKey(name: 'loginnum')
  int loginnum;

  @JsonKey(name: 'userpost')
  String userpost;

  @JsonKey(name: 'businesscity')
  String businesscity;

  @JsonKey(name: 'businessprovince')
  String businessprovince;

  @JsonKey(name: 'organize')
  String organize;

  @JsonKey(name: 'isnotcie')
  int isnotcie;

  @JsonKey(name: 'subusername')
  String subusername;

  @JsonKey(name: 'deptType')
  String deptType;

  @JsonKey(name: 'deptTypeName')
  String deptTypeName;

  @JsonKey(name: 'deptStatus')
  String deptStatus;

  @JsonKey(name: 'usenum')
  String usenum;

  @JsonKey(name: 'expireDate')
  String expireDate;

  @JsonKey(name: 'aicLicense')
  int aicLicense;

  @JsonKey(name: 'aicBalance')
  int aicBalance;

  @JsonKey(name: 'payType')
  String payType;

  @JsonKey(name: 'recommenderName')
  String recommenderName;

  @JsonKey(name: 'recommenderPhone')
  String recommenderPhone;

  @JsonKey(name: 'addeffectTime')
  int addeffectTime;

  @JsonKey(name: 'agencyPolicy')
  String agencyPolicy;

  @JsonKey(name: 'violation')
  int violation;

  @JsonKey(name: 'voice')
  int voice;

  @JsonKey(name: 'myCustomer')
  int myCustomer;

  @JsonKey(name: 'customerView')
  int customerView;

  @JsonKey(name: 'phone')
  int phone;

  @JsonKey(name: 'infoModify')
  int infoModify;

  @JsonKey(name: 'edit')
  int edit;

  @JsonKey(name: 'downloadFlag')
  int downloadFlag;

  @JsonKey(name: 'aiFlag')
  int aiFlag;

  @JsonKey(name: 'addCustomer')
  int addCustomer;

  @JsonKey(name: 'picUpload')
  int picUpload;

  @JsonKey(name: 'excel')
  int excel;

  @JsonKey(name: 'fclass')
  int fclass;

  @JsonKey(name: 'fclassFree')
  int fclassFree;

  @JsonKey(name: 'agentFlag')
  int agentFlag;

  @JsonKey(name: 'myGroup')
  int myGroup;

  @JsonKey(name: 'subInfoModify')
  int subInfoModify;

  @JsonKey(name: 'subPhone')
  int subPhone;

  @JsonKey(name: 'subEdit')
  int subEdit;

  @JsonKey(name: 'subDownload')
  int subDownload;

  @JsonKey(name: 'freeMaterials')
  int freeMaterials;

  @JsonKey(name: 'phoneNumbers')
  int phoneNumbers;

  @JsonKey(name: 'assistAccount')
  int assistAccount;

  @JsonKey(name: 'analysis')
  int analysis;

  @JsonKey(name: 'message')
  int message;

  @JsonKey(name: 'submitCount')
  String submitCount;

  @JsonKey(name: 'ocrErrorCount')
  String ocrErrorCount;

  @JsonKey(name: 'plateErrorCount')
  String plateErrorCount;

  @JsonKey(name: 'repeatCount')
  String repeatCount;

  @JsonKey(name: 'queueCount')
  String queueCount;

  @JsonKey(name: 'passCount')
  String passCount;

  @JsonKey(name: 'matchCount')
  String matchCount;

  @JsonKey(name: 'matchRate')
  String matchRate;

  @JsonKey(name: 'submitCountYe')
  String submitCountYe;

  @JsonKey(name: 'ocrErrorCountYe')
  String ocrErrorCountYe;

  @JsonKey(name: 'plateErrorCountYe')
  String plateErrorCountYe;

  @JsonKey(name: 'repeatCountYe')
  String repeatCountYe;

  @JsonKey(name: 'queueCountYe')
  String queueCountYe;

  @JsonKey(name: 'passCountYe')
  String passCountYe;

  @JsonKey(name: 'matchCountYe')
  String matchCountYe;

  @JsonKey(name: 'matchRateYe')
  String matchRateYe;

  @JsonKey(name: 'headimg')
  String headimg;

  @JsonKey(name: 'recentDay')
  String recentDay;

  @JsonKey(name: 'expire')
  int expire;

  @JsonKey(name: 'record')
  Record record;

  UserInfo(
    this.userId,
    this.deptId,
    this.loginName,
    this.userName,
    this.userType,
    this.email,
    this.phonenumber,
    this.sex,
    this.avatar,
    this.password,
    this.salt,
    this.status,
    this.delFlag,
    this.loginIp,
    this.loginDate,
    this.createBy,
    this.createTime,
    this.updateBy,
    this.updateTime,
    this.remark,
    this.openId,
    this.city,
    this.country,
    this.province,
    this.headimgUrl,
    this.unionId,
    this.loginnum,
    this.userpost,
    this.businesscity,
    this.businessprovince,
    this.organize,
    this.isnotcie,
    this.subusername,
    this.deptType,
    this.deptTypeName,
    this.deptStatus,
    this.usenum,
    this.expireDate,
    this.aicLicense,
    this.aicBalance,
    this.payType,
    this.recommenderName,
    this.recommenderPhone,
    this.addeffectTime,
    this.agencyPolicy,
    this.violation,
    this.voice,
    this.myCustomer,
    this.customerView,
    this.phone,
    this.infoModify,
    this.edit,
    this.downloadFlag,
    this.aiFlag,
    this.addCustomer,
    this.picUpload,
    this.excel,
    this.fclass,
    this.fclassFree,
    this.agentFlag,
    this.myGroup,
    this.subInfoModify,
    this.subPhone,
    this.subEdit,
    this.subDownload,
    this.freeMaterials,
    this.phoneNumbers,
    this.assistAccount,
    this.analysis,
    this.message,
    this.submitCount,
    this.ocrErrorCount,
    this.plateErrorCount,
    this.repeatCount,
    this.queueCount,
    this.passCount,
    this.matchCount,
    this.matchRate,
    this.submitCountYe,
    this.ocrErrorCountYe,
    this.plateErrorCountYe,
    this.repeatCountYe,
    this.queueCountYe,
    this.passCountYe,
    this.matchCountYe,
    this.matchRateYe,
    this.headimg,
    this.recentDay,
    this.expire,
    this.record,
  );

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

@JsonSerializable()
class Record extends Object {
  @JsonKey(name: 'userId')
  int userId;

  @JsonKey(name: 'submitCount')
  int submitCount;

  @JsonKey(name: 'ocrErrorCount')
  String ocrErrorCount;

  @JsonKey(name: 'plateErrorCount')
  String plateErrorCount;

  @JsonKey(name: 'repeatCount')
  String repeatCount;

  @JsonKey(name: 'queueCount')
  String queueCount;

  @JsonKey(name: 'passCount')
  String passCount;

  @JsonKey(name: 'matchCount')
  String matchCount;

  @JsonKey(name: 'matchRate')
  String matchRate;

  @JsonKey(name: 'submitCountYe')
  String submitCountYe;

  @JsonKey(name: 'ocrErrorCountYe')
  String ocrErrorCountYe;

  @JsonKey(name: 'plateErrorCountYe')
  String plateErrorCountYe;

  @JsonKey(name: 'repeatCountYe')
  String repeatCountYe;

  @JsonKey(name: 'queueCountYe')
  String queueCountYe;

  @JsonKey(name: 'passCountYe')
  String passCountYe;

  @JsonKey(name: 'matchCountYe')
  String matchCountYe;

  @JsonKey(name: 'matchRateYe')
  String matchRateYe;

  @JsonKey(name: 'recentDay')
  String recentDay;

  @JsonKey(name: 'createTime')
  String createTime;

  @JsonKey(name: 'updateTime')
  String updateTime;

  Record(
    this.userId,
    this.submitCount,
    this.ocrErrorCount,
    this.plateErrorCount,
    this.repeatCount,
    this.queueCount,
    this.passCount,
    this.matchCount,
    this.matchRate,
    this.submitCountYe,
    this.ocrErrorCountYe,
    this.plateErrorCountYe,
    this.repeatCountYe,
    this.queueCountYe,
    this.passCountYe,
    this.matchCountYe,
    this.matchRateYe,
    this.recentDay,
    this.createTime,
    this.updateTime,
  );

  factory Record.fromJson(Map<String, dynamic> srcJson) =>
      _$RecordFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecordToJson(this);
}

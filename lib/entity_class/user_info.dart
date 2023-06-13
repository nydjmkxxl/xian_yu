import 'package:json_annotation/json_annotation.dart';

part 'user_info.g.dart';

@JsonSerializable()
class UserInfo extends Object {
  @JsonKey(name: 'msg')
  String msg;

  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'data')
  Data data;

  UserInfo(
    this.msg,
    this.code,
    this.data,
  );

  factory UserInfo.fromJson(Map<String, dynamic> srcJson) =>
      _$UserInfoFromJson(srcJson);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);
}

@JsonSerializable()
class Data extends Object {
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
  List<int> loginDate;

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

  @JsonKey(name: 'headimgUrl')
  String headimgUrl;

  @JsonKey(name: 'loginnum')
  int loginnum;

  @JsonKey(name: 'businesscity')
  String businesscity;

  @JsonKey(name: 'businessprovince')
  String businessprovince;

  @JsonKey(name: 'isnotcie')
  int isnotcie;

  @JsonKey(name: 'subusername')
  String subusername;

  @JsonKey(name: 'expireDate')
  String expireDate;

  @JsonKey(name: 'aicLicense')
  int aicLicense;

  @JsonKey(name: 'aicBalance')
  int aicBalance;

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

  @JsonKey(name: 'headimg')
  String headimg;

  @JsonKey(name: 'expire')
  int expire;

  @JsonKey(name: 'record')
  Record record;

  Data(
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
    this.headimgUrl,
    this.loginnum,
    this.businesscity,
    this.businessprovince,
    this.isnotcie,
    this.subusername,
    this.expireDate,
    this.aicLicense,
    this.aicBalance,
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
    this.headimg,
    this.expire,
    this.record,
  );

  factory Data.fromJson(Map<String, dynamic> srcJson) =>
      _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}

@JsonSerializable()
class Record extends Object {
  @JsonKey(name: 'userId')
  int userId;

  Record(
    this.userId,
  );

  factory Record.fromJson(Map<String, dynamic> srcJson) =>
      _$RecordFromJson(srcJson);

  Map<String, dynamic> toJson() => _$RecordToJson(this);
}

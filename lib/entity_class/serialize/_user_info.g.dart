// GENERATED CODE - DO NOT MODIFY BY HAND
part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

decodeList<T>(data) {
  return data is List
      ? data.cast<T>()
      : json.decode(data).map<T>((e) => e as T).toList();
}

decodeMap(data) {
  return data is Map
      ? data as Map<String, dynamic>
      : json.decode(data) as Map<String, dynamic>;
}

encodeListOrMap<T>(data) {
  return data is T ? json.encode(data) : data;
}

UserInfo _$UserInfoFromJson(Map<String, dynamic> jsonDate) => UserInfo(
      jsonDate['userId'] as int,
      jsonDate['deptId'] as int,
      jsonDate['loginName'] as String,
      jsonDate['userName'] as String,
      jsonDate['userType'] as String,
      jsonDate['email'] as String,
      jsonDate['phonenumber'] as String,
      jsonDate['sex'] as String,
      jsonDate['avatar'] as String,
      jsonDate['password'] as String,
      jsonDate['salt'] as String,
      jsonDate['status'] as String,
      jsonDate['delFlag'] as String,
      jsonDate['loginIp'] as String,
      jsonDate['loginDate'] as List<int>,
      // decodeList<String>(jsonDate['loginDate']), 改
      jsonDate['createBy'] as String,
      jsonDate['createTime'] as String,
      jsonDate['updateBy'] as String,
      jsonDate['updateTime'] as String,
      jsonDate['remark'] as String,
      jsonDate['openId'] as String,
      jsonDate['city'] as String,
      jsonDate['country'] as String,
      jsonDate['province'] as String,
      jsonDate['headimgUrl'] as String,
      jsonDate['unionId'] as String,
      jsonDate['loginnum'] as int,
      jsonDate['userpost'] as String,
      jsonDate['businesscity'] as String,
      jsonDate['businessprovince'] as String,
      jsonDate['organize'] as String,
      jsonDate['isnotcie'] as int,
      jsonDate['subusername'] as String,
      jsonDate['deptType'] as String,
      jsonDate['deptTypeName'] as String,
      jsonDate['deptStatus'] as String,
      jsonDate['usenum'] as String,
      jsonDate['expireDate'] as String,
      jsonDate['aicLicense'] as int,
      jsonDate['aicBalance'] as int,
      jsonDate['payType'] as String,
      jsonDate['recommenderName'] as String,
      jsonDate['recommenderPhone'] as String,
      jsonDate['addeffectTime'] as int,
      jsonDate['agencyPolicy'] as String,
      jsonDate['violation'] as int,
      jsonDate['voice'] as int,
      jsonDate['myCustomer'] as int,
      jsonDate['customerView'] as int,
      jsonDate['phone'] as int,
      jsonDate['infoModify'] as int,
      jsonDate['edit'] as int,
      jsonDate['downloadFlag'] as int,
      jsonDate['aiFlag'] as int,
      jsonDate['addCustomer'] as int,
      jsonDate['picUpload'] as int,
      jsonDate['excel'] as int,
      jsonDate['fclass'] as int,
      jsonDate['fclassFree'] as int,
      jsonDate['agentFlag'] as int,
      jsonDate['myGroup'] as int,
      jsonDate['subInfoModify'] as int,
      jsonDate['subPhone'] as int,
      jsonDate['subEdit'] as int,
      jsonDate['subDownload'] as int,
      jsonDate['freeMaterials'] as int,
      jsonDate['phoneNumbers'] as int,
      jsonDate['assistAccount'] as int,
      jsonDate['analysis'] as int,
      jsonDate['message'] as int,
      jsonDate['submitCount'] as String,
      jsonDate['ocrErrorCount'] as String,
      jsonDate['plateErrorCount'] as String,
      jsonDate['repeatCount'] as String,
      jsonDate['queueCount'] as String,
      jsonDate['passCount'] as String,
      jsonDate['matchCount'] as String,
      jsonDate['matchRate'] as String,
      jsonDate['submitCountYe'] as String,
      jsonDate['ocrErrorCountYe'] as String,
      jsonDate['plateErrorCountYe'] as String,
      jsonDate['repeatCountYe'] as String,
      jsonDate['queueCountYe'] as String,
      jsonDate['passCountYe'] as String,
      jsonDate['matchCountYe'] as String,
      jsonDate['matchRateYe'] as String,
      jsonDate['headimg'] as String,
      jsonDate['recentDay'] as String,
      jsonDate['expire'] as int,
      jsonDate['record'] as Record ,
      // Record.fromJson(decodeMap(jsonDate['record'])), 改
    );

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'userId': instance.userId,
      'deptId': instance.deptId,
      'loginName': instance.loginName,
      'userName': instance.userName,
      'userType': instance.userType,
      'email': instance.email,
      'phonenumber': instance.phonenumber,
      'sex': instance.sex,
      'avatar': instance.avatar,
      'password': instance.password,
      'salt': instance.salt,
      'status': instance.status,
      'delFlag': instance.delFlag,
      'loginIp': instance.loginIp,
      'loginDate': instance.loginDate,
      // 'loginDate': encodeListOrMap(instance.loginDate), 改
      'createBy': instance.createBy,
      'createTime': instance.createTime,
      'updateBy': instance.updateBy,
      'updateTime': instance.updateTime,
      'remark': instance.remark,
      'openId': instance.openId,
      'city': instance.city,
      'country': instance.country,
      'province': instance.province,
      'headimgUrl': instance.headimgUrl,
      'unionId': instance.unionId,
      'loginnum': instance.loginnum,
      'userpost': instance.userpost,
      'businesscity': instance.businesscity,
      'businessprovince': instance.businessprovince,
      'organize': instance.organize,
      'isnotcie': instance.isnotcie,
      'subusername': instance.subusername,
      'deptType': instance.deptType,
      'deptTypeName': instance.deptTypeName,
      'deptStatus': instance.deptStatus,
      'usenum': instance.usenum,
      'expireDate': instance.expireDate,
      'aicLicense': instance.aicLicense,
      'aicBalance': instance.aicBalance,
      'payType': instance.payType,
      'recommenderName': instance.recommenderName,
      'recommenderPhone': instance.recommenderPhone,
      'addeffectTime': instance.addeffectTime,
      'agencyPolicy': instance.agencyPolicy,
      'violation': instance.violation,
      'voice': instance.voice,
      'myCustomer': instance.myCustomer,
      'customerView': instance.customerView,
      'phone': instance.phone,
      'infoModify': instance.infoModify,
      'edit': instance.edit,
      'downloadFlag': instance.downloadFlag,
      'aiFlag': instance.aiFlag,
      'addCustomer': instance.addCustomer,
      'picUpload': instance.picUpload,
      'excel': instance.excel,
      'fclass': instance.fclass,
      'fclassFree': instance.fclassFree,
      'agentFlag': instance.agentFlag,
      'myGroup': instance.myGroup,
      'subInfoModify': instance.subInfoModify,
      'subPhone': instance.subPhone,
      'subEdit': instance.subEdit,
      'subDownload': instance.subDownload,
      'freeMaterials': instance.freeMaterials,
      'phoneNumbers': instance.phoneNumbers,
      'assistAccount': instance.assistAccount,
      'analysis': instance.analysis,
      'message': instance.message,
      'submitCount': instance.submitCount,
      'ocrErrorCount': instance.ocrErrorCount,
      'plateErrorCount': instance.plateErrorCount,
      'repeatCount': instance.repeatCount,
      'queueCount': instance.queueCount,
      'passCount': instance.passCount,
      'matchCount': instance.matchCount,
      'matchRate': instance.matchRate,
      'submitCountYe': instance.submitCountYe,
      'ocrErrorCountYe': instance.ocrErrorCountYe,
      'plateErrorCountYe': instance.plateErrorCountYe,
      'repeatCountYe': instance.repeatCountYe,
      'queueCountYe': instance.queueCountYe,
      'passCountYe': instance.passCountYe,
      'matchCountYe': instance.matchCountYe,
      'matchRateYe': instance.matchRateYe,
      'headimg': instance.headimg,
      'recentDay': instance.recentDay,
      'expire': instance.expire,
      'record': instance.record,
      // 'record': encodeListOrMap<Record>(instance.record), 改
    };

Record _$RecordFromJson(Map<String, dynamic> json) => Record(
      json['userId'] as int,
      json['submitCount'] as int,
      json['ocrErrorCount'] as String,
      json['plateErrorCount'] as String,
      json['repeatCount'] as String,
      json['queueCount'] as String,
      json['passCount'] as String,
      json['matchCount'] as String,
      json['matchRate'] as String,
      json['submitCountYe'] as String,
      json['ocrErrorCountYe'] as String,
      json['plateErrorCountYe'] as String,
      json['repeatCountYe'] as String,
      json['queueCountYe'] as String,
      json['passCountYe'] as String,
      json['matchCountYe'] as String,
      json['matchRateYe'] as String,
      json['recentDay'] as String,
      json['createTime'] as String,
      json['updateTime'] as String,
    );

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'userId': instance.userId,
      'submitCount': instance.submitCount,
      'ocrErrorCount': instance.ocrErrorCount,
      'plateErrorCount': instance.plateErrorCount,
      'repeatCount': instance.repeatCount,
      'queueCount': instance.queueCount,
      'passCount': instance.passCount,
      'matchCount': instance.matchCount,
      'matchRate': instance.matchRate,
      'submitCountYe': instance.submitCountYe,
      'ocrErrorCountYe': instance.ocrErrorCountYe,
      'plateErrorCountYe': instance.plateErrorCountYe,
      'repeatCountYe': instance.repeatCountYe,
      'queueCountYe': instance.queueCountYe,
      'passCountYe': instance.passCountYe,
      'matchCountYe': instance.matchCountYe,
      'matchRateYe': instance.matchRateYe,
      'recentDay': instance.recentDay,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
    };
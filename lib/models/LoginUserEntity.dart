class LoginUserEntity {

  bool status;
  String message;
  Payload payload;
  String token;

  LoginUserEntity(
      { this.status, this.message, this.payload, this.token});

  LoginUserEntity.fromJson(Map<String, dynamic> json) {

    status = json['status'];
    message = json['message'];
    payload =
        json['payload'] != null ? new Payload.fromJson(json['payload']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.payload != null) {
      data['payload'] = this.payload.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Payload {
  bool isSocial;
  bool emailVerified;
  String authToken;
  String role;
  bool otpStatus;
  List<String> inviteId;
  List<String> groupInviteId;
  List<String> friendId;
  List<String> groupId;
  String sId;
  String fullName;
  String userName;
  String email;
  String socialType;
  String password;
  String emailVerifyToken;
  String deviceToken;
  String createDate;
  String createdAt;
  String updatedAt;
  int iV;
  int otp;
  String bannerImage;
  String biography;
  String id;
  String userPhoto;

  Payload(
      {this.isSocial,
        this.emailVerified,
        this.authToken,
        this.role,
        this.otpStatus,
        this.inviteId,
        this.groupInviteId,
        this.friendId,
        this.groupId,
        this.sId,
        this.fullName,
        this.userName,
        this.email,
        this.socialType,
        this.password,
        this.emailVerifyToken,
        this.deviceToken,
        this.createDate,
        this.createdAt,
        this.updatedAt,
        this.iV,
        this.otp,
        this.bannerImage,
        this.biography,
        this.id,
        this.userPhoto});

  Payload.fromJson(Map<String, dynamic> json) {
    isSocial = json['is_social'];
    emailVerified = json['email_verified'];
    authToken = json['authToken'];
    role = json['role'];
    otpStatus = json['otp_status'];
    sId = json['_id'];
    fullName = json['fullName'];
    userName = json['userName'];
    email = json['email'];
    socialType = json['social_type'];
    password = json['password'];
    emailVerifyToken = json['email_verify_token'];
    deviceToken = json['deviceToken'];
    createDate = json['create_date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    otp = json['otp'];
    bannerImage = json['bannerImage'];
    biography = json['biography'];
    id = json['id'];
    userPhoto = json['userPhoto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['is_social'] = this.isSocial;
    data['email_verified'] = this.emailVerified;
    data['authToken'] = this.authToken;
    data['role'] = this.role;
    data['otp_status'] = this.otpStatus;
    data['_id'] = this.sId;
    data['fullName'] = this.fullName;
    data['userName'] = this.userName;
    data['email'] = this.email;
    data['social_type'] = this.socialType;
    data['password'] = this.password;
    data['email_verify_token'] = this.emailVerifyToken;
    data['deviceToken'] = this.deviceToken;
    data['create_date'] = this.createDate;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['otp'] = this.otp;
    data['bannerImage'] = this.bannerImage;
    data['biography'] = this.biography;
    data['id'] = this.id;
    data['userPhoto'] = this.userPhoto;
    return data;
  }
}
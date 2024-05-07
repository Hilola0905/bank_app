class ProfileModel{
  final String userId;
  final String userName;
  final String lastName;
  final String password;
  final String email;
  final String imageUrl;
  final String phoneNumber;
  final String uuid;
  final String fcm;
  final String authUUId;
    ProfileModel({
    required this.lastName,
    required this.imageUrl,
    required this.password,
    required this.email,
    required this.userName,
    required this.phoneNumber,
    required this.uuid,
    required this.fcm,
      required this.authUUId,
      required this.userId
});

    ProfileModel copyWidth({
      String? userName,
      String? lastName,
      String? password,
      String? email,
      String? imageUrl,
      String? phoneNumber,
      String? uuid,
      String? fcm,
      String? authUUId,
      String? userId,
    }){
      return ProfileModel(
          lastName: lastName ?? this.lastName,
          imageUrl: imageUrl ?? this.imageUrl,
          password: password ?? this.password,
          email: email ?? this.email,
          userName: userName ?? this.userName,
          phoneNumber: phoneNumber ?? this.phoneNumber,
          uuid: uuid ?? this.uuid,
        fcm: fcm ?? this.fcm,
        authUUId: authUUId ?? this.authUUId,
        userId: userId ?? this.userId,
      );
    }

    Map<String,dynamic> toJson() => {
     "userName":userName,
     "lastName":lastName,
     "password":password,
     "email":email,
     "imageUrl":imageUrl,
     "phoneNumber":phoneNumber,
     "uuid":uuid,
      "fcm":fcm,
      "authUUId":authUUId,
      "userId":userId
    };
    Map<String,dynamic> toJsonforUpdate() => {
     "userName":userName,
     "lastName":lastName,
     "password":password,
     "email":email,
     "imageUrl":imageUrl,
     "phoneNumber":phoneNumber,
      "fcm":fcm,
      "authUUId":authUUId,
      "userId":userId
    };

    factory ProfileModel.fromJson(Map<String,dynamic> json){
      return ProfileModel(
          lastName: json["lastName"] as String? ?? "",
          imageUrl: json["imageUrl"] as String? ?? "",
          password: json["password"] as String? ?? "",
          email:json["email"] as String? ?? "",
          userName: json["userName"] as String? ?? "",
          phoneNumber: json["phoneNumber"] as String? ?? "",
          uuid: json["uuid"] as String? ?? "",
          fcm: json["fcm"] as String? ?? "",
          authUUId: json["authUUId"] as String? ?? "",
          userId: json["userId"] as String? ?? ""
      );
  }

 static ProfileModel initial() =>
  ProfileModel(
      lastName: "",
      imageUrl: "",
      password: "",
      email: "",
      userName: "",
      phoneNumber: "",
      uuid: "",
      fcm:"",
      authUUId:"",
      userId:""
  );

}
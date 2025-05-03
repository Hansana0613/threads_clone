class UserModel{
  // scheama of users collection
  final String uid;
  final String email;
  final String userName;
  final String bio;
  final String profilePic;
  final List followers;
  final List following;

  // constructor
  UserModel({
    required this.uid,
    required this.email,
    required this.userName,
    required this.bio,
    required this.profilePic,
    required this.followers,
    required this.following,
  });

  //this method will convert the userdata onto a json object

  //when storingthe data in database
  Map<String, dynamic> toJson(){
    return {
      "uid": uid,
      "email": email,
      "userName": userName,
      "bio": bio,
      "profilePic": profilePic,
      "followers": followers,
      "following": following,
    };
  }

  //this method will convert the json object to a user model object
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'],
      email: json['email'],
      userName: json['userName'],
      bio: json['bio'],
      profilePic: json['profilePic'],
      followers: json['followers'],
      following: json['following'],
    );
  }
}
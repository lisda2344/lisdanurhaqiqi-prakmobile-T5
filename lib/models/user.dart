class User {
  final int id;
  final String name;
  final String userName;
  final String email;
  final String? profileImage;
  final String? phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.userName,
    required this.email,
    this.profileImage,
    this.phoneNumber,
  });

  factory User.dummy() {
    return User(
      id: 027,
      name: "Lisda Nurhaqiqi",
      userName: "nurhaqiqi",
      email: "2006200@itg.ac.id",
      profileImage:
          "https://scontent.fbdo7-1.fna.fbcdn.net/v/t39.30808-6/296734437_1213132882562234_5004764338487983175_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=174925&_nc_ohc=0uFb72Ex-OAAX-oPVSL&_nc_ht=scontent.fbdo7-1.fna&oh=00_AfB_VP5uY33X7Qp6oq3-9mHF0iwhmRI4qzVAxz0Yt2Aiog&oe=642C768D",
      phoneNumber: "082116339651",
    );
  }
}

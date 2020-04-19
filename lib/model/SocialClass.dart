class SocialClass {
  String autoBio;
  String bestMoment;
  String dob;
  String dreamUniversity;
  String dreamUniversityCourse;
  String email;
  String facebook;
  String hobbies;
  String id;
  String image;
  String instagram;
  String myDropline;
  String name;
  String nickname;
  String philosophy;
  String phone;
  String twitter;
  String worstMoment;

  SocialClass.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    autoBio = data['autobio'];
    bestMoment = data['best_moment'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    twitter = data['twitter'];
    dob = data['d_o_b'];
    dreamUniversity = data['dream_university'];
    dreamUniversityCourse = data['dream_university_course'];
    hobbies = data['hobbies'];
    myDropline = data['my_dropline'];
    philosophy = data['philosophy'];
    worstMoment = data['worst_moment'];
  }

}
class SocialClass {
  String autobio;
  String bestmoment;
  String d_o_b;
  String dream_university;
  String dream_university_course;
  String email;
  String facebook;
  String hobbies;
  String id;
  String image;
  String instagram;
  String  my_dropline;
  String name;
  String nickname;
  String philosophy;
  String phone;
  String twitter;
  String worst_moment;

  SocialClass.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    autobio = data['autobio'];
    bestmoment = data['best_moment'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    nickname = data['nickname'];
    phone = data['phone'];
    twitter = data['twitter'];
    d_o_b = data['d_o_b'];
    dream_university = data['dream_university'];
    dream_university_course = data['dream_university_course'];
    hobbies = data['hobbies'];
    my_dropline = data['my_dropline'];
    philosophy = data['philosophy'];
    worst_moment = data['worst_moment'];
  }

}
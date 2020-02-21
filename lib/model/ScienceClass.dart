
class ScienceClass {
  String autobio;
  String bestmoment;
  String email;
  String facebook;
  String id;
  String image;
  String instagram;
  String name;
  String nickname;
  String phone;
  String twitter;

  ScienceClass.fromMap(Map<String, dynamic> data) {
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
  }

}
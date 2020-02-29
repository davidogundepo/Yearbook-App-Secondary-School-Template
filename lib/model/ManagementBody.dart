class ManagementBody {
  String autobio;
  String staff_position;
  String qualification;
  String year_of_inception;
  String email;
  String facebook;
  String id;
  String image;
  String instagram;
  String name;
  String phone;
  String twitter;

  ManagementBody.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    autobio = data['autobio'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    phone = data['phone'];
    twitter = data['twitter'];
    staff_position = data['staff_position'];
    qualification = data['qualification'];
    year_of_inception = data['year_of_inception'];
  }

}
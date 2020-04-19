class ManagementBody {
  String autoBio;
  String staffPosition;
  String qualification;
  String yearOfInception;
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
    autoBio = data['autobio'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    phone = data['phone'];
    twitter = data['twitter'];
    staffPosition = data['staff_position'];
    qualification = data['qualification'];
    yearOfInception = data['year_of_inception'];
  }

}
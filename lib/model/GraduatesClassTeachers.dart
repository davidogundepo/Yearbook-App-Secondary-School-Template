class GraduatesClassTeachers {
  String autoBio;
  String qualification;
  String courseTeaching;
  String yearOfInception;
  String email;
  String facebook;
  String linkedIn;
  String id;
  String image;
  String instagram;
  String name;
  String phone;
  String twitter;
  String hobbies;
  String philosophy;
  String originState;

  GraduatesClassTeachers.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    autoBio = data['autobio'];
    email = data['email'];
    facebook = data['facebook'];
    image = data['image'];
    instagram = data['instagram'];
    name = data['name'];
    phone = data['phone'];
    twitter = data['twitter'];
    qualification = data['qualification'];
    courseTeaching = data['course_teaching'];
    yearOfInception = data['year_of_inception'];
    originState = data['state_of_origin'];
    hobbies = data['hobbies'];
    philosophy = data['philosophy'];
    linkedIn = data['linkedin'];
  }

}
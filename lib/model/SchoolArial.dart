
class SchoolArial {
  String image;
  String toastname;

  SchoolArial.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    toastname = data['toastname'];
  }
}
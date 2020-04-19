
class SchoolArial {
  String image;
  String toastName;

  SchoolArial.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    toastName = data['toastname'];
  }
}
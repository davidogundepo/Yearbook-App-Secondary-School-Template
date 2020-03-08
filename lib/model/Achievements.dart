
class Achievements {
  String image;
  String toastname;

  Achievements.fromMap(Map<String, dynamic> data) {
    image = data['image'];
    toastname = data['toastname'];
  }
}
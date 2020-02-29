class ClassPrefects {
  String position_enforced;
  String department;
  String image;
  String name;
  String id;

  ClassPrefects.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    image = data['image'];
    position_enforced = data['position_enforced'];
    department = data['department'];
    name = data['name'];
  }

}
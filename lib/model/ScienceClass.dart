
class ScienceClass {
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
  String prefect;
  String positionEnforced;
  String stateLiving;
  String originState;
  String snapchat;
  String tikTok;
  String favSubject;
  String favSchoolActivity;
  String favSport;
  String favClassmate;
  String favPlaceInCampus;
  String favWatchedMovie;
  String twitter;
  String worstMoment;

  ScienceClass.fromMap(Map<String, dynamic> data) {
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
    prefect = data['prefect'];
    positionEnforced = data['position_enforced'];
    originState = data['origin_state'];
    stateLiving = data['state_living'];
    snapchat = data['snapchat'];
    tikTok = data['tiktok'];
    favSubject = data['fav_subject'];
    favSchoolActivity = data['fav_school_activity'];
    favClassmate = data['fav_classmate'];
    favPlaceInCampus = data['fav_place_in_campus'];
    favSport = data['fav_sport_in_campus'];
    favWatchedMovie = data['fav_watched_movie'];
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
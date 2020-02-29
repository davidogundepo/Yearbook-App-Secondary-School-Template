
import 'package:bloc/bloc.dart';
import '../thrown_pages/management_thrown_page.dart';
import '../thrown_pages/teachers_thrown_page.dart';
import '../thrown_pages/science_thrown_page.dart';
import '../thrown_pages/social_thrown_page.dart';
import '../thrown_pages/art_thrown_page.dart';
import '../thrown_pages/prefects_thrown_page.dart';

enum NavigationEvents {
  MySciencePageClickedEvent,
  MySocialPageClickedEvent,
  MyArtPageClickedEvent,
  MyGraduatesClassTeachersPageClickedEvent,
  MyManagementBodyPageClickedEvent,
  MyClassPrefectsPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MySciencePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents events) async* {
    switch (events) {
      case NavigationEvents.MySciencePageClickedEvent:
        yield MySciencePage();
        break;
      case NavigationEvents.MySocialPageClickedEvent:
        yield MySocialPage();
        break;
      case NavigationEvents.MyArtPageClickedEvent:
        yield MyArtPage();
        break;
      case NavigationEvents.MyGraduatesClassTeachersPageClickedEvent:
        yield MyGraduatesClassTeachersPage();
        break;
      case NavigationEvents.MyManagementBodyPageClickedEvent:
        yield MyManagementBodyPage();
        break;
      case NavigationEvents.MyClassPrefectsPageClickedEvent:
        yield MyClassPrefectsPage();
        break;
    }
  }


}

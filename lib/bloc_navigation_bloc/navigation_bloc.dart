
import 'package:bloc/bloc.dart';
import '../pages/first_page.dart';
import '../pages/second_page.dart';
import '../pages/third_page.dart';

enum NavigationEvents {
  MyHomePageClickedEvent,
  MySecondPageClickedEvent,
  MyThirdPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MyHomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents events) async* {
    switch (events) {
      case NavigationEvents.MyHomePageClickedEvent:
        yield MyHomePage();
        break;
      case NavigationEvents.MySecondPageClickedEvent:
        yield MySecondPage();
        break;
      case NavigationEvents.MyThirdPageClickedEvent:
        yield MyThirdPage();
        break;
    }
  }


}

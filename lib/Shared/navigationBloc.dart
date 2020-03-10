import 'package:bloc/bloc.dart';
import 'package:hogoh/Models/doUserProfile.dart';
import 'package:hogoh/Screens/Home/home.dart';
import 'package:hogoh/Screens/Profile/user_profile.dart';
import 'package:hogoh/Screens/Profile/UserProfile.dart';


enum NavigationEvents {
  HomePageClickedEvent,
  UserPageClickedEvent,
  SettingsPageClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => UserProfile();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.HomePageClickedEvent:
        yield Home();
        break;
      case  NavigationEvents.UserPageClickedEvent:
        yield UserProfile();
        break;
      case  NavigationEvents.SettingsPageClickedEvent:
        yield Home();
        break;
    }
  }
}

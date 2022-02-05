import 'package:get_it/get_it.dart';
import 'package:picture_note/services/firebase_authentication_servise.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthenticationServise());
}

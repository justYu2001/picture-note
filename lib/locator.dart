import 'package:get_it/get_it.dart';
import 'package:picture_note/services/firebase_authentication_servise.dart';
import 'package:picture_note/services/select_class_table_services.dart';
import 'viewmodels/class_manage_model.dart';
import 'viewmodels/card_model.dart';
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirebaseAuthenticationServise());
  locator.registerLazySingleton(() => SelectTableService());
  locator.registerLazySingleton(() => ClassTableManageModel());

  locator.registerFactory(() => SelectedCardModel());
  locator.registerFactory(() => NormalCardModel());
}

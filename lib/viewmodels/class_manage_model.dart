import 'package:picture_note/enums/viewstate.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/services/select_class_table_services.dart';
import 'card_model.dart';
import 'base_model.dart';

class ClassTableManageModel extends BaseModel{
  bool selectMode = false;
  String newClassName = "";
  List<List<NormalCardModel>> normalCardModelInstances =
  List.filled(18, List.filled(7, locator<NormalCardModel>()));


  set setSelectMode(bool touch){
    setState(ViewState.Busy);

    var classTableManageModel = locator<SelectTableService>();
    selectMode = !selectMode;
    if(getSelectMode == false) classTableManageModel.clear();

    setState(ViewState.Busy);
  }

  bool get getSelectMode => selectMode;

  NormalCardModel getNormalCardModelInstance(int day, int clock){
    print(normalCardModelInstances);
    print(clock);
    return normalCardModelInstances[clock - 7][day];
  }

}
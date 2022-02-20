import 'package:picture_note/enums/viewstate.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/services/select_class_table_services.dart';
import 'base_model.dart';

class ClassTableManageModel extends BaseModel{
  bool selectMode = false;
  var selectTableService = locator<SelectTableService>();

  void changeSelectMode() async{
    setState(ViewState.Busy);
    selectMode = !selectMode;
    if(selectMode == false){
      await selectTableService.addClassToDB();
      selectTableService.setNormalCardInformation();
      selectTableService.clearSelectCondition();
    }
    setState(ViewState.Idle);
  }
}
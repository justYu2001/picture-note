import 'package:flutter/material.dart';
import 'package:picture_note/viewmodels/dialog_drop_down_button_model.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/db/class_infromation_db_model.dart';
import 'package:picture_note/db/db_operater.dart';
import 'package:picture_note/viewmodels/card_model.dart';

class SelectTableService{
  TextEditingController newClassNameController = TextEditingController();
  DialogDropDownButtonModel dialogDropDownButtonModel = locator<DialogDropDownButtonModel>();

  var normalCardModelInstances = <int, List>{
    0 : [],1 : [], 2:[], 3 : [], 4 : [], 5 : [], 6:[]
  };
  var selectCondition = <String, List<int>>{
    '0' : [],'1' : [], '2':[], '3' : [], '4' : [], '5' : [], '6':[]
  };

  Future<void> init() async{
    for(int day = 0; day < 7; day++){
      for(int clock = 0; clock < 18; clock++){
        NormalCardModel normalCardModel = locator<NormalCardModel>();
        normalCardModelInstances[day]?.add(normalCardModel);
        normalCardModelInstances[day]?.add(normalCardModel);
      }
    }
    await readDBrenderLayout();
  }

  Future<void> readDBrenderLayout()async {
    List<ClassInformationDBModel> classInformation = await getClassInformation();
    for(var everyClassInformation in classInformation){
      String name = everyClassInformation.className;
      double colorType = everyClassInformation.classColorType.toDouble();
      Map time = convertStringToMap(everyClassInformation.classTime);
      for(int day = 0; day < 7; day ++){
        for (int clock in time['$day']){
          normalCardModelInstances[day]?[clock - 7].className = name;
          normalCardModelInstances[day]?[clock - 7].classColor = Color.fromRGBO(117,176,192,colorType);
        }
      }
    }
  }

  void setSelectCondition(int day, int clock){
    selectCondition['$day']?.add(clock);
  }

  List getSelectCondition(int day){
    selectCondition['$day']?.sort();
    return selectCondition['$day'] ?? [];
  }

  void clearSelectCondition(){
    selectCondition.forEach((day, clocks) {
      selectCondition[day]?.clear();
    });
  }

  void setNormalCardInformation(){
    for(int day = 0; day < 7; day ++){
      if(selectCondition['$day']!.isNotEmpty){
        for (var clock in selectCondition['$day']!) {
          normalCardModelInstances[day]?[clock-7].classColor = Color.fromRGBO(117,176,192,
              dialogDropDownButtonModel.getTransparency());
          normalCardModelInstances[day]?[clock-7].setInformation();
          normalCardModelInstances[day]?[clock-7].className = newClassNameController.text;
        }
      }
    }
    newClassNameController.clear();
  }

  Future<void> addClassToDB() async {
    int id = await getMaxCursorId() ?? 0;
    ClassInformationDBModel dbInstance = ClassInformationDBModel(
        cursorId: id,
        className: newClassNameController.text,
        classTime: convertMapToString(selectCondition),
        classColorType: dialogDropDownButtonModel.getTransparency()
    );
    insertInformation(
        dbInstance,
        'class_information',
    );
  }
}



import 'package:flutter/material.dart';
import 'package:picture_note/enums/viewstate.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/services/select_class_table_services.dart';
import 'package:picture_note/services/normal_card_infromation_service.dart';
import 'base_model.dart';

class ClassTableManageModel extends BaseModel{
  bool selectMode = false;
  String newClassName = "";
  List<List<NormalCardInformation>> normalCardInformation =
  List.filled(18, List.filled(7, locator<NormalCardInformation>()));


  set setSelectMode(bool touch){
    setState(ViewState.Busy);

    var classTableManageModel = locator<SelectTableService>();
    selectMode = !selectMode;

    if(getSelectMode == false) {
      normalCardInformation[0][0].setClassName('wwww');
      print(normalCardInformation[0][0].getClassName());
      print(normalCardInformation[0][1].getClassName());
      print(normalCardInformation[2][0].getClassName());// the list has same instance
      // for(int day = 0; day < 7; day ++){
      //   List clockList = classTableManageModel.getDayClock(day);
      //   if(clockList.isNotEmpty){
      //     for (var clock in clockList) {
      //       normalCardInformation[clock - 7][day].setClassColor(Colors.grey);
      //     }
      //   }
      // }
      classTableManageModel.clear();
    }
    setState(ViewState.Busy);
  }

  bool get getSelectMode => selectMode;

  NormalCardInformation getNormalCardModelInstance(int day, int clock){
    return normalCardInformation[clock - 7][day];
  }
}
import 'package:flutter/material.dart';
import 'package:picture_note/viewmodels/dialog_drop_down_button_model.dart';
import 'package:picture_note/locator.dart';

class SelectTableService{
  TextEditingController newClassNameController = TextEditingController();
  DialogDropDownButtonModel dialogDropDownButtonModel = locator<DialogDropDownButtonModel>();

  var normalCardModelInstances = <int, List>{
    0 : [],1 : [], 2:[], 3 : [], 4 : [], 5 : [], 6:[]
  };
  var selectCondition = <int, List>{
    0 : [],1 : [], 2:[], 3 : [], 4 : [], 5 : [], 6:[]
  };


  void setSelectCondition(int day, int clock){
    selectCondition[day]?.add(clock);
  }

  List getSelectCondition(int day){
    selectCondition[day]?.sort();
    return selectCondition[day] ?? [];
  }

  void clearSelectCondition(){
    selectCondition.forEach((day, clocks) {
      selectCondition[day]?.clear();
    });
  }

  void setNormalCardInformation(){
    for(int day = 0; day < 7; day ++){
      if(selectCondition[day]!.isNotEmpty){
        for (var clock in selectCondition[day]!) {
          normalCardModelInstances[day]?[clock-7].classColor = Color.fromRGBO(117,176,192,
              dialogDropDownButtonModel.getTransparency());
          normalCardModelInstances[day]?[clock-7].setInformation();
          normalCardModelInstances[day]?[clock-7].className = newClassNameController.text;
        }
      }
    }
    newClassNameController.clear();
  }
}

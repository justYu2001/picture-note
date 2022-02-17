import 'package:flutter/material.dart';

class SelectTableService{
  String newClassName = "";

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

  void setNormalCardInformation(){ // pass the class's color here
    for(int day = 0; day < 7; day ++){
      if(selectCondition[day] != null){
        if(selectCondition[day]!.isNotEmpty){
          for (var clock in selectCondition[day]!) {
            normalCardModelInstances[day]?[clock-7].classColor = Colors.grey;
            normalCardModelInstances[day]?[clock-7].setInformation();
          }
        }
      }
    }
  }
}


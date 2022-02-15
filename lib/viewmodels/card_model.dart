import 'package:flutter/material.dart';
import 'package:picture_note/enums/viewstate.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/services/normal_card_infromation_service.dart';
import 'class_manage_model.dart';
import 'base_model.dart';

class SelectedCardModel extends BaseCard{
  bool isSelected = false;
  bool otherClassExisted = false;

  set setSelect(bool touch){
    setState(ViewState.Busy);
    isSelected = !isSelected;
    setState(ViewState.Busy);
  }

  Color get showColor => isSelected? Color.fromRGBO(100,147,161, 0.7): Colors.transparent;

}

class NormalCardModel extends BaseModel{

  NormalCardInformation getNormalCardInformation(int day, int clock){
    var classTableManageModel = locator<ClassTableManageModel>();
    return classTableManageModel.getNormalCardModelInstance(day, clock);
  }

  Color getColor(int day, int clock){
    var cardInformation = getNormalCardInformation(day, clock);
    return cardInformation.getClassColor();
  }

  String getName(int day, int clock){
    var cardInformation = getNormalCardInformation(day, clock);
    return cardInformation.getClassName();
  }
}


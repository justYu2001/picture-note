import 'package:flutter/material.dart';
import '../enums/viewstate.dart';
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
  String classType = "required";
  late int day;
  late int clock;
}
import 'package:flutter/material.dart';
import 'package:picture_note/enums/viewstate.dart';
import 'base_model.dart';

class SelectedCardModel extends BaseCard{
  bool isSelected = false;
  bool otherClassExisted = false;

  set setSelect(bool touch){
    setState(ViewState.Busy);
    isSelected = !isSelected;
    setState(ViewState.Idle);
  }

  Color get showColor => isSelected? Color.fromRGBO(100,147,161, 0.7): Colors.transparent;

}

class NormalCardModel extends BaseModel{
  Color classColor = Colors.transparent;
  String className = "";

  void setInformation(){
    setState(ViewState.Busy);
    setState(ViewState.Idle);
  }
}


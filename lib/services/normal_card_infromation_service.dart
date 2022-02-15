import 'package:flutter/material.dart';

class NormalCardInformation{
  Color classColor = Colors.transparent;
  String className = "";

  void setClassColor(Color inputColor){
    classColor = inputColor;
  }
  void setClassName(String inputName){
    className = inputName;
  }

  Color getClassColor() => classColor;
  String getClassName() => className;

}
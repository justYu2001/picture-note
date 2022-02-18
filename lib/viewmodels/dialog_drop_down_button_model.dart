import 'package:picture_note/enums/viewstate.dart';
import 'base_model.dart';

class DialogDropDownButtonModel extends BaseModel{
  String dropdownValue = '系上必修';
  int typeIndex = 0;
  List<double> typeTransparency = [
    1, 0.75, 0.5, 0.25
  ];
  List<String> allClassType = [
    '系上必修',
    '系上選修',
    '必修通識',
    '選修通識'
  ];

  void dropdownValueUpdate(String? newValue){
    setState(ViewState.Busy);
    typeIndex = allClassType.indexOf(newValue!);
    dropdownValue = newValue;
    setState(ViewState.Idle);
  }

  double getTransparency() => typeTransparency[typeIndex];
}
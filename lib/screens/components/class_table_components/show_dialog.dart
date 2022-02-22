import 'package:flutter/material.dart';
import 'package:picture_note/locator.dart';
import 'package:picture_note/services/select_class_table_services.dart';
import 'package:picture_note/viewmodels/dialog_drop_down_button_model.dart';
import 'package:picture_note/viewmodels/class_manage_model.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  const AddButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ClassTableManageModel classTableManageModel =
        locator<ClassTableManageModel>();
    return IconButton(
        icon: const Icon(Icons.add),
        color: Colors.white,
        onPressed: () => classTableManageModel.selectMode == false
            ? null
            : showDialog<String>(
                context: context,
                builder: (BuildContext context) => const AlertDialog(
                  backgroundColor: Color.fromRGBO(122, 134, 157, 0.5),
                  content: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: _DialogContent(),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    side: BorderSide(
                        color: Color.fromRGBO(175, 163, 119, 1), width: 3),
                  ),
                  contentPadding: EdgeInsets.all(5),
                ),
              ));
  }
}

class _DialogContent extends StatelessWidget {
  const _DialogContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SelectTableService selectTableService = locator<SelectTableService>();
    ClassTableManageModel classTableManageModel =
        locator<ClassTableManageModel>();

    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.55,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Selected',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: const Color.fromRGBO(102, 127, 180, 1),
                child: const Text(
                  '顯示已選時段',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 23,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'ClassName',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 30,
                color: const Color.fromRGBO(92, 109, 155, 1),
                child: TextField(
                  controller: selectTableService.newClassNameController,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Class type',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                  width: double.infinity,
                  height: 33,
                  color: const Color.fromRGBO(94, 158, 179, 1),
                  alignment: Alignment.center,
                  child: Theme(
                    data: ThemeData(
                      primaryColor: Colors.yellow,
                    ),
                    child: ClassSelectDropDownButton(),
                  )),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: IconButton(
                          icon: Icon(
                            Icons.arrow_back,
                            color: Color.fromRGBO(98, 108, 126, 1),
                            size: 70.0,
                          ),
                          onPressed: () {
                            classTableManageModel.changeSelectMode();
                            Navigator.of(context, rootNavigator: true).pop();
                          }
                        ),
                      ),
                      Image(
                        image: AssetImage('assets/images/logo.png'),
                        width: 60.0,
                      ),
                      SizedBox(
                        width: 80.0,
                        height: 80.0,
                        child: IconButton(
                          icon: Icon(
                            Icons.add,
                            color: Color.fromRGBO(98, 108, 126, 1),
                            size: 70.0,
                          ),
                          onPressed: () {
                            classTableManageModel.changeSelectMode();
                            Navigator.of(context, rootNavigator: true).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class ClassSelectDropDownButton extends StatelessWidget {
  const ClassSelectDropDownButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DialogDropDownButtonModel dialogDropDownButtonModel =
        locator<DialogDropDownButtonModel>();
    return ChangeNotifierProvider<DialogDropDownButtonModel>.value(
      value: dialogDropDownButtonModel,
      child: Consumer<DialogDropDownButtonModel>(
        builder: (context, dialogDropDownButtonModel, child) =>
            DropdownButton<String>(
          value: dialogDropDownButtonModel.dropdownValue,
          elevation: 16,
          style: const TextStyle(color: Colors.black),
          underline: Container(
            height: 2,
            color: Colors.transparent,
          ),
          items: dialogDropDownButtonModel.allClassType
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            dialogDropDownButtonModel.dropdownValueUpdate(newValue);
          },
        ),
      ),
    );
  }
}

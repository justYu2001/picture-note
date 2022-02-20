import 'base_db_model.dart';

class ClassInformationDBModel implements BaseDBModel{
  final int cursorId;
  final String className;
  final String classTime;
  final num classColorType;


  const ClassInformationDBModel ({
    required this.cursorId,
    required this.className,
    required this.classTime,
    required this.classColorType
  });

  Map<String, dynamic> toMap() {
    return {
      'cursorId' : cursorId,
      'className': className,
      'classTime' : classTime,
      'classColorType': classColorType,
   };
  }

  @override
  String toString() {
    return 'ClassInformationDBModel{cursorId: $cursorId, className: $className, classTime: $classTime,classColorType: $classColorType}';
  }
}


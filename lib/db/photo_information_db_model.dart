import 'base_db_model.dart';

class PhotoInformationDBModel implements BaseDBModel{
  final int cursorId;
  final String photoPath;
  final String photoDescription;


  const PhotoInformationDBModel({
    required this.cursorId,
    required this.photoPath,
    required this.photoDescription
  });

  @override
  Map<String, dynamic> toMap() {
    return {
      'cursorId':cursorId,
      'photoPath': photoPath,
      'photoDescription' : photoDescription,
    };
  }

  @override
  String toString() {
    return 'PhotoInformationDBModel{cursorId: $cursorId, photoPath: $photoPath, photoDescription: $photoDescription}';
  }
}


import '../apis/end_points.dart';

class ErrorModel {
  final int? status;
  final String errorMessage;

  ErrorModel({ this.status, required this.errorMessage});

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) {
    print("---------------------------------${jsonData[ApiKey.errorMessage]}");
    return ErrorModel(
         errorMessage: jsonData[ApiKey.errorMessage]);
  }
}

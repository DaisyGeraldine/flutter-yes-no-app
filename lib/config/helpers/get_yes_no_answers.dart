import 'package:dio/dio.dart';
import 'package:maybeapp/domain/entities/message.dart';
import 'package:maybeapp/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswers {
  final _dio = Dio();

  Future<Message> getAnswer() async {
    final response = await _dio.get('https://yesno.wtf/api');

    final yesNoModel = YesNoModel.fromJson(response.data);
    print('response : ${response.data}');
    
    return yesNoModel.toMessageEntity();
  }
}
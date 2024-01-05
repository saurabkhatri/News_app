import 'package:dio/dio.dart';
import 'package:news_app/config/network/api_endpoint.dart';
import '../../features/top_headlines/headline_model.dart';

class NetworkRequest {

  final dio = Dio();

  Future<List<Articles>?> getTopHeading() async{


    final response = await dio.get(ApiEndpoints.topHeadLines);

    if(response.statusCode == 200 || response.statusCode == 201){

      ///Success
       return HeadlineModel.fromJson(response.data).articles;

    }
    else {

      ///failure
    return [];
    }

    print("NEWS Response");
    print(response);
  }
}
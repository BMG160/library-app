import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../constant/api_constant.dart';
import '../response/home_response.dart';

part 'api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class Api{

  factory Api(Dio dio) => _Api(dio);

  @GET(kEndPointForHome)
  Future<HomeResponse> getHomeResponse(
      @Query(kQueryParamsPublishedDate) String publishedDate,
      @Query(kQueryParamsApiKey) String apiKey,
      );
}
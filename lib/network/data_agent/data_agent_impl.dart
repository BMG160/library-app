
import 'package:dio/dio.dart';
import 'package:flutter_library/constant/api_constant.dart';
import 'package:flutter_library/data/vos/list_vo/list_vo.dart';
import 'package:flutter_library/network/api/api.dart';
import 'package:flutter_library/network/data_agent/data_agent.dart';

class DataAgentImpl extends DataAgent{
  late Api _api;

  DataAgentImpl._(){
    _api = Api(Dio());
  }

  static final DataAgentImpl _singleton = DataAgentImpl._();

  factory DataAgentImpl() => _singleton;

  @override
  Future<List<ListVO>?> getLists(String publishedDate) => _api
      .getHomeResponse(publishedDate, kApiKey)
      .asStream()
      .map((event) => event.results?.lists)
      .first;


}
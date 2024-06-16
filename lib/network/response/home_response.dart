
import 'package:json_annotation/json_annotation.dart';

import '../../data/vos/result_vo/result_vo.dart';


part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse{

  @JsonKey(name: 'status')
  String? status;

  @JsonKey(name: 'copyright')
  String? copyright;

  @JsonKey(name: 'num_results')
  int? numResults;

  @JsonKey(name: 'results')
  ResultVO? results;

  HomeResponse(this.status, this.copyright, this.numResults, this.results);


  factory HomeResponse.fromJson(Map<String, dynamic> json) => _$HomeResponseFromJson(json);
}
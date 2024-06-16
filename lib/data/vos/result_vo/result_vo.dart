
import 'package:json_annotation/json_annotation.dart';

import '../list_vo/list_vo.dart';


part 'result_vo.g.dart';

@JsonSerializable()
class ResultVO{

  @JsonKey(name: 'bestsellers_date')
  String? bestsellersDate;

  @JsonKey(name: 'published_date')
  String? publishedDate;

  @JsonKey(name: 'published_date_description')
  String? publishedDateDescription;

  @JsonKey(name: 'previous_published_date')
  String? previousPublishedDate;

  @JsonKey(name: 'next_published_date')
  String? nextPublishedDate;

  @JsonKey(name: 'lists')
  List<ListVO>? lists;

  ResultVO(
      this.bestsellersDate,
      this.publishedDate,
      this.publishedDateDescription,
      this.previousPublishedDate,
      this.nextPublishedDate,
      this.lists);

  factory ResultVO.fromJson(Map<String, dynamic> json) => _$ResultVOFromJson(json);
}
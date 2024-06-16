import 'package:flutter_library/constant/hive_constant.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'buy_link_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForBuyLink)
class BuyLinkVO{

  @HiveField(0)
  @JsonKey(name: 'name')
  String? name;

  @HiveField(1)
  @JsonKey(name: 'url')
  String? url;

  BuyLinkVO(this.name, this.url);

  factory BuyLinkVO.fromJson(Map<String, dynamic> json) => _$BuyLinkVOFromJson(json);
}
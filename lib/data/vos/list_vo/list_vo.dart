
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../constant/hive_constant.dart';
import '../book_vo/book_vo.dart';

part 'list_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForList)
class ListVO{

  @JsonKey(name: 'list_id')
  @HiveField(0)
  int? listID;

  @JsonKey(name: 'list_name')
  @HiveField(1)
  String? listName;

  @JsonKey(name: 'list_name_encoded')
  @HiveField(2)
  String? listNameEncoded;

  @JsonKey(name: 'display_name')
  @HiveField(3)
  String? displayName;

  @JsonKey(name: 'updated')
  @HiveField(4)
  String? updated;

  @JsonKey(name: 'list_image')
  @HiveField(5)
  String? listImage;

  @JsonKey(name: 'list_image_width')
  @HiveField(6)
  double? listImageWidth;

  @JsonKey(name: 'list_image_height')
  @HiveField(7)
  double? listImageHeight;

  @JsonKey(name: 'books')
  @HiveField(8)
  List<BookVO>? books;

  @HiveField(9)
  bool? listBookmarkStatus;

  ListVO(
      this.listID,
      this.listName,
      this.listNameEncoded,
      this.displayName,
      this.updated,
      this.listImage,
      this.listImageWidth,
      this.listImageHeight,
      this.books,
      this.listBookmarkStatus
      );

  factory ListVO.fromJson(Map<String, dynamic> json) => _$ListVOFromJson(json);
}
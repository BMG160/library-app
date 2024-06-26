

import 'package:flutter_library/constant/hive_constant.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

import '../buy_link_vo/buy_link_vo.dart';


part 'book_vo.g.dart';

@JsonSerializable()
@HiveType(typeId: kHiveTypeIDForBook)
class BookVO{

  @JsonKey(name: 'age_group')
  @HiveField(0)
  String? ageGroup;

  @JsonKey(name: 'amazon_product_url')
  @HiveField(1)
  String? amazonProductURL;

  @JsonKey(name: 'article_chapter_link')
  @HiveField(2)
  String? articleChapterLink;

  @JsonKey(name: 'author')
  @HiveField(3)
  String? author;

  @JsonKey(name: 'book_image')
  @HiveField(4)
  String? bookImage;

  @JsonKey(name: 'book_image_width')
  @HiveField(5)
  double? bookImageWidth;

  @JsonKey(name: 'book_image_height')
  @HiveField(6)
  double? bookImageHeight;

  @JsonKey(name: 'book_review_link')
  @HiveField(7)
  String? bookReviewLink;

  @JsonKey(name: 'contributor')
  @HiveField(8)
  String? contributor;

  @JsonKey(name: 'contributor_note')
  @HiveField(9)
  String? contributorNote;

  @JsonKey(name: 'created_date')
  @HiveField(10)
  String? createdDate;

  @JsonKey(name: 'description')
  @HiveField(11)
  String? description;

  @JsonKey(name: 'first_chapter_link')
  @HiveField(12)
  String? firstChapterLink;

  @JsonKey(name: 'price')
  @HiveField(13)
  String? price;

  @JsonKey(name: 'primary_isbn10')
  @HiveField(14)
  String? primaryIsbn10;

  @JsonKey(name: 'primary_isbn13')
  @HiveField(15)
  String? primaryIsbn13;

  @JsonKey(name: 'book_uri')
  @HiveField(16)
  String? bookUri;

  @JsonKey(name: 'publisher')
  @HiveField(17)
  String? publisher;

  @JsonKey(name: 'rank')
  @HiveField(18)
  int? rank;

  @JsonKey(name: 'rank_last_week')
  @HiveField(19)
  int? rankLastWeek;

  @JsonKey(name: 'sunday_review_link')
  @HiveField(20)
  String? sundayReviewLink;

  @JsonKey(name: 'title')
  @HiveField(21)
  String? title;

  @JsonKey(name: 'updated_date')
  @HiveField(22)
  String? updatedDate;

  @JsonKey(name: 'weeks_on_list')
  @HiveField(23)
  int? weeksOnList;

  @JsonKey(name: 'buy_links')
  @HiveField(24)
  List<BuyLinkVO>? buyLinks;

  @HiveField(25)
  bool? bookmarkStatus;



  BookVO(
      this.ageGroup,
      this.amazonProductURL,
      this.articleChapterLink,
      this.author,
      this.bookImage,
      this.bookImageWidth,
      this.bookImageHeight,
      this.bookReviewLink,
      this.contributor,
      this.contributorNote,
      this.createdDate,
      this.description,
      this.firstChapterLink,
      this.price,
      this.primaryIsbn10,
      this.primaryIsbn13,
      this.bookUri,
      this.publisher,
      this.rank,
      this.rankLastWeek,
      this.sundayReviewLink,
      this.title,
      this.updatedDate,
      this.weeksOnList,
      this.buyLinks,
      this.bookmarkStatus
      );

  factory BookVO.fromJson(Map<String, dynamic> json) => _$BookVOFromJson(json);
}
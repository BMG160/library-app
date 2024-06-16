// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_vo.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListVOAdapter extends TypeAdapter<ListVO> {
  @override
  final int typeId = 1;

  @override
  ListVO read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListVO(
      fields[0] as int?,
      fields[1] as String?,
      fields[2] as String?,
      fields[3] as String?,
      fields[4] as String?,
      fields[5] as String?,
      fields[6] as double?,
      fields[7] as double?,
      (fields[8] as List?)?.cast<BookVO>(),
      fields[9] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, ListVO obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.listID)
      ..writeByte(1)
      ..write(obj.listName)
      ..writeByte(2)
      ..write(obj.listNameEncoded)
      ..writeByte(3)
      ..write(obj.displayName)
      ..writeByte(4)
      ..write(obj.updated)
      ..writeByte(5)
      ..write(obj.listImage)
      ..writeByte(6)
      ..write(obj.listImageWidth)
      ..writeByte(7)
      ..write(obj.listImageHeight)
      ..writeByte(8)
      ..write(obj.books)
      ..writeByte(9)
      ..write(obj.listBookmarkStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListVOAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListVO _$ListVOFromJson(Map<String, dynamic> json) => ListVO(
      (json['list_id'] as num?)?.toInt(),
      json['list_name'] as String?,
      json['list_name_encoded'] as String?,
      json['display_name'] as String?,
      json['updated'] as String?,
      json['list_image'] as String?,
      (json['list_image_width'] as num?)?.toDouble(),
      (json['list_image_height'] as num?)?.toDouble(),
      (json['books'] as List<dynamic>?)
          ?.map((e) => BookVO.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['listBookmarkStatus'] as bool?,
    );

Map<String, dynamic> _$ListVOToJson(ListVO instance) => <String, dynamic>{
      'list_id': instance.listID,
      'list_name': instance.listName,
      'list_name_encoded': instance.listNameEncoded,
      'display_name': instance.displayName,
      'updated': instance.updated,
      'list_image': instance.listImage,
      'list_image_width': instance.listImageWidth,
      'list_image_height': instance.listImageHeight,
      'books': instance.books,
      'listBookmarkStatus': instance.listBookmarkStatus,
    };

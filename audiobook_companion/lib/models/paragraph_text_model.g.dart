// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paragraph_text_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ParagraphTextAdapter extends TypeAdapter<ParagraphText> {
  @override
  final int typeId = 0;

  @override
  ParagraphText read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParagraphText(
      title: fields[0] as String,
      content: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ParagraphText obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParagraphTextAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExampleAdapter extends TypeAdapter<Example> {
  @override
  final int typeId = 0;

  @override
  Example read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Example()..name = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Example obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExampleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

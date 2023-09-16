// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataBaseModelAdapter extends TypeAdapter<DataBaseModel> {
  @override
  final int typeId = 1;

  @override
  DataBaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataBaseModel(
      locName: fields[0] as String,
      id: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DataBaseModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.locName)
      ..writeByte(1)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataBaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

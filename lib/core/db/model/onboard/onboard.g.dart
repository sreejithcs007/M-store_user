// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboard.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OnBoardScreenHiveModelAdapter
    extends TypeAdapter<OnBoardScreenHiveModel> {
  @override
  final int typeId = 1;

  @override
  OnBoardScreenHiveModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OnBoardScreenHiveModel(
      isSeen: fields[0] as dynamic,
    );
  }

  @override
  void write(BinaryWriter writer, OnBoardScreenHiveModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isSeen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OnBoardScreenHiveModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

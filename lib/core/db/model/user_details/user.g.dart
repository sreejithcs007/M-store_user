// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserDetailsHiveAdapter extends TypeAdapter<UserDetailsHive> {
  @override
  final int typeId = 0;

  @override
  UserDetailsHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserDetailsHive(
      id: fields[0] as int,
      userEmail: fields[1] as String,
      userPhoneNo: fields[2] as String,
      accessToken: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserDetailsHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.userEmail)
      ..writeByte(2)
      ..write(obj.userPhoneNo)
      ..writeByte(3)
      ..write(obj.accessToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDetailsHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Todo_box.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class todoAdapter extends TypeAdapter<todo> {
  @override
  final int typeId = 0;

  @override
  todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return todo(
      id: fields[0] as String?,
      isDone: fields[3] as bool,
      contentTodo: fields[1] as String?,
      isLate: fields[5] as bool,
      dateDone: fields[6] as bool,
      isDate: fields[4] as int?,
      date: fields[2] as String?,
      hienthi: fields[7] as bool??,
    );
  }

  @override
  void write(BinaryWriter writer, todo obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.contentTodo)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.isDone)
      ..writeByte(4)
      ..write(obj.isDate)
      ..writeByte(5)
      ..write(obj.isLate)
      ..writeByte(6)
      ..write(obj.dateDone)
      ..writeByte(7)
      ..write(obj.hienthi);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is todoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

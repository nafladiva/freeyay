// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_mdl.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameMdlAdapter extends TypeAdapter<GameMdl> {
  @override
  final int typeId = 0;

  @override
  GameMdl read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameMdl(
      id: fields[0] as int,
      title: fields[1] as String?,
      thumbnail: fields[2] as String?,
      shortDescription: fields[3] as String?,
      genre: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GameMdl obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.thumbnail)
      ..writeByte(3)
      ..write(obj.shortDescription)
      ..writeByte(4)
      ..write(obj.genre);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameMdlAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'burger_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BurgerProductAdapter extends TypeAdapter<BurgerProduct> {
  @override
  final int typeId = 2;

  @override
  BurgerProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BurgerProduct(
      id: fields[0] as int,
      name: fields[1] as String,
      catagory: fields[2] as String,
      image: fields[3] as String,
      description: fields[4] as String,
      price: fields[5] as String,
      quantity: fields[6] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BurgerProduct obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.catagory)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.quantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BurgerProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

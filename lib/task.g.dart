// // GENERATED CODE - DO NOT MODIFY BY HAND
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************

part of 'task.dart';

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      date: fields[3] as DateTime?,
      time: _readTimeOfDay(fields[4]),
      // Deserialize TimeOfDay
      description: fields[1] as String,
      isNotify: fields[5] as bool,
      title: fields[0] as String,
      isCompleted: fields[6] as bool,
      priority: fields[2] as String,
    );
  }

  TimeOfDay? _readTimeOfDay(dynamic fieldValue) {
    if (fieldValue == null) {
      return null;
    }
    final List<int> timeList = fieldValue.cast<int>();
    return TimeOfDay(hour: timeList[0], minute: timeList[1]);
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.priority)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(_writeTimeOfDay(obj.time)) // Serialize TimeOfDay
      ..writeByte(5)
      ..write(obj.isNotify)
      ..writeByte(6)
      ..write(obj.isCompleted);
  }

  List<int>? _writeTimeOfDay(TimeOfDay? time) {
    if (time == null) {
      return null;
    }
    return [time.hour, time.minute];
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
// // GENERATED CODE - DO NOT MODIFY BY HAND
//
// part of 'task.dart';
//
// // **************************************************************************
// // TypeAdapterGenerator
// // **************************************************************************
//
// class TaskAdapter extends TypeAdapter<Task> {
//   @override
//   final int typeId = 0;
//
//   @override
//   Task read(BinaryReader reader) {
//     final numOfFields = reader.readByte();
//     final fields = <int, dynamic>{
//       for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
//     };
//     return Task(
//       date: fields[3] as DateTime?,
//       time: fields[4] as TimeOfDay?,
//       description: fields[1] as String,
//       isNotify: fields[5] as bool,
//       title: fields[0] as String,
//       isCompleted: fields[6] as bool,
//       priority: fields[2] as String,
//     );
//   }
//
//   @override
//   void write(BinaryWriter writer, Task obj) {
//     writer
//       ..writeByte(7)
//       ..writeByte(0)
//       ..write(obj.title)
//       ..writeByte(1)
//       ..write(obj.description)
//       ..writeByte(2)
//       ..write(obj.priority)
//       ..writeByte(3)
//       ..write(obj.date)
//       ..writeByte(4)
//       ..write(obj.time)
//       ..writeByte(5)
//       ..write(obj.isNotify)
//       ..writeByte(6)
//       ..write(obj.isCompleted);
//   }
//
//   @override
//   int get hashCode => typeId.hashCode;
//
//   @override
//   bool operator ==(Object other) =>
//       identical(this, other) ||
//           other is TaskAdapter &&
//               runtimeType == other.runtimeType &&
//               typeId == other.typeId;
// }

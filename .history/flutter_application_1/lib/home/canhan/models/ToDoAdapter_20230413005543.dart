import 'package:hive/hive.dart';
import 'todo.dart';

class ToDoAdapter extends TypeAdapter<ToDo> {
  @override
  final typeId = 0;

  @override
  ToDo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++)
        reader.readByte(): reader.read(),
    };
    ToDo(
        id: "1",
        contentTodo: "Buy milk",
        isDone: false,
        isDate: 0,
        date: "20-11-2021",
      ),
    return ToDo(
      id: fields[0] as String,
      contentTodo: fields[1] as String,
      isDone: fields[2] as Bol,
      // Add any other fields you have defined in your 'ToDo' class
    );
  }

  @override
  void write(BinaryWriter writer, ToDo obj) {
    writer.writeByte(3);
    writer.writeByte(0);
    writer.write(obj.id);
    writer.writeByte(1);
    writer.write(obj.title);
    writer.writeByte(2);
    writer.write(obj.description);
    // Write any other fields you have defined in your 'ToDo' class
  }
}
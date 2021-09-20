import 'package:hive/hive.dart';

part 'example.g.dart';

@HiveType(typeId: 0)
class Example extends HiveObject {
  @HiveField(0)
  late String name;
}

import 'package:hive/hive.dart';

part 'user.g.dart';

// Define User Model

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  String number;

  User({this.name, this.number});
}

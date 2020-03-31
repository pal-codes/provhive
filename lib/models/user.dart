import 'package:hive/hive.dart';

class User {
  @HiveField(0)
  String name;

  @HiveField(1)
  String number;

  User(this.name, this.number);
}

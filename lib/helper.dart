import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provhive/models/user.dart';

Future<void> configureHive() async{
  await Hive.initFlutter();
  Hive.registerAdapter<User>(UserAdapter());
  await Hive.openBox('userBox');
}
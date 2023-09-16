import 'package:hive_flutter/hive_flutter.dart';
part 'db.g.dart';

String favoritesDBName = 'favourites';

@HiveType(typeId: 1)
class DataBaseModel {
  @HiveField(0)
  final String locName;

  @HiveField(1)
  final String id;

  DataBaseModel({required this.locName, required this.id});
}

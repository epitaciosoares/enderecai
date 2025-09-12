import 'package:realm/realm.dart';

abstract class DatabaseAdapter {
  Future<void> insert<T>(T object);
  Future<T?> find<T extends RealmObject>(String id);
}

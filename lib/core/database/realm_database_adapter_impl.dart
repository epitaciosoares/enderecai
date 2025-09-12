import 'package:enderecai/core/database/database_adapter.dart';
import 'package:realm/realm.dart';

class RealmDatabaseAdapterImpl extends DatabaseAdapter {
  final Realm _realm;

  RealmDatabaseAdapterImpl(this._realm);

  @override
  Future<T?> find<T extends RealmObject>(String primaryKey) async {
    try {
      return _realm.find<T>(primaryKey);
    } catch (e) {
      throw Exception("Erro ao buscar o objeto: $e");
    }
  }

  @override
  Future<void> insert<T>(T object) async {
    _realm.write(() {
      _realm.add(object as RealmObject, update: true);
    });
  }
}

import 'package:enderecai/data/models/cep_model.dart';
import 'package:realm/realm.dart';

class RealmConfig {
  static Realm initRealm() {
    final config = Configuration.local([CepModel.schema]);
    return Realm(config);
  }
}

import 'package:enderecai/data/datasources/share_adapter.dart';
import 'package:enderecai/data/datasources/url_share_adapter.dart';
import 'package:enderecai/domain/repositories/share_repository.dart';
import 'package:result_dart/result_dart.dart';

class ShareRepositoryImpl implements ShareRepository {
  final ShareAdapter _shareAdapter;
  final UrlShareAdapter _urlShareAdapter;

  ShareRepositoryImpl(this._shareAdapter, this._urlShareAdapter);

  @override
  AsyncResult shareText(String text) async {
    await _shareAdapter.shareText(text);
    return Success(true);
  }

  @override
  AsyncResult shareToMaps(String address) async {
    await _urlShareAdapter.shareToMaps(address);
    return Success(true);
  }
}

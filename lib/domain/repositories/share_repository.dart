import 'package:result_dart/result_dart.dart';

abstract interface class ShareRepository {
  AsyncResult shareText(String text);
  AsyncResult shareToMaps(String address);
}

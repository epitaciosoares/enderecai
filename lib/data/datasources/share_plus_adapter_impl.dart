import 'package:enderecai/data/datasources/share_adapter.dart';
import 'package:share_plus/share_plus.dart';

class SharePlusAdapterImpl implements ShareAdapter {
  @override
  Future<void> shareText(String text) async {
    await SharePlus.instance.share(ShareParams(text: text));
  }
}

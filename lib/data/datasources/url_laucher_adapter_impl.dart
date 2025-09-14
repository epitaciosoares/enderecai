import 'package:enderecai/data/datasources/url_share_adapter.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLaucherAdapterImpl implements UrlShareAdapter {
  @override
  Future<void> shareToMaps(String address) async {
    final url = Uri.encodeFull(
      'https://www.google.com/maps/search/?api=1&query=$address',
    );
    final readyUrl = await canLaunchUrl(Uri.parse(url));
    if (readyUrl) {
      await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialShare extends StatelessWidget {
  final String url;
  final String title;

  const SocialShare({super.key, required this.url, required this.title});

  void _launch(String shareUrl) async {
    final uri = Uri.parse(shareUrl);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $shareUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    final encodedUrl = Uri.encodeComponent(url);
    final encodedTitle = Uri.encodeComponent(title);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () => _launch('https://twitter.com/intent/tweet?url=$encodedUrl&text=$encodedTitle'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade400),
          child: Text("Share on Twitter"),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => _launch('https://www.facebook.com/sharer/sharer.php?u=$encodedUrl'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade600),
          child: Text("Share on Facebook"),
        ),
        SizedBox(width: 10),
        ElevatedButton(
          onPressed: () => _launch('https://www.linkedin.com/shareArticle?mini=true&url=$encodedUrl&title=$encodedTitle'),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue.shade800),
          child: Text("Share on LinkedIn"),
        ),
      ],
    );
  }
}

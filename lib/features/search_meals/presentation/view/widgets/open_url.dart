import 'package:flutter/material.dart';
import 'package:alaa_taher/features/add_meal/presentation/views/widgets/custom_button.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenUrl extends StatelessWidget {
  const OpenUrl({super.key, required this.url});

  final String url;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(
        onTap: () async {
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          } else {
            print("Could not open $url");
          }
        },
        title: "Open source",
      ),
    );
  }
}

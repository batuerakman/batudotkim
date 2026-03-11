import 'package:batu/theme/theme.dart';
import 'package:batu/widgets/metro_popup.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// Shows the Support popup.
void showSupportPopup(BuildContext context) {
  showMetroPopup(
    context: context,
    child: const SupportContent(),
  );
}

class SupportContent extends StatelessWidget {
  const SupportContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final titleSize = isMobile ? 20.0 : 26.0;
    final bodySize = isMobile ? 13.0 : 15.0;
    final padding = isMobile ? 16.0 : 32.0;

    final bodyStyle = itemLabelLight.copyWith(
      fontSize: bodySize,
      color: Colors.grey.shade800,
      height: 1.6,
    );

    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Support',
            style: itemLabel.copyWith(
              fontSize: titleSize,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            'If you need help with our applications or have any questions, you can reach out via email below.',
            style: bodyStyle,
          ),
          const SizedBox(height: 16),
          Text(
            'Please include a few details about your issue or request in your email.',
            style: bodyStyle,
          ),
          const SizedBox(height: 24),
          Text('Email:', style: bodyStyle.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          InkWell(
            onTap: () async {
              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'erakmanbatu@gmail.com',
              );
              if (!await launchUrl(emailLaunchUri)) {
                // Ignore error silently
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'erakmanbatu@gmail.com',
                  style: bodyStyle.copyWith(
                    color: Colors.blue.shade700,
                    decoration: TextDecoration.underline,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(Icons.open_in_new, size: 14, color: Colors.blue.shade700),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text('Phone:', style: bodyStyle.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 4),
          Text('+90 554 028 22 50', style: bodyStyle),
          const SizedBox(height: 24),
          Text('Common issues:', style: bodyStyle.copyWith(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          _bulletList(bodyStyle, [
            'Subscription not working',
            'App crashes',
            'Feature requests',
          ]),
          const SizedBox(height: 24),
          Text(
            'We usually respond within 24 hours.',
            style: bodyStyle,
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }

  static Widget _bulletList(TextStyle style, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.only(left: 16, bottom: 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('•  ', style: style),
                    Expanded(child: Text(item, style: style)),
                  ],
                ),
              ))
          .toList(),
    );
  }
}

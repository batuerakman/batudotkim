import 'package:batu/theme/theme.dart';
import 'package:batu/widgets/metro_popup.dart';
import 'package:flutter/material.dart';

/// Shows the Privacy Policy popup.
void showPrivacyPopup(BuildContext context) {
  showMetroPopup(
    context: context,
    child: const PrivacyContent(),
  );
}

class PrivacyContent extends StatelessWidget {
  const PrivacyContent({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;
    final titleSize = isMobile ? 20.0 : 26.0;
    final headingSize = isMobile ? 16.0 : 20.0;
    final bodySize = isMobile ? 13.0 : 15.0;
    final padding = isMobile ? 16.0 : 32.0;

    final headingStyle = itemLabel.copyWith(
      fontSize: headingSize,
      color: Colors.grey.shade900,
      fontWeight: FontWeight.w600,
    );
    final bodyStyle = itemLabelLight.copyWith(
      fontSize: bodySize,
      color: Colors.grey.shade800,
      height: 1.6,
    );
    final bulletStyle = bodyStyle.copyWith(height: 1.8);

    return SingleChildScrollView(
      padding: EdgeInsets.all(padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Privacy Policy',
            style: itemLabel.copyWith(
              fontSize: titleSize,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Last updated: March 10, 2025',
            style: bodyStyle.copyWith(
              color: Colors.grey.shade500,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Your privacy is important to us. This policy outlines how we handle your information when you use our mobile applications.',
            style: bodyStyle.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 12),
          Text('This privacy policy is available at:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Online at: https://batuerakman.com/privacy-policy',
            'In each app\'s settings or about section',
            'On the App Store and Google Play store listings',
          ]),
          const SizedBox(height: 24),

          // 1
          Text('1. Information We Collect', style: headingStyle),
          const SizedBox(height: 12),

          Text('1.1 Information You Provide', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('Depending on the app, we may collect:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Kanky: Study progress, quiz results, and learning preferences',
            'Tomodoro: Timer statistics, session data, and profile information via Google Sign-In',
            'Artusion: Photos and text prompts you submit for AI-powered image generation',
          ]),
          const SizedBox(height: 12),

          Text('1.2 Automatically Collected Information', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('Our apps may automatically collect:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Camera Data: Images captured for AI processing features (Artusion)',
            'Usage Analytics: App performance metrics, crash reports, and feature usage',
            'Device Information: OS version, device model, and app version for compatibility',
            'Authentication Data: Google account information for sign-in (Tomodoro)',
          ]),
          const SizedBox(height: 12),

          Text('1.3 Information We Do Not Collect', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Location data or GPS coordinates',
            'Access to other applications on your device',
            'Financial or payment details (payments are handled by app stores)',
          ]),
          const SizedBox(height: 20),

          // 2
          Text('2. How We Use Your Information', style: headingStyle),
          const SizedBox(height: 8),
          Text('The information we collect is used to:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Deliver and improve the functionality of our apps',
            'Process AI-powered photo generation requests (Artusion)',
            'Maintain user profiles and sync data across devices (Tomodoro)',
            'Analyze performance and resolve technical issues',
            'Enhance overall user experience',
            'Comply with legal obligations',
          ]),
          const SizedBox(height: 16),

          // 2A
          Text('2A. Permissions & Consent', style: headingStyle),
          const SizedBox(height: 8),
          Text('We are transparent about how and when we request access to your device features. Our apps run on both iOS and Android.',
              style: bodyStyle),
          const SizedBox(height: 12),

          Text('2A.1 Permission Requests', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('Your operating system will prompt you for permission when:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Camera Access: Required for photo features in Artusion',
            'Photo Library/Gallery: For loading or saving images',
            'AI Photo Processing: Images are temporarily uploaded to servers for processing (see Section 3)',
          ]),
          const SizedBox(height: 12),

          Text('2A.2 Types of Data Collection', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Camera & Photo Access: Optional — required only for photo-related features. Denying access disables those features without affecting other functionality.',
            'Analytics & Crash Data: Collected automatically and anonymously to improve stability. This data contains no personal identifiers.',
            'AI Processing: Occurs only when you actively use AI features. Images are processed temporarily and removed within 24 hours.',
          ]),
          const SizedBox(height: 12),

          Text('2A.3 Revoking Permissions', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('You can revoke any granted permissions at any time:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'iOS: Settings > Privacy > [Permission Type] > [App Name]',
            'Android: Settings > Apps > [App Name] > Permissions',
          ]),
          const SizedBox(height: 6),
          Text('To request deletion of collected data, email us at erakmanbatu@gmail.com with "Data Deletion Request" as the subject.',
              style: bodyStyle),
          const SizedBox(height: 20),

          // 3
          Text('3. Photo Processing', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'Artusion includes AI-powered photo generation and editing that may process facial images.',
            style: bodyStyle.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Text(
            'When you upload a photo, it is used solely to generate your requested AI output (e.g., stylized images, artistic effects). Photos are stored temporarily on secure servers and automatically deleted within 24 hours after processing. We do not extract or store biometric identifiers, and we do not share photos with any third parties.',
            style: bodyStyle,
          ),
          const SizedBox(height: 8),
          Text('Key points:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Purpose: Processing is solely for AI-powered generation and editing',
            'Storage: Temporary, on secure servers for processing only',
            'Retention: Automatic deletion within 24 hours',
            'Biometrics: No biometric identifiers are extracted or stored',
            'Third Parties: Photos are never shared with external parties',
          ]),
          const SizedBox(height: 16),

          // 3A
          Text('3A. AI Content Disclaimer', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'Our AI features use third-party services, specifically Fal.ai, for image generation and processing. Please note:',
            style: bodyStyle,
          ),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'AI-generated content is provided for informational and creative purposes and may not be fully accurate',
            'AI outputs should not be treated as professional, medical, financial, or legal advice',
            'Users should independently verify AI-generated information before acting on it',
            'We cannot guarantee the accuracy, completeness, or reliability of AI outputs',
            'You retain ownership of content you upload, though AI outputs may be subject to the AI provider\'s terms',
          ]),
          const SizedBox(height: 16),

          // 3B
          Text('3B. AI Data Processing Details', style: headingStyle),
          const SizedBox(height: 12),

          Text('3B.1 What We Collect', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('When you use AI features in Artusion, we collect:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Photos you upload from your device or capture with your camera',
            'Text prompts or instructions you provide to guide generation',
          ]),
          const SizedBox(height: 12),

          Text('3B.2 Processing Purpose', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Generate AI-powered images based on your inputs',
            'Deliver the core features of the application',
            'Improve the quality of generation results over time',
          ]),
          const SizedBox(height: 12),

          Text('3B.3 Third-Party Provider', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text(
            'Your photos and prompts are sent to Fal.ai, a third-party AI service, for processing. Fal.ai operates the machine learning models that transform your inputs into generated images.',
            style: bodyStyle,
          ),
          const SizedBox(height: 12),

          Text('3B.4 Data Protection', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text(
            'Fal.ai is required to maintain data protection standards consistent with this Privacy Policy. Your data is processed securely and is not used for any purpose other than fulfilling your generation request.',
            style: bodyStyle,
          ),
          const SizedBox(height: 12),

          Text('3B.5 No Sale of Data', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text(
            'We do not sell your photos, prompts, or generated content to any third party. Data is shared only with Fal.ai for the sole purpose of processing your requests.',
            style: bodyStyle,
          ),
          const SizedBox(height: 12),

          Text('3B.6 Retention', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Photos and prompts are used only for your specific request',
            'Data is deleted automatically after processing, typically within 24 hours',
            'We do not retain inputs for training, marketing, or secondary purposes',
          ]),
          const SizedBox(height: 12),

          Text('3B.7 Consent', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('Before any data is transmitted for AI processing, you will see a clear consent prompt explaining:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'What data will be sent (your photo and/or prompt)',
            'Where it will be processed (Fal.ai)',
            'How long it will be retained (temporarily, then deleted)',
          ]),
          const SizedBox(height: 6),
          Text(
            'You must agree before any data is sent. Declining means AI features won\'t be available, but other app functionality remains unaffected.',
            style: bodyStyle,
          ),
          const SizedBox(height: 12),

          Text('3B.8 Fal.ai Privacy Policy', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('For details on Fal.ai\'s data handling, see their privacy policy at: https://fal.ai/privacy', style: bodyStyle),
          const SizedBox(height: 20),

          // 4
          Text('4. Data Storage & Processing', style: headingStyle),
          const SizedBox(height: 12),

          Text('4.1 Local Processing', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('Where possible, data is processed and stored locally on your device:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Study progress and educational content (Kanky)',
            'Timer statistics and session logs (Tomodoro)',
          ]),
          const SizedBox(height: 12),

          Text('4.2 Cloud Processing', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('Certain features require cloud-based processing:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'AI image generation (Artusion, via Fal.ai)',
            'User authentication and profile sync (Tomodoro, via Firebase)',
            'Analytics and crash reporting',
          ]),
          const SizedBox(height: 12),

          Text('4.3 Retention Periods', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'User-generated content: Retained until you delete the app or clear data',
            'Analytics data: Up to 2 years for service improvement',
            'Technical logs: Up to 1 year for troubleshooting',
            'AI processing data: Deleted within 24 hours',
          ]),
          const SizedBox(height: 20),

          // 5
          Text('5. Data Sharing', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'We do not sell, trade, or rent your personal information. We may share data only in these limited situations:',
            style: bodyStyle,
          ),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Service Providers: Trusted partners who help operate our apps, under strict confidentiality',
            'Legal Requirements: When required by law, court order, or government request',
            'Safety: To protect the rights, property, or safety of users or the public',
            'Business Transfers: In the event of a merger or acquisition, with user notification',
          ]),
          const SizedBox(height: 20),

          // 6
          Text('6. Third-Party Services', style: headingStyle),
          const SizedBox(height: 8),
          Text('Our apps integrate the following third-party services:', style: bodyStyle),
          const SizedBox(height: 12),

          Text('6.1 AI Services', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Fal.ai: AI image generation and processing in Artusion (images processed anonymously)',
          ]),
          const SizedBox(height: 12),

          Text('6.2 Backend & Analytics', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Firebase Authentication: Google Sign-In for Tomodoro user accounts',
            'Firebase Firestore: Cloud data sync for Tomodoro',
            'Firebase Analytics: Anonymous app usage patterns and feature engagement',
            'Firebase Crashlytics: Crash reports and technical logs for stability improvements',
          ]),
          const SizedBox(height: 12),

          Text('6.3 Platform Services', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Apple App Store: Distribution and updates (subject to Apple\'s privacy policy)',
            'Google Play Store: Distribution and updates (subject to Google\'s privacy policy)',
          ]),
          const SizedBox(height: 12),

          Text('6.4 Third-Party Privacy Policies', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('We encourage you to review the privacy policies of our third-party service providers:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Fal.ai: https://fal.ai/privacy',
            'Google / Firebase: https://policies.google.com/privacy',
            'Firebase: https://firebase.google.com/support/privacy',
            'Apple: https://www.apple.com/privacy',
          ]),
          const SizedBox(height: 20),

          // 7
          Text('7. Children\'s Privacy', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'Our applications are not intended for children under the age of 13. We do not knowingly collect personal information from children under 13. If we become aware of such collection, the data will be deleted promptly.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 8
          Text('8. Your Privacy Rights', style: headingStyle),
          const SizedBox(height: 8),
          Text('You have the right to:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Access: Request details about the data we hold',
            'Correction: Request corrections to inaccurate information',
            'Deletion: Request removal of your personal data',
            'Portability: Receive your data in a structured, machine-readable format',
            'Opt-out: Manage analytics preferences in app settings',
          ]),
          const SizedBox(height: 12),

          Text('8.1 Exercising Your Rights', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Email: Send a request to erakmanbatu@gmail.com with "Privacy Rights Request" as the subject',
            'In-App: Use the app\'s settings to clear locally stored data',
            'Phone: Reach us at +90 554 028 22 50',
          ]),
          const SizedBox(height: 6),
          Text(
            'We respond to requests within 30 days. Some data may be retained as required by law or for legitimate business purposes.',
            style: bodyStyle,
          ),
          const SizedBox(height: 12),

          Text('8.2 Account & Data Deletion', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Email erakmanbatu@gmail.com with "Data Deletion Request" as the subject',
            'Include your User ID from the app\'s profile or settings section',
            'We will confirm receipt within 3 business days',
            'Data will be permanently deleted within 30 days of verification',
          ]),
          const SizedBox(height: 6),
          Text(
            'Once deleted, data cannot be recovered. Anonymized analytics may be retained for up to 90 days for regulatory purposes.',
            style: bodyStyle,
          ),
          const SizedBox(height: 12),

          Text('8.3 Subscription Management', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'iOS: https://apps.apple.com/account/subscriptions',
            'Android: https://play.google.com/store/account/subscriptions',
          ]),
          const SizedBox(height: 20),

          // 9
          Text('9. Security', style: headingStyle),
          const SizedBox(height: 8),
          Text('We take appropriate measures to protect your information:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Encryption of data in transit and at rest',
            'Regular security reviews and updates',
            'Restricted access to personal data on a need-to-know basis',
            'Secure infrastructure and data handling practices',
          ]),
          const SizedBox(height: 20),

          // 10
          Text('10. International Transfers', style: headingStyle),
          const SizedBox(height: 8),
          Text('Your data may be transferred to and processed in countries outside of Turkey. We ensure adequate protection through:',
              style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Compliance with applicable data protection regulations',
            'Appropriate technical and organizational safeguards',
            'Contractual obligations with service providers',
          ]),
          const SizedBox(height: 20),

          // 11
          Text('11. Policy Updates', style: headingStyle),
          const SizedBox(height: 8),
          Text('This privacy policy may be updated to reflect changes in our practices or legal requirements. We will:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Communicate significant changes through app updates',
            'Publish the updated policy with a new effective date',
            'Provide reasonable notice of material changes',
          ]),
          const SizedBox(height: 20),

          // 12
          Text('12. California Residents (CCPA)', style: headingStyle),
          const SizedBox(height: 8),
          _bulletList(bulletStyle, [
            'Right to know what personal data is collected and how it is used',
            'Right to request deletion of personal data',
            'Right to opt out of data sales (we do not sell personal data)',
            'Right to non-discrimination for exercising privacy rights',
          ]),
          const SizedBox(height: 20),

          // 13
          Text('13. European Users (GDPR)', style: headingStyle),
          const SizedBox(height: 8),
          _bulletList(bulletStyle, [
            'Right to access, rectify, and erase personal data',
            'Right to restrict or object to processing',
            'Right to data portability',
            'Right to withdraw consent at any time',
            'Right to lodge a complaint with a supervisory authority',
          ]),
          const SizedBox(height: 20),

          // 14
          Text('14. Contact', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'If you have any questions or concerns about this privacy policy or your personal data, please contact us:',
            style: bodyStyle,
          ),
          const SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(isMobile ? 16 : 24),
            decoration: BoxDecoration(
              color: Colors.black.withAlpha(5),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Developer: Batu Erakman', style: bodyStyle.copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: 4),
                Text('Published by: Mehmet Adar Keser', style: bodyStyle),
                const SizedBox(height: 8),
                Text('Email: erakmanbatu@gmail.com', style: bodyStyle),
                const SizedBox(height: 4),
                Text('Phone: +90 554 028 22 50', style: bodyStyle),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'We are committed to safeguarding your privacy. If you have any concerns, please don\'t hesitate to reach out.',
            style: bodyStyle.copyWith(fontStyle: FontStyle.italic),
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

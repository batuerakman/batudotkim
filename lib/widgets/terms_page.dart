import 'package:batu/theme/theme.dart';
import 'package:batu/widgets/metro_popup.dart';
import 'package:flutter/material.dart';

/// Shows the Terms of Service popup.
void showTermsPopup(BuildContext context) {
  showMetroPopup(
    context: context,
    child: const TermsContent(),
  );
}

class TermsContent extends StatelessWidget {
  const TermsContent({super.key});

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
            'Terms of Service',
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
          const SizedBox(height: 24),

          // 1
          Text('1. Agreement to Terms', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'By downloading, installing, or using any application developed by Batu Erakman and published under the App Store account of Mehmet Adar Keser ("we," "our," or "us"), you agree to comply with and be bound by these Terms of Service ("Terms"). If you do not agree with these Terms, please refrain from using our applications.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 2
          Text('2. Overview of Services', style: headingStyle),
          const SizedBox(height: 8),
          Text('We develop and maintain the following mobile applications:', style: bodyStyle),
          const SizedBox(height: 8),
          _bulletList(bulletStyle, [
            'Kanky – An educational platform for exam preparation and study materials',
            'Tomodoro – A social pomodoro timer app for productivity tracking and study sessions',
            'Artusion – An AI-powered photo generation and editing application',
          ]),
          const SizedBox(height: 20),

          // 3
          Text('3. License Grant', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'Subject to your compliance with these Terms, we grant you a limited, non-exclusive, non-transferable, revocable license to download and use our applications strictly for personal, non-commercial purposes. Under this license, you may not:',
            style: bodyStyle,
          ),
          const SizedBox(height: 8),
          _bulletList(bulletStyle, [
            'Reproduce, modify, adapt, or create derivative works based on our applications',
            'Reverse engineer, decompile, disassemble, or attempt to extract source code',
            'Remove, alter, or obscure any proprietary notices, labels, or marks',
            'Use our applications for unlawful or unauthorized purposes',
            'Sublicense, rent, lease, or redistribute our applications to third parties',
          ]),
          const SizedBox(height: 20),

          // 4
          Text('4. Acceptable Use', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'You agree to use our applications in a responsible manner and in accordance with all applicable laws. You shall not:',
            style: bodyStyle,
          ),
          const SizedBox(height: 8),
          _bulletList(bulletStyle, [
            'Violate any local, national, or international law or regulation',
            'Upload, transmit, or distribute harmful, offensive, or objectionable content',
            'Interfere with, disrupt, or compromise the integrity of our applications or servers',
            'Attempt unauthorized access to any part of our systems or infrastructure',
            'Engage in spamming, harassment, or any activity that harms other users',
          ]),
          const SizedBox(height: 20),

          // 5
          Text('5. Intellectual Property Rights', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'All content, features, functionality, visual elements, code, and design of our applications — including text, graphics, logos, icons, images, and software — are the property of Batu Erakman and are protected under applicable copyright, trademark, and intellectual property laws.',
            style: bodyStyle,
          ),
          const SizedBox(height: 16),

          // 5A
          Text('5A. Your Content', style: headingStyle),
          const SizedBox(height: 8),

          Text('5A.1 Ownership', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('You retain full ownership of any content you create, upload, or input into our applications, including:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Photos and images you upload or capture',
            'Text, notes, tasks, and documents you create',
            'Data and information you enter into the apps',
          ]),
          const SizedBox(height: 12),

          Text('5A.2 Limited License', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('By using our applications, you grant us a limited, non-exclusive license to:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Process your content in order to deliver the requested services (e.g., AI generation, identification)',
            'Temporarily store your content on servers for processing',
            'Utilize anonymous, aggregated data derived from usage to improve our services',
          ]),
          const SizedBox(height: 6),
          Text('This license terminates when you delete your content or remove the app, except for anonymized aggregate data.',
              style: bodyStyle),
          const SizedBox(height: 12),

          Text('5A.3 Your Obligations', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('You are solely responsible for:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Confirming you have the necessary rights to any content you upload',
            'Refraining from uploading copyrighted material without proper authorization',
            'Ensuring no illegal, harmful, or inappropriate content is submitted',
            'Complying with all relevant laws regarding content you create or share',
          ]),
          const SizedBox(height: 12),

          Text('5A.4 AI-Generated Output', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'You own the original content you supply as input',
            'AI-generated results may be subject to the AI provider\'s own terms of use',
            'We do not claim ownership over AI-generated content, though uniqueness cannot be guaranteed',
            'Other users providing similar inputs may receive similar or identical outputs',
          ]),
          const SizedBox(height: 12),

          Text('5A.5 Content Removal', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('We reserve the right to remove any content that:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Breaches these Terms of Service',
            'Infringes upon intellectual property rights',
            'Is illegal, harmful, or otherwise inappropriate',
            'Violates any applicable laws or regulations',
          ]),
          const SizedBox(height: 20),

          // 6
          Text('6. Privacy', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'Your privacy matters to us. Please refer to our Privacy Policy, which describes how we collect, use, and protect your information when you use our applications.',
            style: bodyStyle,
          ),
          const SizedBox(height: 16),

          // 6A
          Text('6A. Subscriptions & Payments', style: headingStyle),
          const SizedBox(height: 8),
          Text('Certain applications may offer premium features, subscriptions, or in-app purchases.', style: bodyStyle),
          const SizedBox(height: 12),

          Text('6A.1 Payment Processing', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'All payments are handled through the Apple App Store or Google Play Store',
            'Billing terms and pricing follow the respective app store\'s policies',
            'We do not directly collect or store any payment information',
          ]),
          const SizedBox(height: 12),

          Text('6A.2 Auto-Renewal & Cancellation', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Subscriptions renew automatically unless cancelled at least 24 hours before the current period ends',
            'You may cancel at any time via your App Store or Google Play account settings',
            'Refunds for unused subscription time are generally not provided unless required by law',
            'Pricing may change with prior notice; changes do not affect your current billing period',
          ]),
          const SizedBox(height: 12),

          Text('6A.3 Free Trials', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Free trial periods may be offered for select features',
            'Unless cancelled before the trial ends, charges will apply automatically',
            'Trial eligibility is determined by the app store',
          ]),
          const SizedBox(height: 12),

          Text('6A.4 Refund Requests', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Refunds must be requested through the Apple App Store or Google Play Store',
            'We may share usage records with the app store to support refund verification',
            'Misuse of refund policies may result in service termination',
          ]),
          const SizedBox(height: 20),

          // 7
          Text('7. App Store Compliance', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'Your use of our applications is additionally subject to the terms of the platform from which you downloaded them:',
            style: bodyStyle,
          ),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Apple App Store: Subject to Apple\'s Terms and Conditions',
            'Google Play Store: Subject to Google Play\'s Terms of Service',
          ]),
          const SizedBox(height: 6),
          Text(
            'Where these Terms conflict with the applicable app store terms, the app store terms shall take precedence.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 8
          Text('8. Disclaimers', style: headingStyle),
          const SizedBox(height: 8),
          Text(
              'Our applications are provided on an "as is" and "as available" basis without warranties of any kind, express or implied. We do not warrant that:',
              style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'The applications will meet your particular requirements',
            'The applications will operate without errors or interruptions',
            'AI-generated results or identifications will be fully accurate',
            'The applications will be compatible with every device or operating system',
          ]),
          const SizedBox(height: 16),

          // 8A
          Text('8A. AI-Powered Features', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'Some of our applications leverage artificial intelligence for photo generation, editing, and content creation. By using these features, you acknowledge:',
            style: bodyStyle,
          ),
          const SizedBox(height: 12),

          Text('8A.1 No Accuracy Guarantee', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'AI-generated content may be incomplete, inaccurate, or not tailored to your specific needs',
            'AI outputs should not be treated as professional, medical, legal, or financial advice',
            'You are responsible for independently verifying any AI-generated information',
          ]),
          const SizedBox(height: 12),

          Text('8A.2 Prohibited Uses', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('You agree not to use AI-powered features for:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'Medical diagnosis or health-related decision-making',
            'Legal counsel or legal decision-making',
            'Financial advice or investment decisions',
            'Any safety-critical or life-threatening applications',
            'Commercial use without prior written permission',
            'Creating harmful, illegal, or inappropriate content',
          ]),
          const SizedBox(height: 12),

          Text('8A.3 Input Responsibility', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text('You bear sole responsibility for:', style: bodyStyle),
          const SizedBox(height: 6),
          _bulletList(bulletStyle, [
            'All inputs and prompts you provide to AI features',
            'Ensuring you do not submit copyrighted, confidential, or sensitive material without authorization',
            'Verifying that your inputs comply with applicable laws',
            'Any consequences arising from your use of AI-generated outputs',
          ]),
          const SizedBox(height: 12),

          Text('8A.4 Third-Party AI Services', style: headingStyle.copyWith(fontSize: headingSize - 2)),
          const SizedBox(height: 6),
          Text(
            'Our AI features are powered by third-party providers including Fal.ai. Your use of these features is also governed by the respective provider\'s terms. We are not responsible for the availability, performance, or output of third-party AI services.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 9
          Text('9. Limitation of Liability', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'To the fullest extent permitted by applicable law, Batu Erakman shall not be held liable for any indirect, incidental, special, consequential, or punitive damages arising from or related to your use of our applications.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 10
          Text('10. Indemnification', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'You agree to indemnify and hold harmless Batu Erakman and Mehmet Adar Keser from any claims, liabilities, damages, or expenses (including reasonable attorney fees) arising from your use of our applications or any breach of these Terms.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 11
          Text('11. Termination', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'We reserve the right to suspend or terminate your access to our applications at any time, with or without notice, for any reason — including violation of these Terms. Upon termination, you must stop using our applications and remove them from your devices.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 12
          Text('12. Changes to These Terms', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'We may revise these Terms from time to time. Material changes will be communicated through app updates or other reasonable means. Your continued use of our applications after such modifications constitutes your acceptance of the revised Terms.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 13
          Text('13. Governing Law', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'These Terms shall be governed by and construed in accordance with the laws of the Republic of Turkey. Any disputes arising under or in connection with these Terms shall be subject to the exclusive jurisdiction of the courts of Turkey.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 14
          Text('14. Severability', style: headingStyle),
          const SizedBox(height: 8),
          Text(
            'If any provision of these Terms is determined to be invalid or unenforceable, the remaining provisions shall continue in full force and effect.',
            style: bodyStyle,
          ),
          const SizedBox(height: 20),

          // 15 - Contact
          Text('15. Contact Information', style: headingStyle),
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
            'By using our applications, you acknowledge that you have read, understood, and agree to be bound by these Terms of Service.',
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

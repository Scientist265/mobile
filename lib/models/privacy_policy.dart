import 'package:flutter/material.dart';

class PrivacyPolicy {
  final String header;
  final String desc;

  PrivacyPolicy({required this.header, required this.desc});
}

String appMail = 'pathedapp@gmail.com';

List<PrivacyPolicy> outline = [
  PrivacyPolicy(
      header: 'Information We Collect',
      desc:
          'When you use our app, we may collect certain information from you, includig Personal Information: This may include your name, email address, and other identifying information.Usage Information: This may include information about how you use our app, such as your search queries, app settings, and interactions with the app.We collect this information to improve your user experience and to provide you with personalized recommendations'),
  PrivacyPolicy(
      header: 'How We Use Your Information',
      desc:
          'When you use our app, we may collect certain information from you, includig Personal Information: This may include your name, email address, and other identifying information.Usage Information: This may include information about how you use our app, such as your search queries, app settings, and interactions with the app.We collect this information to improve your user experience and to provide you with personalized recommendations'),
  PrivacyPolicy(
      header: 'Data Security',
      desc:
          'We take data security seriously and have implemented appropriate physical, electronic, and procedural safeguards to protect your personal information. However, no data transmission over the internet can be guaranteed to be 100% secure, and we cannot guarantee the security of any information you transmit to us'),
  PrivacyPolicy(
      header: 'Data Retention',
      desc:
          'We will retain your personal information only for as long as necessary to provide you with our services and as required by law'),
  PrivacyPolicy(
      header: 'Third-Party Links',
      desc:
          'Our app may contain links to third-party websites or services that are not owned or controlled by our company. We have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third-party websites or services. You acknowledge and agree that we shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such websites or services'),
  PrivacyPolicy(
      header: 'Children\'s Privacy',
      desc:
          'Our app is not intended for use by children under the age of 13. We do not knowingly collect personal information from children under the age of 13. If you are a parent or guardian and believe that we have collected personal information about your child, please contact us at pathedapp@gmail.com to rectify it.'),
  PrivacyPolicy(
      header: 'Changes to this Policy',
      desc:
          'We reserve the right to update or modify this Privacy Policy at any time. If we make material changes to this policy, we will notify you by email or by posting a notice on our app. Your continued use of our app following any changes to this policy constitutes your acceptance of those changes.'),
  PrivacyPolicy(
      header: 'Contact Us',
      desc:
          'If you have any questions about this Privacy Policy, please contact us at $appMail, Peggy A. Roxy, Ibroheem H. Omowumi, Emmanuel O, Olorunsola I and  Daniel - Management team, PathEd App.'),
];

class Terms {
  final String termsHeader;
  final String termsDesc;

  Terms({
    required this.termsHeader,
    required this.termsDesc,
  });
}

List<Terms> terms = [
  Terms(
    termsHeader: 'Use of The App',
    termsDesc:
        'Our app is intended for personal, non-commercial use only. You may not use our app for any illegal or unauthorized purpose, and you agree to comply with all applicable laws and regulations. You may not copy, modify, distribute, sell, or transfer any part of our app without our written permission.',
  ),
  Terms(
    termsHeader: 'Disclaimer',
    termsDesc:
        'Our app provides general information about various career paths and is not intended to provide specific career advice or to replace professional guidance. We make no representations or warranties of any kind, express or implied, about the accuracy, completeness, suitability or availability of the information contained in our app for any purpose. Any reliance you place on such information is therefore strictly at your own risk',
  ),
  Terms(
    termsHeader: 'Use of The App',
    termsDesc:
        'All content in our app, including text, graphics, logos, images, and software, is the property of our company or its licensors and is protected by intellectual property laws. You may not use our app or any of its content for commercial purposes without our prior written consent.',
  ),
  Terms(
    termsHeader: 'Intellectual Property',
    termsDesc:
        'Our app may contain links to third-party websites or services that are not owned or controlled by our company. We have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third-party websites or services. You acknowledge and agree that we shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such websites or services.',
  ),
  Terms(
    termsHeader:'Links To Third Party Websites',
    termsDesc:
        'Our app may contain links to third-party websites or services that are not owned or controlled by our company. We have no control over, and assume no responsibility for, the content, privacy policies, or practices of any third-party websites or services. You acknowledge and agree that we shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with use of or reliance on any such content, goods or services available on or through any such websites or services.',
  ),
  Terms(
      termsHeader: 'Modifications',
      termsDesc:
          'We reserve the right to modify or replace these Terms of Use at any time. Any changes will be posted on this page, and it is your responsibility to check this page periodically for updates. Your continued use of our app following the posting of any changes constitutes acceptance of those changes.'),
  Terms(
      termsHeader: 'Termination',
      termsDesc:
          'We reserve the right to terminate or suspend access to our app immediately, without prior notice or liability, for any reason whatsoever, including without limitation if you breach these Terms of Use. All provisions of these Terms of Use which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity and limitations of liability.'),
  Terms(
      termsHeader: 'Governing Law',
      termsDesc:
          'These Terms of Use shall be governed and construed in accordance with the laws of Nigeria, without giving effect to any principles of conflicts of law.'),
  Terms(
      termsHeader: 'Contact Us',
      termsDesc:
          'If you have any questions about these Terms of Use, please contact us at pathedapp@gmail.com. We would be happy to address your concerns.'),
];

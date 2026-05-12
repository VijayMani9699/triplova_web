import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../core/theme/app_colors.dart';

class TriplovaFooter extends StatelessWidget {
  const TriplovaFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      color: AppColors.footerBg,
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 80 : 24,
        vertical: 60,
      ),
      child: Column(
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              if (isDesktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 2, child: _buildCompanyInfo(context)),
                    Expanded(child: _buildLinksColumn(context, 'Quick Links', [
                      'Home',
                      'Contact Us',
                      'Tours',
                      'FAQ\'s',
                      'Blogs',
                    ])),
                    Expanded(child: _buildLinksColumn(context, 'Other Links', [
                      'Privacy',
                      'Contact Us',
                      'Terms & Conditions',
                      'Shipping Policy',
                      'Cancellation',
                      'Cookies',
                    ])),
                    Expanded(flex: 1, child: _buildFollowUs(context)),
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCompanyInfo(context),
                    const SizedBox(height: 40),
                    _buildLinksColumn(context, 'Quick Links', [
                      'Home',
                      'Contact Us',
                      'Tours',
                      'FAQ\'s',
                      'Blogs',
                    ]),
                    const SizedBox(height: 40),
                    _buildLinksColumn(context, 'Other Links', [
                      'Privacy',
                      'Contact Us',
                      'Terms & Conditions',
                      'Shipping Policy',
                      'Cancellation',
                      'Cookies',
                    ]),
                    const SizedBox(height: 40),
                    _buildFollowUs(context),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 80),
          const Divider(color: Colors.white24, height: 1),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '© 2026 triplova. All rights reserved.',
                style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 12),
              ),
              Row(
                children: [
                  Text(
                    'Made with ',
                    style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 12),
                  ),
                  const Icon(Icons.favorite, color: Colors.red, size: 14),
                  Text(
                    ' by Kronix',
                    style: TextStyle(color: Colors.white.withAlpha(150), fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCompanyInfo(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.travel_explore, color: Colors.white, size: 32),
            const SizedBox(width: 12),
            Text(
              'triplova',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.5,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Triplova simplifies travel for modern explorers. From luxury retreats to cultural tours, we make the journey easy, fast, and fully curated.',
          style: TextStyle(
            color: Colors.white.withAlpha(180),
            fontSize: 14,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        _buildContactItem(Icons.phone_outlined, '+91 97090XXXXX\n(Monday to Sunday, 06 AM – 10 PM)'),
        const SizedBox(height: 16),
        _buildContactItem(Icons.email_outlined, 'support@triplova.com'),
        const SizedBox(height: 16),
        _buildContactItem(Icons.language_outlined, 'Serving all over India, 100% online'),
      ],
    );
  }

  Widget _buildContactItem(IconData icon, String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: AppColors.gold, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
          ),
        ),
      ],
    );
  }

  Widget _buildLinksColumn(BuildContext context, String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 24),
        ...links.map((link) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    const Icon(Icons.chevron_right, color: Colors.amber, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      link,
                      style: TextStyle(
                        color: Colors.white.withAlpha(200),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildFollowUs(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Follow Us',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Stay connected and explore the world with us!',
          style: TextStyle(
            color: Colors.white.withAlpha(180),
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 24),
        _buildSocialItem(FontAwesomeIcons.instagram, 'triplovaindia'),
        const SizedBox(height: 12),
        _buildSocialItem(FontAwesomeIcons.facebookF, 'triplovaofficial'),
        const SizedBox(height: 12),
        _buildSocialItem(FontAwesomeIcons.xTwitter, '@Triplovaofficial'),
        const SizedBox(height: 12),
        _buildSocialItem(FontAwesomeIcons.linkedinIn, 'triplova'),
      ],
    );
  }

  Widget _buildSocialItem(IconData icon, String text) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, color: Colors.amber, size: 18),
          const SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: Colors.white.withAlpha(200),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

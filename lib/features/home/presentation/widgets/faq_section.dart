import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../../../core/theme/app_colors.dart';

class FaqSection extends StatefulWidget {
  const FaqSection({super.key});

  @override
  State<FaqSection> createState() => _FaqSectionState();
}

class _FaqSectionState extends State<FaqSection> {
  int? _expandedIndex = 0; // Default first item expanded to match the screenshot

  final List<Map<String, String>> _faqs = [
    {
      'question': 'What does Triplova do?',
      'answer': 'We curate bespoke luxury travel experiences, complete personalized itineraries, and provide expert global guidance for discerning travelers worldwide.',
    },
    {
      'question': 'Who can use Triplova?',
      'answer': 'Anyone seeking a seamless, premium travel journey. Whether planning an unforgettable honeymoon, family leisure retreat, or highly streamlined executive travel, Triplova is crafted for you.',
    },
    {
      'question': 'How can I pay?',
      'answer': 'We support all major international credit/debit cards, premium secure net banking, and verified payment gateways with absolute transparency and zero hidden fees.',
    },
    {
      'question': 'How do I receive my verified itineraries?',
      'answer': 'All securely vetted documentation, curated stay access passes, and support contact tokens are delivered directly to your customized Triplova dashboard and registered email account instantly.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    final isTablet = ResponsiveBreakpoints.of(context).isTablet;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkBg : AppColors.lightBg,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 24 : 80,
        vertical: isMobile ? 60 : 100,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sub-header
          Text(
            'FREQUENTLY ASKED QUESTIONS',
            style: TextStyle(
              color: AppColors.gold,
              fontWeight: FontWeight.w900,
              letterSpacing: 2.0,
              fontSize: isMobile ? 12 : 14,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.1),

          const SizedBox(height: 12),

          // Main Header
          Text(
            'Common Questions About Triplova',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : AppColors.primaryDark,
                  fontSize: isMobile ? 28 : 38,
                ),
          ).animate().fadeIn(delay: 200.ms, duration: 600.ms).slideY(begin: 0.1),

          const SizedBox(height: 60),

          // Split Layout: Left Illustration, Right Accordions
          if (isMobile || isTablet)
            Column(
              children: [
                _buildIllustration(isMobile),
                const SizedBox(height: 48),
                _buildAccordions(isDark),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: _buildIllustration(false),
                ),
                const SizedBox(width: 80),
                Expanded(
                  flex: 7,
                  child: _buildAccordions(isDark),
                ),
              ],
            ),
        ],
      ),
    );
  }

  Widget _buildIllustration(bool isMobile) {
    return Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withAlpha(15),
              blurRadius: 30,
              offset: const Offset(0, 15),
            ),
          ],
          border: Border.all(color: Colors.grey.shade100),
        ),
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.gold.withAlpha(50), width: 3),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1486312338219-ce68d2c6f44d?q=80&w=400&auto=format&fit=crop',
                      height: 120,
                      width: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.question_answer_outlined,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              'Have More Questions?',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: AppColors.primaryDark,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Our personalized support team is always available to clarify your luxury itinerary.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade600,
                fontSize: 13,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.primary,
                side: const BorderSide(color: AppColors.primary),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Contact Support', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ).animate().scale(delay: 400.ms, duration: 600.ms, curve: Curves.easeOutBack),
    );
  }

  Widget _buildAccordions(bool isDark) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _faqs.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final faq = _faqs[index];
        final isExpanded = _expandedIndex == index;

        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          decoration: BoxDecoration(
            color: isDark ? AppColors.darkSurface : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isExpanded
                  ? AppColors.primary
                  : (isDark ? Colors.white12 : Colors.grey.shade200),
              width: isExpanded ? 1.5 : 1.0,
            ),
            boxShadow: isExpanded
                ? [
                    BoxShadow(
                      color: AppColors.primary.withAlpha(15),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    )
                  ]
                : [],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _expandedIndex = isExpanded ? null : index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              faq['question']!,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: isExpanded
                                    ? AppColors.primary
                                    : (isDark ? Colors.white : AppColors.primaryDark),
                              ),
                            ),
                          ),
                          Icon(
                            isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                            color: isExpanded
                                ? AppColors.primary
                                : (isDark ? Colors.white54 : Colors.grey.shade400),
                          ),
                        ],
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                        child: isExpanded
                            ? Padding(
                                padding: const EdgeInsets.only(top: 12),
                                child: Text(
                                  faq['answer']!,
                                  style: TextStyle(
                                    color: isDark ? Colors.white70 : Colors.grey.shade600,
                                    height: 1.5,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    ).animate().fadeIn(delay: 400.ms, duration: 600.ms);
  }
}

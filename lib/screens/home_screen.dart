import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final String email;

  const HomeScreen({
    super.key,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 700;

    // Get the user name from the email
    final userName = email.split('@')[0];
    final capitalizedName = userName.isNotEmpty
        ? userName[0].toUpperCase() + userName.substring(1)
        : 'User';

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A), // Slate 900
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B), // Slate 800
        elevation: 0,
        title: const Row(
          children: [
            Icon(Icons.dashboard_rounded, color: Color(0xFF818CF8)),
            SizedBox(width: 10),
            Text(
              'DeveloperHub Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded, color: Color(0xFFF87171)),
            tooltip: 'Logout',
            onPressed: () {
              // Navigates back to the Login Screen
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner (Container with Gradient)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4F46E5), // Indigo 600
                      Color(0xFF7C3AED), // Violet 600
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF4F46E5).withAlpha(64),
                      blurRadius: 20,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(50),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.waving_hand_rounded,
                            color: Colors.amber,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'WELCOME BACK',
                          style: TextStyle(
                            color: Color(0xFFC7D2FE), // Indigo 200
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Hello, $capitalizedName!',
                      style: theme.textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'You are logged in as $email',
                      style: const TextStyle(
                        color: Color(0xFFE0E7FF), // Indigo 100
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // Overview Section Title
              const Text(
                'Performance Overview',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 20),

              // Stats Cards (Row/Wrap/Column depending on screen size)
              if (isDesktop)
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        title: 'Completed Assignments',
                        value: '3 / 3',
                        subtitle: '100% Progress',
                        icon: Icons.assignment_turned_in_rounded,
                        accentColor: const Color(0xFF34D399), // Emerald 400
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        title: 'Active Learning Hours',
                        value: '24.5 hrs',
                        subtitle: '+4.2 hrs this week',
                        icon: Icons.timer_outlined,
                        accentColor: const Color(0xFF60A5FA), // Blue 400
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        title: 'Skill Score',
                        value: '98%',
                        subtitle: 'Top 5% overall',
                        icon: Icons.workspace_premium_rounded,
                        accentColor: const Color(0xFFFBBF24), // Amber 400
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildStatCard(
                      title: 'Completed Assignments',
                      value: '3 / 3',
                      subtitle: '100% Progress',
                      icon: Icons.assignment_turned_in_rounded,
                      accentColor: const Color(0xFF34D399),
                    ),
                    const SizedBox(height: 16),
                    _buildStatCard(
                      title: 'Active Learning Hours',
                      value: '24.5 hrs',
                      subtitle: '+4.2 hrs this week',
                      icon: Icons.timer_outlined,
                      accentColor: const Color(0xFF60A5FA),
                    ),
                    const SizedBox(height: 16),
                    _buildStatCard(
                      title: 'Skill Score',
                      value: '98%',
                      subtitle: 'Top 5% overall',
                      icon: Icons.workspace_premium_rounded,
                      accentColor: const Color(0xFFFBBF24),
                    ),
                  ],
                ),
              
              const SizedBox(height: 32),

              // Bottom Action Panel
              Center(
                child: SizedBox(
                  width: 200,
                  height: 48,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
                    label: const Text(
                      'Logout & Return',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E293B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Color(0xFF334155), width: 1.5),
                      ),
                      elevation: 0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color accentColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B), // Slate 800
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: const Color(0xFF334155), // Slate 700
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF94A3B8), // Slate 400
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Icon(
                icon,
                color: accentColor,
                size: 24,
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: TextStyle(
              color: accentColor.withAlpha(200),
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

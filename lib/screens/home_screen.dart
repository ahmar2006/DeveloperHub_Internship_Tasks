import 'package:flutter/material.dart';
import 'counter_screen.dart';
import 'todo_screen.dart';

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

    final userName = email.split('@')[0];
    final capitalizedName = userName.isNotEmpty
        ? userName[0].toUpperCase() + userName.substring(1)
        : 'User';

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
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
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(28.0),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF4F46E5),
                      Color(0xFF7C3AED),
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
                            color: Color(0xFFC7D2FE),
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
                        color: Color(0xFFE0E7FF),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),

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

              if (isDesktop)
                Row(
                  children: [
                    Expanded(
                      child: _buildStatCard(
                        title: 'Completed Assignments',
                        value: '3 / 3',
                        subtitle: '100% Progress',
                        icon: Icons.assignment_turned_in_rounded,
                        accentColor: const Color(0xFF34D399),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        title: 'Active Learning Hours',
                        value: '24.5 hrs',
                        subtitle: '+4.2 hrs this week',
                        icon: Icons.timer_outlined,
                        accentColor: const Color(0xFF60A5FA),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildStatCard(
                        title: 'Skill Score',
                        value: '98%',
                        subtitle: 'Top 5% overall',
                        icon: Icons.workspace_premium_rounded,
                        accentColor: const Color(0xFFFBBF24),
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

              const Text(
                'Interactive Modules',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 20),

              if (isDesktop)
                Row(
                  children: [
                    Expanded(
                      child: _buildModuleTile(
                        context: context,
                        title: 'Persistent Counter',
                        subtitle: 'Counter management with SharedPreferences storage',
                        icon: Icons.exposure_rounded,
                        color: const Color(0xFF6366F1),
                        screen: const CounterScreen(),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildModuleTile(
                        context: context,
                        title: 'To-Do Task Board',
                        subtitle: 'Task board manager with local task list storage',
                        icon: Icons.format_list_bulleted_rounded,
                        color: const Color(0xFFEC4899),
                        screen: const TodoScreen(),
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    _buildModuleTile(
                      context: context,
                      title: 'Persistent Counter',
                      subtitle: 'Counter management with SharedPreferences storage',
                      icon: Icons.exposure_rounded,
                      color: const Color(0xFF6366F1),
                      screen: const CounterScreen(),
                    ),
                    const SizedBox(height: 16),
                    _buildModuleTile(
                      context: context,
                      title: 'To-Do Task Board',
                      subtitle: 'Task board manager with local task list storage',
                      icon: Icons.format_list_bulleted_rounded,
                      color: const Color(0xFFEC4899),
                      screen: const TodoScreen(),
                    ),
                  ],
                ),

              const SizedBox(height: 48),

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
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16.0),
        border: Border.all(
          color: const Color(0xFF334155),
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
                  color: Color(0xFF94A3B8),
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

  Widget _buildModuleTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required Widget screen,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(
          color: const Color(0xFF334155),
          width: 1.5,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen),
            );
          },
          borderRadius: BorderRadius.circular(20.0),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: color.withAlpha(38),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    color: color,
                    size: 32,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xFF475569),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

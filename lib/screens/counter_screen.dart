import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _loadCounter();
  }

  Future<void> _loadCounter() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter = prefs.getInt('counter_value') ?? 0;
    });
  }

  Future<void> _updateCounter(int delta) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _counter += delta;
      prefs.setInt('counter_value', _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: const Color(0xFF0F172A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1E293B),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Persistent Counter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
            decoration: BoxDecoration(
              color: const Color(0xFF1E293B),
              borderRadius: BorderRadius.circular(24.0),
              border: Border.all(
                color: const Color(0xFF334155),
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(51),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    color: Color(0xFF312E81),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.add_task_rounded,
                    color: Color(0xFF818CF8),
                    size: 32,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'Current Counter Value',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '$_counter',
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 72,
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Value is saved automatically to local storage',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildActionButton(
                      icon: Icons.remove_rounded,
                      color: const Color(0xFFEF4444),
                      onPressed: () => _updateCounter(-1),
                    ),
                    const SizedBox(width: 32),
                    _buildActionButton(
                      icon: Icons.add_rounded,
                      color: const Color(0xFF34D399),
                      onPressed: () => _updateCounter(1),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 64,
      height: 64,
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        shape: BoxShape.circle,
        border: Border.all(
          color: color.withAlpha(127),
          width: 2.0,
        ),
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: 28),
        onPressed: onPressed,
      ),
    );
  }
}

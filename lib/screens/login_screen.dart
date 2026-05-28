import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(milliseconds: 1200), () {
        if (mounted) {
          setState(() {
            _isLoading = false;
          });
          
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(email: _emailController.text),
            ),
          );
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final isDesktop = size.width > 600;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF0F172A),
                  Color(0xFF1E1B4B),
                  Color(0xFF311042),
                ],
              ),
            ),
          ),
          
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF6366F1),
              ),
            ),
          ),
          Positioned(
            bottom: -50,
            left: -50,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFEC4899),
              ),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                width: isDesktop ? 450 : size.width,
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(24.0),
                  border: Border.all(
                    color: const Color(0xFF475569),
                    width: 1.5,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(76),
                      blurRadius: 30,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(16),
                              decoration: const BoxDecoration(
                                color: Color(0xFF6366F1),
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                Icons.lock_outline_rounded,
                                color: Color(0xFF818CF8),
                                size: 40,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Welcome Back',
                              style: theme.textTheme.headlineMedium?.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.5,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Please enter your credentials to login',
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: const Color(0xFF94A3B8),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      const Text(
                        'Email Address',
                        style: TextStyle(
                          color: Color(0xFFCBD5E1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.mail_outline_rounded, color: Color(0xFF818CF8)),
                          hintText: 'name@example.com',
                          hintStyle: const TextStyle(color: Color(0xFF64748B)),
                          filled: true,
                          fillColor: const Color(0xFF0F172A),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFF475569)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFF334155)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFF818CF8), width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFFEF4444)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Email address is required';
                          }
                          final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          );
                          if (!emailRegex.hasMatch(value.trim())) {
                            return 'Please enter a valid email address';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'Password',
                        style: TextStyle(
                          color: Color(0xFFCBD5E1),
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: !_isPasswordVisible,
                        style: const TextStyle(color: Colors.white),
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (_) => _handleLogin(),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock_outline_rounded, color: Color(0xFF818CF8)),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isPasswordVisible
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: const Color(0xFF64748B),
                            ),
                            onPressed: () {
                              setState(() {
                                _isPasswordVisible = !_isPasswordVisible;
                              });
                            },
                          ),
                          hintText: 'Enter your password',
                          hintStyle: const TextStyle(color: Color(0xFF64748B)),
                          filled: true,
                          fillColor: const Color(0xFF0F172A),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFF475569)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFF334155)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFF818CF8), width: 2.0),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFFEF4444)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            borderSide: const BorderSide(color: Color(0xFFEF4444), width: 2.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Password is required';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text(
                                  'Password recovery email has been sent! (Simulation)',
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: const Color(0xFF6366F1),
                                behavior: SnackBarBehavior.floating,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: const Size(50, 30),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              color: Color(0xFF818CF8),
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),

                      SizedBox(
                        width: double.infinity,
                        height: 52,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color(0xFF6366F1),
                                Color(0xFF4F46E5),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(12.0),
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF6366F1),
                                blurRadius: 12,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: TextButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              backgroundColor: Colors.transparent,
                              padding: const EdgeInsets.symmetric(vertical: 12.0),
                            ),
                            child: _isLoading
                                ? const SizedBox(
                                    width: 24,
                                    height: 24,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2.5,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : const Text(
                                    'Login to Dashboard',
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '../../../../core/routes/app_routes.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/wavy_header.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;

  void _login() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    
    if (mounted) {
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WavyHeader(title: 'Login UserMaster ', icon: Icons.lock_outline),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  const CustomTextField(label: 'Email', icon: Icons.email_outlined),
                  const CustomTextField(
                    label: 'Password', 
                    icon: Icons.lock_outline, 
                    isPassword: true
                  ),
                  const SizedBox(height: 20),
                  _isLoading 
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          )
                        ),
                        child: const Text('Ingresar'),
                      ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.forgotPass),
                    child: const Text('Forgot password?'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, AppRoutes.register),
                    child: const Text('¿No tienes cuenta? Regístrate'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../core/theme/app_colors.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _logout(BuildContext context) {
    // Destruye todo el historial de rutas y empuja el Login
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 60,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, size: 80, color: Colors.white),
              ),
              const SizedBox(height: 24),
              const Text(
                'Carlos Castro', // Puedes dejarlo genérico o usar tu nombre
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'carlos.castro@example.com',
                style: TextStyle(fontSize: 16, color: AppColors.textSecondary),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon(
                onPressed: () => _logout(context),
                icon: const Icon(Icons.exit_to_app, color: Colors.white),
                label: const Text('Cerrar sesión', style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.error,
                  minimumSize: const Size(double.infinity, 50),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Recuperar contraseña')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono agregado con el mismo estilo del login
              const Icon(Icons.lock_reset, size: 80, color: Colors.blueGrey),
              const SizedBox(height: 30),
              const Text(
                'Ingresa tu correo y te enviaremos un enlace para restablecer tu contraseña.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 30),
              const CustomTextField(label: 'Correo electrónico', icon: Icons.email),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Enlace de recuperación enviado'),
                      backgroundColor: Colors.blue,
                    ),
                  );
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text('Enviar enlace'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
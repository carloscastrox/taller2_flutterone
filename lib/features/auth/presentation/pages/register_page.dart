import 'package:flutter/material.dart';
import '../widgets/custom_textfield.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();
  bool _isLoading = false;

  void _register() async {
    if (_passController.text != _confirmPassController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Las contraseñas no coinciden'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() => _isLoading = true);
    // Simular registro
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Cuenta creada exitosamente'),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context); // Regresa al Login
    }
  }

  @override
  void dispose() {
    _passController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icono y título agregados para mantener el estilo
              const Icon(Icons.person_add, size: 80, color: Colors.blueGrey),
              const SizedBox(height: 20),
              const Text(
                'Crea tu cuenta', 
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
              ),
              const SizedBox(height: 30),
              
              // Campos del formulario
              const CustomTextField(label: 'Nombre completo', icon: Icons.person),
              const CustomTextField(label: 'Correo electrónico', icon: Icons.email),
              CustomTextField(
                label: 'Contraseña', 
                icon: Icons.lock, 
                isPassword: true,
                controller: _passController,
              ),
              CustomTextField(
                label: 'Confirmar contraseña', 
                icon: Icons.lock_outline, 
                isPassword: true,
                controller: _confirmPassController,
              ),
              const SizedBox(height: 20),
              
              // Botón de registro
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _register,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: const Text('Crear cuenta'),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
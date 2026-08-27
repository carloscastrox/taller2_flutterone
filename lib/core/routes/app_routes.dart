import 'package:flutter/material.dart';
import '../../features/splash/presentation/pages/splash_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/forgot_pass_page.dart';
import '../../features/dashboard/presentation/pages/dashboard_page.dart';

class AppRoutes {
  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPass = '/forgot';
  static const String dashboard = '/dashboard';

  static Map<String, WidgetBuilder> get routes => {
    splash: (context) => const SplashPage(),
    login: (context) => const LoginPage(),
    register: (context) => const RegisterPage(),
    forgotPass: (context) => const ForgotPasswordPage(),
    dashboard: (context) => const DashboardPage(),
  };
}

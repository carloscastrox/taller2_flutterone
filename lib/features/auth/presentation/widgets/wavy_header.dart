import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class WavyHeader extends StatelessWidget {
  final String title;
  final IconData? icon;

  const WavyHeader({super.key, required this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: _WavyHeaderClipper(),
      child: Container(
        height: 350, // Aumentamos la altura para acomodar el icono
        width: double.infinity,
        color: AppColors.primary,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                Icon(icon, size: 65, color: Colors.white),
                const SizedBox(height: 10),
              ],
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ), // Empuja el contenido un poco hacia arriba de la curva
            ],
          ),
        ),
      ),
    );
  }
}

class _WavyHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 40);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstEndPoint = Offset(size.width / 2, size.height - 20);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint = Offset(
      size.width - (size.width / 4),
      size.height - 40,
    );
    var secondEndPoint = Offset(size.width, size.height - 10);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

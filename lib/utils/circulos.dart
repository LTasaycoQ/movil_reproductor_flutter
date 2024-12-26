import 'package:flutter/material.dart';

class TresCirculosPage extends StatelessWidget {
  const TresCirculosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -140,
          left: 200,
          child: _buildCircle(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 117, 6, 76),
                const Color.fromARGB(255, 255, 0, 136),
                const Color.fromARGB(255, 249, 229, 240)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
            size: 300,
          ),
        ),
        Positioned(
          top: 70,
          left: 60,
          child: _buildCircle(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 117, 49, 6),
                const Color.fromARGB(255, 236, 114, 14),
                const Color.fromARGB(255, 249, 229, 240)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
            size: 45,
          ),
        ),
        Positioned(
          top: 150,
          left: -35,
          child: _buildCircle(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 94, 3, 46),
                const Color.fromARGB(255, 205, 11, 102),
                const Color.fromARGB(255, 249, 229, 240)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomLeft,
            ),
            size: 100,
          ),
        ),
      ],
    );
  }

  Widget _buildCircle(
      {Color? color, Gradient? gradient, required double size}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        shape: BoxShape.circle,
      ),
    );
  }
}
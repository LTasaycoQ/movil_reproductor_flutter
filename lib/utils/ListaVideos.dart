import 'package:flutter/material.dart';

class ListaVideosUtils extends StatelessWidget {
  const ListaVideosUtils({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.0,
        ),
        _buildLista(color: Colors.amber),
        SizedBox(
          height: 10.0,
        ),
        _buildLista(color: Colors.blueAccent),
        SizedBox(
          height: 10.0,
        ),
        _buildLista(color: Colors.green),
        SizedBox(
          height: 10.0,
        ),
        _buildLista(color: Colors.red),
        SizedBox(
          height: 10.0,
        ),
        _buildLista(color: const Color.fromARGB(255, 158, 54, 244)),
        SizedBox(
          height: 10.0,
        ),
        _buildLista(color: const Color.fromARGB(255, 165, 244, 54)),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }

  Widget _buildLista({
    Color? color,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Viedeo lista numero que loco 2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Viedeo lista numero 2",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
        Icon(
          Icons.add_box,
          color: Colors.white,
        ),
      ],
    );
  }
}
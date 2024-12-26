import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/ListaVideos.dart';
import 'package:flutter_application_1/utils/VideosUtils.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(18.0),
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Container(
          child: Column(
            children: [
              SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "Luis Angel Tasayco Quispe",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 55.0,
                    height: 55.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50.0),
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/avatar.png"),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 18.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: VidesUtils(),
              ),
              SizedBox(
                height: 22.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mis Lista de Videos",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900),
                  ),
                  Container(
                    width: 35.0,
                    height: 35.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/IconoReproductor.png"),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: ListaVideosUtils(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

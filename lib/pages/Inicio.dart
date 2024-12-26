import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/circulos.dart';


class InicioPage extends StatefulWidget {
  @override
  State<InicioPage> createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(106, 0, 0, 0),
          ),
          child: Center(
              child: Stack(
            children: [
           TresCirculosPage(),
            
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 40,),
                    Container(
                      width: 170.0,
                      height: 170.0,
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color.fromARGB(255, 0, 242, 255),
                          width: 5.0,
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromARGB(0, 0, 255, 221),
                            width: 5.0,
                          ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/avatar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "Luis Angel Tasayco",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      width: 30.0,
                      height: 30.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/flutter.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100.0,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, "Home");
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(Size(170, 44)),
                        backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 255, 0, 136),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/inicioFondo.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
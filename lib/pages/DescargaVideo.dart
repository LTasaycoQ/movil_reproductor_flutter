import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/download_Video_Model.dart';
import 'package:flutter_application_1/pages/reproductor_api.dart';
import 'package:flutter_application_1/service/download_service.dart';

class DescargaPage extends StatefulWidget {
  @override
  State<DescargaPage> createState() => _DescargaPageState();
}

class _DescargaPageState extends State<DescargaPage> {
  final TextEditingController _controller = TextEditingController();
  VideoData? _videoData;
  bool _isLoading = false;

  void _getVideoData() async {
    setState(() {
      _isLoading = true;
    });

    String url = _controller.text;

    try {
      VideoData? data = await fetchVideoData(url);
      setState(() {
        _videoData = data;
      });
    } catch (e) {
      print('Error al obtener datos: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

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
                height: 30.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Coloca el Enlace",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w900),
                  ),
                  Row(
                    children: [
                      Icon(Icons.tiktok),
                      SizedBox(width: 10.0),
                      Icon(Icons.facebook_outlined),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    hintText: "https://example.Vkadsfaj.com",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              ElevatedButton(
                onPressed: _getVideoData,
                style: ButtonStyle(
                  minimumSize:
                      MaterialStateProperty.all(Size(double.infinity, 50)),
                  backgroundColor: MaterialStatePropertyAll(
                    const Color.fromARGB(255, 255, 7, 102),
                  ),
                ),
                child: Text(
                  "Descargar",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_isLoading) CircularProgressIndicator(),
                      if (_videoData != null) ...[
                        Text(
                          "Creador del Video",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w900,
                            fontSize: 18.0,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 138, 8, 47),
                                Color.fromARGB(255, 255, 1, 77),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15.0),
                                width: 70,
                                height: 70,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: NetworkImage(_videoData!.avatar),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 160.0,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Text(
                                                _videoData!.titulo,
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 248, 248, 248),
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        width: 130.0,
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Row(
                                            children: [
                                              Text(
                                                _videoData!.nickname,
                                                style: TextStyle(
                                                    color: const Color.fromARGB(
                                                        255, 243, 243, 243),
                                                    fontWeight: FontWeight.w300,
                                                    fontSize: 18.0),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Video MP4",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.5,
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(_videoData!.portada),
                                    ),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(108, 0, 0, 0),
                                    ),
                                    child: Center(
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => VideoScreen(
                                                videoUrl:
                                                    _videoData!.descargaVideo,
                                                videoTitulo: _videoData!.titulo,
                                                videoNickname:
                                                    _videoData!.nickname,
                                              ),
                                            ),
                                          );
                                        },
                                        child: Icon(
                                          Icons.play_arrow_rounded,
                                          size: 30.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Container(
                                  width: 240.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Text(
                                              _videoData!.titulo,
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 243, 243, 243),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        _videoData!.nickname,
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 243, 243, 243),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.open_with_rounded,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          "Musica MP4",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 16.5,
                          ),
                        ),
                        SizedBox(height: 14.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 50.0,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(_videoData!.portada)),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(108, 0, 0, 0),
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.music_note_rounded,
                                        size: 30.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16.0,
                                ),
                                Container(
                                  width: 240.0,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Text(
                                              _videoData!.titulo,
                                              style: TextStyle(
                                                  color: const Color.fromARGB(
                                                      255, 243, 243, 243),
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16.0),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        _videoData!.nickname,
                                        style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 243, 243, 243),
                                            fontWeight: FontWeight.w400,
                                            fontSize: 13.0),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.open_with_rounded,
                              color: Colors.white,
                              size: 20.0,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class VideoScreen extends StatefulWidget {
  final String videoUrl;
  final String videoTitulo;
  final String videoNickname;

  const VideoScreen(
      {super.key,
      required this.videoUrl,
      required this.videoTitulo,
      required this.videoNickname});

  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  late VideoPlayerController _controller;
  double _volume = 1.0;
  bool _isDownloading = false;
  double _downloadProgress = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _togglePlayPause() {
    setState(() {
      _controller.value.isPlaying ? _controller.pause() : _controller.play();
    });
  }

  void _setVolume(double volume) {
    setState(() {
      _volume = volume;
      _controller.setVolume(volume);
    });
  }

  Future<void> _downloadVideo() async {
    // Solicitar permisos de almacenamiento
    PermissionStatus permissionStatus = await Permission.storage.request();

    if (permissionStatus.isGranted) {
      setState(() {
        _isDownloading = true;
      });

      try {
        final dio = Dio();
        // Obtiene el directorio del almacenamiento externo (en este caso la carpeta "Download")
        final dir = await getExternalStorageDirectory();
        final downloadDir =
            Directory('${dir?.path}/Download'); // Carpeta "Download"

        // Crea la carpeta si no existe
        if (!await downloadDir.exists()) {
          await downloadDir.create(recursive: true);
        }

        // Define la ruta completa del archivo
        final filePath = "${downloadDir.path}/${widget.videoTitulo}.mp4";

        // Descarga el video
        await dio.download(
          widget.videoUrl,
          filePath,
          onReceiveProgress: (received, total) {
            setState(() {
              _downloadProgress = received / total;
            });
          },
        );

        setState(() {
          _isDownloading = false;
          _downloadProgress = 0.0;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Video descargado en: $filePath'),
        ));
      } catch (e) {
        setState(() {
          _isDownloading = false;
          _downloadProgress = 0.0;
        });

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Error al descargar el video: $e'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Permiso de almacenamiento denegado'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Cabecera (que no se centra)
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            padding: const EdgeInsets.only(top: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.coffee, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.more_vert, color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Contenido principal centrado
          Expanded(
            child: Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centra los elementos
                  children: [
                    const SizedBox(height: 20.0),
                    Container(
                      decoration:
                          BoxDecoration(color: Color.fromARGB(255, 20, 20, 20)),
                      margin: const EdgeInsets.only(bottom: 28.0),
                      padding: const EdgeInsets.only(left: 100.0, right: 100.0),
                      width: double.infinity,
                      height: 350.0,
                      child: _controller.value.isInitialized
                          ? ClipRRect(
                              child: AspectRatio(
                                aspectRatio: _controller.value.aspectRatio,
                                child: VideoPlayer(_controller),
                              ),
                            )
                          : const Center(child: CircularProgressIndicator()),
                    ),
                    Container(
                      width: 360.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 12.0),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Text(
                                  widget.videoTitulo,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            widget.videoNickname,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    SizedBox(
                      width: 360.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_controller.value.isInitialized) ...[
                            SizedBox(
                              height: 8.0,
                              child: VideoProgressIndicator(
                                _controller,
                                allowScrubbing: true,
                                colors: const VideoProgressColors(
                                  playedColor:
                                      Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                            ),
                          ],
                          const SizedBox(height: 20.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.volume_up,
                                color: Colors.white,
                              ),
                              Slider(
                                value: _volume,
                                min: 0.0,
                                max: 1.0,
                                onChanged: _setVolume,
                                activeColor: Colors.white,
                                inactiveColor: Colors.grey,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.fullscreen),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FullScreenVideo(
                                    controller: _controller,
                                  ),
                                ),
                              );
                            },
                            color: Colors.white,
                          ),
                          Container(
                            width: 60.0,
                            height: 60.0,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                            child: IconButton(
                              icon: Icon(
                                _controller.value.isPlaying
                                    ? Icons.pause
                                    : Icons.play_arrow,
                              ),
                              onPressed: _togglePlayPause,
                              color: const Color.fromARGB(255, 31, 31, 31),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.download),
                            onPressed: _isDownloading ? null : _downloadVideo,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    if (_isDownloading)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: LinearProgressIndicator(
                          value: _downloadProgress,
                          backgroundColor: Colors.grey,
                          color: Colors.white,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FullScreenVideo extends StatelessWidget {
  final VideoPlayerController controller;

  const FullScreenVideo({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: AspectRatio(
              aspectRatio: controller.value.aspectRatio,
              child: VideoPlayer(controller),
            ),
          ),
          Positioned(
            top: 30,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 30),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}

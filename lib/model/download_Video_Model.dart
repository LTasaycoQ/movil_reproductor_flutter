class VideoData {
  final String enlaceVideo;
  final String titulo;
  final String portada;
  final String descargaVideo;
  final String descargaAudio;
  final String avatar;
  final String dominio;
  final String picture;
  final String nickname;

  VideoData({
    required this.enlaceVideo,
    required this.titulo,
    required this.portada,
    required this.descargaVideo,
    required this.descargaAudio,
    required this.avatar,
    required this.dominio,
    required this.picture,
    required this.nickname,
  });

  factory VideoData.fromJson(Map<String, dynamic> json) {
    return VideoData(
      enlaceVideo: json['enlace_video'] ?? '',
      titulo: json['titulo'] ?? 'Sin título',
      portada: json['Portada'] ?? '',
      descargaVideo: json['descarga_video'] ?? '',
      descargaAudio: json['descarga_audio'] ?? '',
      avatar: json['Avatar'] ?? '',
      picture: json['Picture'] ?? '',
      dominio: json['Dominio'] ?? '',
      nickname: json['Nickname'] ?? 'Desconocido',
    );
  }
}

// To parse this JSON data, do
//
//     final artworkodel = artworkodelFromJson(jsonString);

import 'dart:convert';

List<Artworkodel> artworkodelFromJson(String str) => List<Artworkodel>.from(json.decode(str).map((x) => Artworkodel.fromJson(x)));


class Artworkodel {
  Artworkodel({
    this.id,
    this.author,
    this.width,
    this.height,
    this.url,
    this.downloadUrl,
  });

  final String ?id;
  final String ?author;
  final int ?width;
  final int ?height;
  final String ?url;
  final String ?downloadUrl;

  factory Artworkodel.fromJson(Map<String, dynamic> json) => Artworkodel(
    id: json["id"],
    author: json["author"],
    width: json["width"],
    height: json["height"],
    url: json["url"],
    downloadUrl: json["download_url"],
  );


}

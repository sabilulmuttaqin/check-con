// To parse this JSON data, do
//
//     final codelab = codelabFromJson(jsonString);

import 'dart:convert';

Codelab codelabFromJson(String str) => Codelab.fromJson(json.decode(str));

String codelabToJson(Codelab data) => json.encode(data.toJson());

class Codelab {
  Status status;
  List<Article> articles;

  Codelab({
    required this.status,
    required this.articles,
  });

  factory Codelab.fromJson(Map<String, dynamic> json) => Codelab(
        status: Status.fromJson(json["status"]),
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status.toJson(),
        "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  int id;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article({
    required this.id,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        id: json["id"],
        author: json["author"],
        title: json["title"],
        description: json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Status {
  String status;

  Status({
    required this.status,
  });

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
      };
}

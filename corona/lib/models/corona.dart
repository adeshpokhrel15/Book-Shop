class Corona {
  late String? created_at;
  late String? url;
  late String? title;
  late String? source;
  late String? summary;
  late String? image_url;

  Corona(
      {this.created_at,
      this.url,
      this.title,
      this.source,
      this.summary,
      this.image_url});

  factory Corona.fromJson(Map<String, dynamic> json) {
    return Corona(
      created_at: json['created_at'] ?? '',
      url: json['url'] ?? '',
      title: json['title'] ?? '',
      source: json['source'] ?? '',
      summary: json['summary'] ?? '',
      image_url: json['image_url'] ??
          'https://www.discounttractors.net/images/covid19.png',
    );
  }
}

class NewsItem {
  String? id;
  String? type;
  String? sectionId;
  String? sectionName;
  String? webPublicationDate;
  String? webTitle;
  String? webUrl;
  String? apiUrl;
  bool? isHosted;
  String? pillarId;
  String? pillarName;

  NewsItem({
    this.id,
    this.type,
    this.sectionId,
    this.sectionName,
    this.webPublicationDate,
    this.webTitle,
    this.webUrl,
    this.apiUrl,
    this.isHosted,
    this.pillarId,
    this.pillarName,
  });

  NewsItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    webPublicationDate = json['webPublicationDate'];
    webTitle = json['webTitle'];
    webUrl = json['webUrl'];
    apiUrl = json['apiUrl'];
    isHosted = json['isHosted'];
    pillarId = json['pillarId'];
    pillarName = json['pillarName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['sectionId'] = sectionId;
    data['sectionName'] = sectionName;
    data['webPublicationDate'] = webPublicationDate;
    data['webTitle'] = webTitle;
    data['webUrl'] = webUrl;
    data['apiUrl'] = apiUrl;
    data['isHosted'] = isHosted;
    data['pillarId'] = pillarId;
    data['pillarName'] = pillarName;
    return data;
  }
}

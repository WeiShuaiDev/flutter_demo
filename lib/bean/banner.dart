class WanBanner {
  int id;
  String desc;
  String imagePath;
  int isVisible;
  String title;
  String url;

  WanBanner(
      this.id, this.desc, this.imagePath, this.isVisible, this.title, this.url);

  // 序列化
  WanBanner.formJson(Map<String, dynamic> json)
      : id = json['id'],
        desc = json['desc'],
        imagePath = json['imagePath'],
        isVisible = json['isVisible'],
        title = json['title'],
        url = json['url'];

  // 反序列化
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'desc': desc,
        'imagePath': imagePath,
        'isVisible': isVisible,
        'title': title,
        'url': url
      };

  @override
  String toString() {
    return "标题：$title - 封面图：$imagePath - 跳转URL：$url";
  }
}

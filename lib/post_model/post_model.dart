class PostModel {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body});



  // parse map to model
  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        userId: json['userId'] as int?,
        id: json['id'] as int?,
        title: json['title'] as String?,
        body: json['body'] as String?,
      );
  

  // model to json (caching/post/put/update) ....
  Future<Map<String, dynamic>> tojson() async => {
        'userID': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}

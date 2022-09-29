// 定義 Album model

class Album {
  final int userId;
  final int id;
  final String title;
  
  // constuctor
  // 當使用 ({}) 定義 constructor，這些 parameters 就被定義為 named optional
  // 這邊比較特別是有用 required 包起來，所以為必要
  const Album(
    {
      required this.userId,
      required this.id,
      required this.title
    }
  );

  // factory constructor 宣告 constructor 來讓 call 它 return 一個 object 而不是 new instance
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'], 
      id: json['id'], 
      title: json['title']
    );
  }
}
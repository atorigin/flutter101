import 'package:flutter/material.dart';
import 'package:flutter05/daos/album_dao.dart';
import 'package:flutter05/models/album.dart';

class AlbumScreen extends StatefulWidget {
  const AlbumScreen({super.key});

  @override
  State<AlbumScreen> createState() => _AlbumScreenState();
}

class _AlbumScreenState extends State<AlbumScreen> {
    // late 定義該變數要延遲 initialize，並且該變數值不能為 null，呼應前面的 dao 不能 return null
    late Future<Album> futureAlbum;
    
    // 取資料環節，可以看場景決定要何時向後端取資料，這邊都是要 override
    // 1. 在畫面初始化時就先 fetch Album Data，可以放在 initState()
    @override
    void initState() {
      super.initState();
      
    }

    // 2. 當 InheritedWidget 改變時，要重新 reloading 時，可以放在 didChangeDependencies()
    @override
    void didChangeDependencies() {
    super.didChangeDependencies();
    futureAlbum = AlbumDao().fetchAlbum();
  }

  // 不把 late Future<Album> 和 fetchAlbum 放在 build() 裡面是因為 Flutter 的 build 方法在 layout 重新渲染時都會觸發，因此放在裡面將每次都重新向 backend 取資料
  // 這樣會讓 application 變慢，因此放在外面讓資料被 cached 住，僅在頁面 layout 時，重新取用 cached 的資料加以渲染就好
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context , snapshot) {
            if(snapshot.hasData) {
              // 驚嘆號，不管該變數結果有無 null 值，請依照一般方式處理
              return Text(snapshot.data!.title);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            // By default , 展示 loading 效果
            return const CircularProgressIndicator();
          }),
        ),
    );
  }
}
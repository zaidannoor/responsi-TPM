import 'package:flutter/material.dart';
import 'package:responsi/api_datasource.dart';
import 'list_news_model.dart';
import 'detail_news_page.dart';

class ListNewsPage extends StatefulWidget {
  final String tema;
  const ListNewsPage({Key? key, required this.tema}) : super(key: key);

  @override
  State<ListNewsPage> createState() => _ListNewsPageState();
}

class _ListNewsPageState extends State<ListNewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('CNN ${widget.tema}'),)
      ),
      body: Container(
          // padding: EdgeInsets.all(8),
          child: FutureBuilder<List<Posts>>(
            future: ApiDatasource.instance.fetchData(widget.tema),
            builder:
                (BuildContext context, AsyncSnapshot<List<Posts>> snapshot) {
              if (snapshot.hasError) return Text('error');
              if (snapshot.hasData) {
                final posts = snapshot.data!;
                print(posts);
                return _buildNews(posts);
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            },
          )),
    );
  }

  Widget _buildNews(posts) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          final post = posts[index];
          return ListTile(
            minVerticalPadding: 10,
            leading: Image.network(post.thumbnail),
            title: Text(post.title, style: TextStyle(fontSize: 18)),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailNewsPage(
                        title: post.title, link: post.link, description: post.description,
                        date: post.pubDate, thumbnail: post.thumbnail
                        )));
            },
          );
        });
  }
}

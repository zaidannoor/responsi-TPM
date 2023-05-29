import 'package:flutter/material.dart';
import 'list_news_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            'https://cdn.cnnindonesia.com/cnnid/images/logo_cnn_fav.png',
            width: 200,
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
              child: Container(
            width: 270,
            // padding: EdgeInsets.all(10),
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 16, mainAxisSpacing: 16),
              children: [
                ElevatedButton(
                  
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListNewsPage(tema: 'terbaru')));
                  },
                  child: Text(
                    'Terbaru',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListNewsPage(tema: 'nasional')));
                  },
                  child: Text(
                    'Nasional',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListNewsPage(tema: 'olahraga')));
                  },
                  child: Text(
                    'Olahraga',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListNewsPage(tema: 'teknologi')));
                  },
                  child: Text(
                    'Teknologi',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    ));
  }
}

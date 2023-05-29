import 'package:flutter/material.dart';

// import 'package:url_launcher/url_launcher.dart';

class DetailNewsPage extends StatelessWidget {
  final String title;
  final String link;
  final String description;
  final String date;
  final String thumbnail;
  const DetailNewsPage(
      {Key? key,
      required this.title,
      required this.link,
      required this.description,
      required this.date,
      required this.thumbnail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CNN News'),
      ),
      body: Container(
        padding: EdgeInsets.all(7),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              date,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 14),
            ),
            Image.network(
              thumbnail,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10,
            ),
            Text(description),
            SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(builder: (context) => LoginPage()),
                // );
              },
              child: Text(
                "Baca selengkapnya...",
                textAlign: TextAlign.center,
                style: TextStyle(
                  
                  fontSize: 16.0,
                  color: Colors.red,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  
}

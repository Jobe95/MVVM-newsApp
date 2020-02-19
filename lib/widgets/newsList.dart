import 'package:flutter/material.dart';
import 'package:fresh_news/viewmodels/newsArticleViewModel.dart';

class NewsList extends StatelessWidget {
  final List<NewsArticleViewModel> articles;

  NewsList({this.articles});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        final article = articles[index];
        return ListTile(
          leading: Container(
            width: 100,
            height: 100,
            child: article.imageUrl == null
                ? Image.asset('images/bildHalsoHuset.jpg')
                : Image.network(article.imageUrl),
          ),
          title: Text(article.title),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:prueba_flutter/src/models/posts.dart';
import 'package:prueba_flutter/src/providers/comments.dart';

class Comments extends StatelessWidget {
  final commentsProviders = new CommentsProvider();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('Comentarios'),
        ),
        body: _renderList(context));
  }

  Widget _renderList(BuildContext context) {
    final Posts post = ModalRoute.of(context).settings.arguments;
    return FutureBuilder(
      future: commentsProviders.getComments(post.id),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.length == 0) {
            return Center(
              child: Text('No existen comentarios para este post.'),
            );
          } else {
            return ListView(children: _renderItems(snapshot.data, context));
          }
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  List<Widget> _renderItems(List<dynamic> data, BuildContext context) {
    return data.map((e) {
      return Column(
        children: [
          new ListTile(
            title: Text(e['name'] + ' ' + '<' + e['email'] + '>'),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Text(e['body']),
            ),
            leading: Text(e['id'], style: TextStyle(fontSize: 19.0)),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}

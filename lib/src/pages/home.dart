import 'package:flutter/material.dart';
import 'package:prueba_flutter/src/models/posts.dart';
import 'package:prueba_flutter/src/providers/posts.dart';

class Home extends StatelessWidget {
  final postsProvider = new PostsProvider();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: _renderList(),
    );
  }

  Widget _renderList() {
    return FutureBuilder(
      future: postsProvider.getPosts(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView(children: _renderItems(snapshot.data, context));
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
            title: Text(e['title']),
            subtitle: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: _renderSub(e),
            ),
            leading: Text(e['id'], style: TextStyle(fontSize: 19.0)),
            trailing: Icon(Icons.arrow_forward, size: 20, color: Colors.grey),
            onTap: () {
              Navigator.pushNamed(context, 'comments',
                  arguments:
                      Posts(e['id'], e['title'], e['user_id'], e['body']));
            },
          ),
          Divider()
        ],
      );
    }).toList();
  }

  Widget _renderSub(post) {
    final userId = post['user_id'];
    return FutureBuilder(
      future: postsProvider.getUser(userId),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Text(
              'Creado por ' +
                  snapshot.data['first_name'] +
                  ' ' +
                  snapshot.data['last_name'],
              style: TextStyle(fontWeight: FontWeight.w300));
        } else {
          return Text('');
        }
      },
    );
  }
}

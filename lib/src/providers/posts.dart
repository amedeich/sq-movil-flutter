
import 'dart:convert';

import 'package:http/http.dart' as http;

class PostsProvider {

  String _accessToken = 'HB-30z0K6Obcpn-jUuEyK4G6mDvDxcNCCM4Q';
  String _baseURL = 'gorest.co.in';

  Future getUser(userId) async {
    final url = Uri.https(_baseURL, 'public-api/users/$userId', {
      'access-token': _accessToken
    });
    final res = await http.get(url);
    final decodedData = json.decode(res.body);

    return decodedData['result'];
  }

  Future getPosts() async {
    final url = Uri.https(_baseURL, 'public-api/posts', {
      'access-token': _accessToken
    });

    final res = await http.get(url);
    final decodedData = json.decode(res.body);

    return decodedData['result'];

  }

}
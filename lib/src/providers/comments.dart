
import 'dart:convert';

import 'package:http/http.dart' as http;

class CommentsProvider {

  String _accessToken = 'HB-30z0K6Obcpn-jUuEyK4G6mDvDxcNCCM4Q';
  String _baseURL = 'gorest.co.in';

  Future getComments(postId) async {
    final url = Uri.https(_baseURL, 'public-api/comments', {
      'access-token': _accessToken,
      'post_id': postId
    });
    final res = await http.get(url);
    final decodedData = json.decode(res.body);

    return decodedData['result'];
  }

}
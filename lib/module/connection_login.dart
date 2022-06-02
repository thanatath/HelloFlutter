import 'dart:convert';
import 'package:http/http.dart' as http;


connect_login(String email,String passwd) async {

    // This example uses the Google Books API to search for books about http.
  // https://developers.google.com/books/docs/overview
  var url =
      Uri.https('userapi.vcaptcha.work', '/api/login', {'q': '{https}'});

  // Await the http get response, then decode the json-formatted response.
  Map data = {
    'email': email,
    'password': passwd
  };
  //encode Map to JSON
  var body = json.encode(data);
  var response = await http.post(url,
      headers: {"Content-Type": "application/json"},
      body: body
  );


var rs = jsonDecode(response.body);

 

return rs;
 

}
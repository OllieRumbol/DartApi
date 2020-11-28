import 'package:api/api.dart' as api;
import 'dart:io';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  await for (var request in server) {
    api.handleRequest(request);
  }
}
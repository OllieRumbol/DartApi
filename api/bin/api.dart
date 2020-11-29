import 'package:api/Models/service.dart';
import 'package:api/api.dart';
import 'dart:io';

Future main() async {
  var server = await HttpServer.bind(
    InternetAddress.loopbackIPv4,
    4040,
  );
  print('Listening on localhost:${server.port}');

  var apiRequests = ApiRequests(Service());

  await for (var request in server) {
    apiRequests.handleRequest(request);
  }
}

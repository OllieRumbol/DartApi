import 'dart:io';
import 'dart:convert';
import 'package:api/Models/service.dart';
import 'Models/Doctor.dart';

class ApiRequests {
  Service service;

  ApiRequests(this.service) {
    service.addTestData();
  }

  void handleRequest(HttpRequest request) {
    try {
      if (request.method == 'GET') {
        handleGet(request);
      } else if (request.method == 'POST') {
        handlePost(request);
      } else if (request.method == 'PUT') {
        handlePut(request);
      } else if (request.method == 'Delete') {
        handleDelete(request);
      } else {
        request.response
          ..statusCode = HttpStatus.methodNotAllowed
          ..write('Unsupported request: ${request.method}.')
          ..close();
      }
    } catch (e) {
      print('Exception in handleRequest: $e');
    }
    print('Request handled.');
  }

  void handleGet(HttpRequest request) async {
    if (request.uri.pathSegments.last == 'doctors') {
      handleGetDoctors(request);
    } else if (request.uri.pathSegments.last == 'appointments') {
    } else if (request.uri.pathSegments.last == 'patients') {
    } else {}

    await request.response.close();
  }

  void handlePost(HttpRequest request) async {
    await request.response.close();
  }

  void handlePut(HttpRequest request) async {
    await request.response.close();
  }

  void handleDelete(HttpRequest request) async {
    await request.response.close();
  }

  void addCorsHeaders(HttpResponse response) {
    response.headers.add('Access-Control-Allow-Origin', '*');
    response.headers.add('Access-Control-Allow-Methods', 'POST, OPTIONS');
    response.headers.add('Access-Control-Allow-Headers',
        'Origin, X-Requested-With, Content-Type, Accept');
  }

  void handleGetDoctors(HttpRequest request) {
    final id = request.uri.queryParameters['id'];
    request.response.statusCode = HttpStatus.ok;
    request.response.headers.contentType = ContentType.json;
    if (id != null) {
      request.response.write(json.encode(service.GetDoctorById(int.parse(id))));
    } else {
      request.response.write(json.encode(service.GetAllDoctors()));
    }
    print(id);
  }
}

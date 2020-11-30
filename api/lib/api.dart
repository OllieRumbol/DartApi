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
      handleGetDoctor(request);
    } else if (request.uri.pathSegments.last == 'appointments') {
      handleGetAppointment(request);
    } else if (request.uri.pathSegments.last == 'patients') {
      handleGetPatient(request);
    } else {
      request.response
        ..statusCode = HttpStatus.notAcceptable
        ..write('Unsupported query: ${request.uri.path}.')
        ..close();
    }

    await request.response.close();
  }

  void handlePost(HttpRequest request) async {
    if (request.uri.pathSegments.last == 'doctors') {
      handlePostDoctor(request);
    } else if (request.uri.pathSegments.last == 'appointments') {
      handlePostAppointment(request);
    } else if (request.uri.pathSegments.last == 'patients') {
      handlePostPatient(request);
    } else {
      request.response
        ..statusCode = HttpStatus.notAcceptable
        ..write('Unsupported query: ${request.uri.path}.');
    }

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

  void handleGetDoctor(HttpRequest request) {
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

  void handleGetAppointment(HttpRequest request) {}

  void handleGetPatient(HttpRequest request) {}

  void handlePostDoctor(HttpRequest request) async {
    var content = await utf8.decoder.bind(request).join();
    var data = jsonDecode(content) as Map;
    service.AddDoctor(
        data['name'], data['email'], data['phoneNumber'], data['speciality']);
  }

  void handlePostAppointment(HttpRequest request) {}

  void handlePostPatient(HttpRequest request) {}

  void handlePutDoctor(HttpRequest request) async {}

  void handlePutAppointment(HttpRequest request) {}

  void handlePutPatient(HttpRequest request) {}

  void handleDeleteDoctor(HttpRequest request) async {}

  void handleDeleteAppointment(HttpRequest request) {}

  void handleDeletePatient(HttpRequest request) {}
}

import 'dart:io';
import 'dart:convert';

void handleRequest(HttpRequest request) {
  try {
    if (request.method == 'GET') {
      handleGet(request);
    } else if (request.method == 'POST') {
      handlePost(request);
    } else if (request.method == 'PUT') {
      handlePut(request);
    } else if(request.method == 'Delete'){
      handleDelete(request);
    } else {
      // ···
    }
  } catch (e) {
    print('Exception in handleRequest: $e');
  }
  print('Request handled.');
}

void handleGet(HttpRequest request) async {
  request.response.write(json.encode({'Message': 'Hello World'}));
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

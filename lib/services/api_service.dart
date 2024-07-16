import 'package:http/http.dart'as http;
class ApiService{

  static  Future<http.Response> sendPostRequest(
      String baseUrl,
      Map<String, dynamic> params,
      Map<String, String> headers,
      ) async {
    var url = Uri.parse(baseUrl);
    try {
      var response = await http.post(
        url,
        body: params,
        headers: headers,
      );
      return response;
    } catch (e) {
      print('Error: $e');
      throw Exception(e);
    }
  }
  static  Future<http.Response> sendPutRawRequest(
      String baseUrl,
      String params,
      Map<String, String> headers,
      ) async {
    var url = Uri.parse(baseUrl);
    try {
      var response = await http.put(
        url,
        body: params,
        headers: headers,
      );
      return response;
    } catch (e) {
      print('Error: $e');
      throw Exception(e);
    }
  }
  static  Future<http.Response> sendPutRequest(
      String baseUrl,
      Map<String, dynamic> params,
      Map<String, String> headers,
      ) async {
    var url = Uri.parse(baseUrl);
    try {
      var response = await http.put(
        url,
        body: params,
        headers: headers,
      );
      return response;
    } catch (e) {
      print('Error: $e');
      throw Exception(e);
    }
  }

  static  Future<http.Response> sendGetRequest(
      String baseUrl,
      Map<String, String> headers,
      ) async {
    var url = Uri.parse(baseUrl);
    try {
      var response = await http.get(
        url,
        headers: headers,
      );
      return response;
    } catch (e) {
      print('Error: $e');
      throw Exception(e);
    }
  }
}
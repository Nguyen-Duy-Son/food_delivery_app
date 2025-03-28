import 'package:flutter_dotenv/flutter_dotenv.dart';
class AppConfigs {
  static final baseUrl = dotenv.env['API_URL'];
  static const timeout = 60; // 60s
  static const googleUrl = "https://maps.googleapis.com/maps/api";
  static const apiKey = "AIzaSyDt5tCg0sZivxxzAua9gNgkKnxUBvkttxw";
}

class DomainEnv {
  static String baseUrl = '';
}
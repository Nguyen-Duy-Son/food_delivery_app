import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:package_info/package_info.dart';

enum EnvironmentType { dev, prod }

class Environment {
  static EnvironmentType environmentType = EnvironmentType.dev;

  static Future<void> init() async {
    final packageInfo = await PackageInfo.fromPlatform();
    switch (packageInfo.packageName) {
      case "com.fooddelivery.app":
        await dotenv.load(fileName: '.env.prod');
        environmentType = EnvironmentType.prod;
        break;

      case "com.fooddelivery.app.dev":
        await dotenv.load(fileName: '.env.dev');
        environmentType = EnvironmentType.dev;
        break;
      default:
        await dotenv.load(fileName: '.env.dev');
        environmentType = EnvironmentType.dev;
        break;
    }
  }
}

import 'package:dotenv/dotenv.dart';

class Keys {
  //added your API Keys for local test
  static String? clientId(DotEnv env) => env['CLIENT_KEY'];
  //added your API Keys for local test
  static String? clientSecret(DotEnv env) => env['CLIENT_SECRET'];
}

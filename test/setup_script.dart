import 'package:dotenv/dotenv.dart' show env;

class Keys {
  //added your API Keys for local test
  static String? clientId = env['CLIENT_KEY'];
  //added your API Keys for local test
  static String? clientSecret = env['CLIENT_SECRET'];
}

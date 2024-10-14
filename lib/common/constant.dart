import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constant {
  Constant._();
  static final String? apikey = dotenv.env['API_KEY'];
}

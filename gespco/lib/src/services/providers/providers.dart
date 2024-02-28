import 'package:http/http.dart' as http;

class Providers {
  const Providers._();

  /// Default [http.Client] provider.
  ///
  /// See also:
  ///
  ///  * [HttpClientProvider], which defines this interface.
  static http.Client freshHttpClient() => http.Client();
}

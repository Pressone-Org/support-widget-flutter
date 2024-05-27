import 'dart:io';

import 'package:logger/logger.dart';

Logger logger = Logger();


logSocketError(SocketException error) {
  try {
    logger.e("${error.address}\n"
        "${error.port}\n"
        "${error.message}\n"
        "${error.osError}");
  } catch (e) {
    rethrow;
  }
}

// logResponse(Response response) {
//   try {
//     logger.i("${response.realUri} \n"
//         "${response.headers} \n"
//         "${response.statusCode} ${response.statusMessage} \n"
//         "${response.data}");
//   } catch (e) {
//     rethrow;
//   }
// }

log(Object object) {
  try {
    logger.d(object);
  } catch (e) {
    rethrow;
  }
}

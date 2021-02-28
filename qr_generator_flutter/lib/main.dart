import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:qr_generator_flutter/src/app.dart';

void main() async {
  runApp(ProviderScope(
    child: QrGeneratorApp(),
  ));
}

import 'package:flutter/material.dart';
import 'package:hong_kong_app/app/hong_kong_app.dart';

import 'app/core/config/env/env.dart';

Future<void> main() async {
  await Env.instance.load();
  runApp(const HongKongApp());
}


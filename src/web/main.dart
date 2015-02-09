// Copyright (c) 2015, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';

import 'package:hybrid_dart_test/nav_menu.dart';
import 'package:hybrid_dart_test/reverser.dart';
import 'package:hybrid_dart_test/device_init.dart';
import 'package:hybrid_dart_test/router.dart';

void main() {
  initNavMenu();
  initReverser();
  initDevice();
  initRoutes();
}
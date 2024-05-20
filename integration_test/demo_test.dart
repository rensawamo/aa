import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:patrol/patrol.dart';

import '../lib/main.dart';

void main() {
  patrolTest('demo', ($) async {
    await $.pumpWidgetAndSettle(const MyApp());

    expect(
      $('Flutter Demo Home Page'),
      findsOneWidget,
    );

    expect(
      $('0'),
      findsOneWidget,
    );

    final button = $(FloatingActionButton);

    expect(
      button,
      findsOneWidget,
    );

    await button.tap();

    // 「1」というテキストを含むWidgetが表示されるまで待機
    await $('1').waitUntilVisible();

    expect(
      $('1'),
      findsOneWidget,
    );

    await button.tap();

    await $('2').waitUntilVisible();

    expect(
      $('2'),
      findsOneWidget,
    );
  });
}

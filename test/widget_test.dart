import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:clipboard_test/main.dart';

import 'mock_clipboard.dart';

void main() {
  group('MyApp', () {
    testWidgets('copies "Hello world!" into the clipboard', (tester) async {
      final mockClipboard = MockClipboard();
      tester.binding.defaultBinaryMessenger.setMockMethodCallHandler(
        SystemChannels.platform,
        mockClipboard.handleMethodCall,
      );

      await tester.pumpWidget(const MyApp());
      await tester.tap(find.byType(FloatingActionButton));

      expect(
        mockClipboard.clipboardData,
        {'text': 'Hello world!'},
      );
    });
  });
}

import 'package:flutter/services.dart';

/// Copied from
/// https://github.com/flutter/flutter/blob/be0c1bd0f0cec3aa97c6be279b7beae9d0e8d6be/packages/flutter/test/widgets/clipboard_utils.dart
class MockClipboard {
  MockClipboard({
    this.hasStringsThrows = false,
  });

  final bool hasStringsThrows;

  dynamic clipboardData = <String, dynamic>{
    'text': null,
  };

  Future<Object?> handleMethodCall(MethodCall methodCall) async {
    switch (methodCall.method) {
      case 'Clipboard.getData':
        return clipboardData;
      case 'Clipboard.hasStrings':
        if (hasStringsThrows) {
          throw Exception();
        }
        final Map<String, dynamic>? clipboardDataMap =
            clipboardData as Map<String, dynamic>?;
        final String? text = clipboardDataMap?['text'] as String?;
        return <String, bool>{'value': text != null && text.isNotEmpty};
      case 'Clipboard.setData':
        clipboardData = methodCall.arguments;
        break;
    }
    return null;
  }
}

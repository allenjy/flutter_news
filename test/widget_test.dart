import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_news/main.dart';

void main() {
  testWidgets('bottom navigation contains four tabs', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: MainPage()));

    expect(find.byType(BottomNavigationBar), findsOneWidget);
    expect(find.text('首页'), findsOneWidget);
    expect(find.text('视频'), findsOneWidget);
    expect(find.text('讲讲'), findsOneWidget);
    expect(find.text('我的'), findsOneWidget);
  });
}

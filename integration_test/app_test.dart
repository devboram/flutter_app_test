import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:first_flutter/main.dart';

/*
 통합 테스트 사용 방법 :
 1. project dir 까지 이동
 2. 명령어 실행 : flutter drive --driver integration_Test/driver.dart --target integration_Test/app_Test.dart
 3. 파일 수정 후 Shift + R 앱 다시시작
 */
void main() {
  group('Testing App Performance Tests', () {
    ///ensureInitialized()함수는 통합 테스트 드라이버가 초기화되었는지 확인하고 필요한 경우 다시 초기화합니다.
    final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
    as IntegrationTestWidgetsFlutterBinding;

    binding.framePolicy = LiveTestWidgetsFlutterBindingFramePolicy.fullyLive;

    ///이 테스트는 항목 목록을 정말 빠르게 스크롤한 다음 위로 스크롤합니다
    ///watchPerformance()기능은 동작을 기록하고 다음의 테스트 드라이버로 응답 데이터로 다시 전송됩니다
    // testWidgets('Scrolling test', (tester) async {
    //   await tester.pumpWidget(const TestingApp());
    //
    //   final listFinder = find.byType(ListView);
    //
    //   await binding.watchPerformance(() async {
    //     await tester.fling(listFinder, const Offset(0, -500), 10000);
    //     await tester.pumpAndSettle();
    //
    //     await tester.fling(listFinder, const Offset(0, 500), 10000);
    //     await tester.pumpAndSettle();
    //   }, reportKey: 'scrolling_summary');
    // });


    ///찜하기 수행수 제거 테스트
    testWidgets('Favorites operations test', (tester) async {
      await tester.pumpWidget(const TestingApp());

      final iconKeys = [
        'icon_0',
        'icon_1',
        'icon_2',
      ];

      for (var icon in iconKeys) {
        await tester.tap(find.byKey(ValueKey(icon)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Added to favorites.'), findsOneWidget);
      }

      await tester.tap(find.text('Favorites'));
      await tester.pumpAndSettle();

      final removeIconKeys = [
        'remove_icon_0',
        'remove_icon_1',
        'remove_icon_2',
      ];

      for (final iconKey in removeIconKeys) {
        await tester.tap(find.byKey(ValueKey(iconKey)));
        await tester.pumpAndSettle(const Duration(seconds: 1));

        expect(find.text('Removed from favorites.'), findsOneWidget);
      }
    });
  });
}